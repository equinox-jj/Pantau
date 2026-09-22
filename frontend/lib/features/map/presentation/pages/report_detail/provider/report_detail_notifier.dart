import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../../../../core/base/base.dart';
import '../../../../../../core/utils/enums/enums.dart';
import '../../../../../auth/di/di.dart';
import '../../../../di/di.dart';
import '../../../../domain/entity/entity.dart';
import '../../../../domain/usecase/usecase.dart';

part 'report_detail_notifier.freezed.dart';
part 'report_detail_notifier.g.dart';

/// How a timeline node renders: a completed transition, the state the report
/// sits in now, or a step it has not reached yet.
enum TimelineStepState { done, current, future }

/// One row of the status timeline.
typedef TimelineStep = ({
  ReportStatus status,
  DateTime? time,
  String? note,
  TimelineStepState state,
});

/// The happy-path ladder every report walks. Steps the report has not reached
/// are still shown, greyed, so the loop is visible end to end.
const List<ReportStatus> _statusLadder = [
  ReportStatus.reported,
  ReportStatus.acknowledged,
  ReportStatus.inProgress,
  ReportStatus.resolved,
];

/// Everything one visit to the report detail screen shows: the report, its
/// history-derived timeline, whether the viewer may advance its status, and
/// an in-flight status change.
@freezed
abstract class ReportDetailPageState with _$ReportDetailPageState {
  const factory ReportDetailPageState({
    @Default(AsyncLoading()) AsyncValue<ReportDetail> detail,
    @Default(AsyncLoading()) AsyncValue<List<StatusHistoryEntry>> history,

    /// [history] merged with [_statusLadder]. Kept as its own field rather
    /// than a getter so a detail-only refetch (or an unrelated field change)
    /// does not recompute or re-identity this list — see `MapPageState`'s
    /// `filteredReports` for the same reasoning.
    @Default(AsyncLoading()) AsyncValue<List<TimelineStep>> timeline,

    /// Whether the signed-in user is a resolver, read from the locally
    /// cached role — the same lookup `Splash` uses to decide which shell to
    /// land in. Gates [ReportStatusActionPanel]: a citizen viewing this same
    /// shared detail page never sees the status-change action.
    @Default(AsyncLoading()) AsyncValue<bool> isResolver,

    /// Same one-shot shape as `CreateReport` — one in-flight submission per
    /// detail-page visit, reset the moment the page is left (this notifier
    /// is autodispose, no `keepAlive`).
    @Default(AsyncData(null)) AsyncValue<ReportDetail?> updateStatus,
  }) = _ReportDetailPageState;
}

/// Owns everything the report detail screen for [reportId] shows.
///
/// A family rather than a page-global notifier: the id is fixed for the
/// whole life of one detail-screen visit (never re-parameterised in place),
/// so keying by it here is what auto-disposes the right instance when the
/// screen is popped and gives each visit to a different report a clean
/// slate.
@riverpod
class ReportDetailNotifier extends _$ReportDetailNotifier {
  @override
  ReportDetailPageState build(String reportId) {
    // Scheduled rather than called inline because a notifier may not touch
    // `state` while it is building.
    Future.microtask(() {
      _loadDetail();
      _loadHistory();
      _loadIsResolver();
    });

    return const ReportDetailPageState();
  }

  Future<void> _loadDetail() async {
    final usecase = ref.read(getReportDetailUsecaseProvider);
    final result = await usecase(GetReportDetailParams(id: reportId));
    if (!ref.mounted) return;

    result.fold(
      (failure) => state = state.copyWith(
        detail: AsyncError<ReportDetail>(failure, StackTrace.current),
      ),
      (detail) {
        state = state.copyWith(detail: AsyncData(detail));
        _maybeComputeTimeline();
      },
    );
  }

  Future<void> _loadHistory() async {
    final usecase = ref.read(getReportHistoryUsecaseProvider);
    final result = await usecase(GetReportHistoryParams(id: reportId));
    if (!ref.mounted) return;

    result.fold(
      (failure) {
        final error = AsyncError<List<StatusHistoryEntry>>(
          failure,
          StackTrace.current,
        );
        state = state.copyWith(
          history: error,
          timeline: AsyncError<List<TimelineStep>>(failure, StackTrace.current),
        );
      },
      (entries) {
        state = state.copyWith(history: AsyncData(entries));
        _maybeComputeTimeline();
      },
    );
  }

  Future<void> _loadIsResolver() async {
    final usecase = ref.read(getCachedRoleUsecaseProvider);
    final result = await usecase(const NoParams());
    if (!ref.mounted) return;

    state = state.copyWith(
      isResolver: AsyncData(
        result.fold((_) => false, (role) => role == UserRole.resolver),
      ),
    );
  }

  /// Merges [history] with [_statusLadder] once both it and (when needed)
  /// [detail] have landed. A report with no history still has a status, so
  /// the empty-history branch borrows it from `detail` rather than showing
  /// nothing — `detail` is only touched here, so the timeline's own loading
  /// state never ties itself to the detail card's.
  void _maybeComputeTimeline() {
    final history = state.history;
    if (history case AsyncError(:final error, :final stackTrace)) {
      state = state.copyWith(timeline: AsyncError(error, stackTrace));
      return;
    }
    if (!history.hasValue) return;

    final entries = history.value!;
    if (entries.isEmpty) {
      final detail = state.detail;
      if (detail case AsyncError(:final error, :final stackTrace)) {
        state = state.copyWith(timeline: AsyncError(error, stackTrace));
        return;
      }
      if (!detail.hasValue) return;

      state = state.copyWith(
        timeline: AsyncData(_buildSteps(entries, detail.value)),
      );
      return;
    }

    state = state.copyWith(timeline: AsyncData(_buildSteps(entries, null)));
  }

  List<TimelineStep> _buildSteps(
    List<StatusHistoryEntry> history,
    ReportDetail? detailForEmptyHistory,
  ) {
    final steps = <TimelineStep>[];

    if (history.isEmpty) {
      final detail = detailForEmptyHistory!;
      steps.add((
        status: detail.status,
        time: detail.createdAt,
        note: null,
        state: TimelineStepState.current,
      ));
    } else {
      for (var index = 0; index < history.length; index++) {
        final entry = history[index];
        final isLast = index == history.length - 1;
        // A status off the happy-path ladder (rejected, closed) is terminal
        // — nothing is pending after it, so it renders as a completed node
        // with its own icon rather than the "awaiting next step" dot.
        final isTerminal = !_statusLadder.contains(entry.toStatus);
        steps.add((
          status: entry.toStatus,
          time: entry.createdAt,
          note: entry.note,
          state: isLast && !isTerminal
              ? TimelineStepState.current
              : TimelineStepState.done,
        ));
      }
    }

    final currentStatus = steps.last.status;
    final currentIndex = _statusLadder.indexOf(currentStatus);
    // Rejected, closed and unknown all leave the ladder: nothing is pending.
    if (currentIndex == -1) return steps;

    final reached = steps.map((step) => step.status).toSet();
    for (var index = currentIndex + 1; index < _statusLadder.length; index++) {
      final status = _statusLadder[index];
      if (reached.contains(status)) continue;

      steps.add((
        status: status,
        time: null,
        note: null,
        state: TimelineStepState.future,
      ));
    }

    return steps;
  }

  /// Replays both [_loadDetail] and [_loadHistory]. Used by the page's
  /// pull-to-refresh and the detail card's retry action — both need the
  /// whole screen current, not just one card.
  Future<void> refresh() => Future.wait([_loadDetail(), _loadHistory()]);

  /// Replays only [_loadHistory] (which also recomputes [timeline]). Used by
  /// the timeline card's own retry action: the history call is the only one
  /// that card makes, so a retry there should not also re-fetch the detail
  /// card's data.
  Future<void> reloadHistory() => _loadHistory();

  Future<void> submitStatus({
    required ReportStatus toStatus,
    String? note,
  }) async {
    state = state.copyWith(updateStatus: const AsyncLoading());

    final result = await ref.read(updateReportStatusUsecaseProvider)(
      UpdateReportStatusParams(id: reportId, toStatus: toStatus, note: note),
    );
    if (!ref.mounted) return;

    result.fold(
      (l) => state = state.copyWith(
        updateStatus: AsyncError<ReportDetail?>(l, StackTrace.current),
      ),
      (r) => state = state.copyWith(updateStatus: AsyncData(r)),
    );
  }
}
