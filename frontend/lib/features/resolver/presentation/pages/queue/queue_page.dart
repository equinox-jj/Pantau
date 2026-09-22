import 'package:material_ui/material_ui.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:skeletonizer/skeletonizer.dart';

import '../../../../../core/components/button/button.dart';
import '../../../../../core/components/empty_state/empty_state.dart';
import '../../../../../core/error/error.dart';
import '../../../../../core/router/app_routes.dart';
import '../../../../../core/service/service.dart';
import '../../../../../core/theme/theme.dart';
import '../../../../../core/utils/enums/enums.dart';
import '../../../domain/entity/resolver_entity.dart';
import '../../provider/provider.dart';
import 'listener/listener.dart';
import 'provider/provider.dart';
import 'widgets/queue_widgets.dart';

/// How close to the bottom of the list (in pixels) triggers the next page.
const double _kLoadMoreThreshold = 240;

/// Queue tab — reports waiting on the resolver, nearest first, split into
/// Open / In progress / Resolved.
///
/// Like the citizen feed, the device position is the query, so locating is
/// also the fetch trigger.
class QueuePage extends ConsumerStatefulWidget {
  const QueuePage({super.key});

  @override
  ConsumerState<QueuePage> createState() => _QueuePageState();
}

class _QueuePageState extends ConsumerState<QueuePage> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      ref.read(resolverLocationProvider.notifier).locate();
    });
  }

  void _handleLocated(LocationResult result) {
    if (result is! LocationSuccess) return;

    final tab = ref.read(queueProvider).tab;
    ref
        .read(queueProvider.notifier)
        .load(tab: tab, latitude: result.latitude, longitude: result.longitude);
  }

  void _selectTab(QueueTab tab) {
    ref.read(queueProvider.notifier).selectTab(tab);

    final locationResult = ref.read(
      resolverLocationProvider.select((state) => state.value),
    );
    if (locationResult is LocationSuccess) {
      ref
          .read(queueProvider.notifier)
          .load(
            tab: tab,
            latitude: locationResult.latitude,
            longitude: locationResult.longitude,
          );
    }
  }

  Future<void> _refresh() => ref.read(queueProvider.notifier).refresh();

  void _locate() => ref.read(resolverLocationProvider.notifier).locate();

  void _openSettings() =>
      ref.read(resolverLocationProvider.notifier).openSettings();

  /// Pushes the shared detail screen and refreshes on return — unconditional
  /// (rather than threading a "did anything change" flag back through the
  /// route) since a resolver can back out having changed nothing just as
  /// easily as having advanced the status, and a refetch is cheap.
  Future<void> _openReport(QueueReport report) async {
    final id = report.id;
    if (id == null) return;

    await context.push(
      AppRoutes.reportDetailPath(id),
      extra: report.distanceMeter,
    );
    if (!mounted) return;

    ref.read(queueProvider.notifier).refresh();
  }

  bool _handleScroll(ScrollNotification notification) {
    final metrics = notification.metrics;
    if (metrics.maxScrollExtent - metrics.pixels <= _kLoadMoreThreshold) {
      ref.read(queueProvider.notifier).loadMore();
    }

    return false;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: QueueListener(
        onLocated: _handleLocated,
        child: SafeArea(
          bottom: false,
          child: RefreshIndicator(
            onRefresh: _refresh,
            backgroundColor: AppColors.surfaceRaised,
            color: AppColors.accent,
            child: NotificationListener<ScrollNotification>(
              onNotification: _handleScroll,
              child: CustomScrollView(
                physics: const AlwaysScrollableScrollPhysics(),
                slivers: [
                  SliverToBoxAdapter(
                    child: _QueueHeader(onTabSelected: _selectTab),
                  ),
                  _QueueBody(
                    onRetry: _refresh,
                    onLocate: _locate,
                    onOpenSettings: _openSettings,
                    onOpenReport: _openReport,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

/// Screen title and the segmented control that picks the tab, each segment
/// carrying its own count from the most recent response.
class _QueueHeader extends StatelessWidget {
  const _QueueHeader({required this.onTabSelected});

  final ValueChanged<QueueTab> onTabSelected;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(
        AppSpacing.lg,
        AppSpacing.md,
        AppSpacing.lg,
        AppSpacing.sm,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Queue', style: AppTypography.title.copyWith(fontSize: 24)),
          const Gap(4),
          Text(
            'Reports around you',
            style: AppTypography.mono(fontSize: 11, color: AppColors.textMuted),
          ),
          const Gap(AppSpacing.md),
          Consumer(
            builder: (context, ref, _) {
              return QueueTabSelector(
                currentTab: ref.watch(
                  queueProvider.select((state) => state.tab),
                ),
                counts: ref.watch(
                  queueProvider.select((state) => state.queue.value?.counts),
                ),
                onTabSelected: onTabSelected,
              );
            },
          ),
        ],
      ),
    );
  }
}

class _QueueBody extends StatelessWidget {
  const _QueueBody({
    required this.onRetry,
    required this.onLocate,
    required this.onOpenSettings,
    required this.onOpenReport,
  });

  final VoidCallback onRetry;
  final VoidCallback onLocate;
  final VoidCallback onOpenSettings;
  final ValueChanged<QueueReport> onOpenReport;

  @override
  Widget build(BuildContext context) {
    return Consumer(
      builder: (context, ref, _) {
        // Location first: without a fix there is no query, so its outcome
        // outranks whatever the queue state still holds.
        final locationResult = ref.watch(
          resolverLocationProvider.select((state) => state.value),
        );
        if (locationResult != null && locationResult is! LocationSuccess) {
          return _QueueStateSliver(
            child: _QueueLocationState(
              result: locationResult,
              onRetry: onLocate,
              onOpenSettings: onOpenSettings,
            ),
          );
        }

        final isLocating = ref.watch(
          resolverLocationProvider.select((state) => state.isLoading),
        );
        if (locationResult == null && isLocating) {
          return const _QueueStateSliver(child: _QueueLocatingState());
        }

        final queue = ref.watch(queueProvider.select((state) => state.queue));

        return switch (queue) {
          AsyncError(error: final error) => _QueueStateSliver(
            child: _QueueErrorState(error: error, onRetry: onRetry),
          ),
          AsyncValue(isLoading: true, value: null) =>
            const _QueueSkeletonList(),
          AsyncValue<QueueListState>(value: final data?)
              when data.items.isEmpty =>
            const _QueueStateSliver(
              child: AppEmptyState(
                icon: Icons.inbox_outlined,
                title: 'Nothing in this tab',
                message: 'No reports here right now — check back later.',
              ),
            ),
          AsyncValue<QueueListState>(value: final data?) => _QueueList(
            data: data,
            onOpenReport: onOpenReport,
          ),
          _ => const _QueueSkeletonList(),
        };
      },
    );
  }
}

class _QueueList extends StatelessWidget {
  const _QueueList({required this.data, required this.onOpenReport});

  final QueueListState data;
  final ValueChanged<QueueReport> onOpenReport;

  @override
  Widget build(BuildContext context) {
    final items = data.items;

    return SliverPadding(
      padding: const EdgeInsets.fromLTRB(
        AppSpacing.lg,
        AppSpacing.xs2,
        AppSpacing.lg,
        AppSpacing.xl2,
      ),
      sliver: SliverList.separated(
        itemCount: items.length + (data.hasNext ? 1 : 0),
        separatorBuilder: (context, index) => const Gap(AppSpacing.sm),
        itemBuilder: (context, index) {
          if (index >= items.length) return const _QueueLoadMoreRow();

          final item = items[index];

          return QueueReportCard(
            key: ValueKey<Object>(item.id ?? index),
            report: item,
            onTap: () => onOpenReport(item),
          );
        },
      ),
    );
  }
}

class _QueueLoadMoreRow extends StatelessWidget {
  const _QueueLoadMoreRow();

  @override
  Widget build(BuildContext context) {
    return Consumer(
      builder: (context, ref, _) {
        final queueState = ref.watch(
          queueProvider.select((state) => state.queue.value),
        );

        if (queueState != null && queueState.isLoadingMore) {
          return const Padding(
            padding: EdgeInsets.symmetric(vertical: AppSpacing.md),
            child: Center(
              child: SizedBox(
                width: 20,
                height: 20,
                child: CircularProgressIndicator(
                  strokeWidth: 2,
                  color: AppColors.accent,
                ),
              ),
            ),
          );
        }

        if (queueState != null && queueState.loadMoreFailed) {
          return Center(
            child: TextButton(
              onPressed: () => ref.read(queueProvider.notifier).loadMore(),
              child: const Text("Couldn't load more — retry"),
            ),
          );
        }

        // Idle: an invisible sentinel that still occupies the trailing list
        // slot so the scroll-notification threshold can reach it.
        return const SizedBox(height: AppSpacing.md);
      },
    );
  }
}

class _QueueSkeletonList extends StatelessWidget {
  const _QueueSkeletonList();

  static const _placeholderCount = 3;

  @override
  Widget build(BuildContext context) {
    return SliverPadding(
      padding: const EdgeInsets.fromLTRB(
        AppSpacing.lg,
        AppSpacing.xs2,
        AppSpacing.lg,
        AppSpacing.xl2,
      ),
      sliver: SliverSkeletonizer(
        child: SliverList.separated(
          itemCount: _placeholderCount,
          separatorBuilder: (context, index) => const Gap(AppSpacing.sm),
          itemBuilder: (context, index) => const QueueSkeletonCard(),
        ),
      ),
    );
  }
}

class _QueueStateSliver extends StatelessWidget {
  const _QueueStateSliver({required this.child});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return SliverFillRemaining(
      hasScrollBody: false,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: AppSpacing.xl2),
        child: child,
      ),
    );
  }
}

class _QueueErrorState extends StatelessWidget {
  const _QueueErrorState({required this.error, required this.onRetry});

  final Object error;
  final VoidCallback onRetry;

  @override
  Widget build(BuildContext context) {
    return AppEmptyState(
      icon: Icons.cloud_off,
      title: 'Could not load the queue',
      message: error is Failure
          ? (error as Failure).displayMessage
          : 'Check your connection and try again.',
      action: AppButton(
        text: 'Try again',
        fullWidth: false,
        onPressed: onRetry,
      ),
    );
  }
}

class _QueueLocationState extends StatelessWidget {
  const _QueueLocationState({
    required this.result,
    required this.onRetry,
    required this.onOpenSettings,
  });

  final LocationResult result;
  final VoidCallback onRetry;
  final VoidCallback onOpenSettings;

  @override
  Widget build(BuildContext context) {
    final (:title, :message, :actionText, :onAction) = switch (result) {
      LocationPermissionDeniedForever() => (
        title: 'Location is switched off',
        message:
            'The queue lists what needs attention around you. Enable '
            'location access to see it.',
        actionText: 'Open settings',
        onAction: onOpenSettings,
      ),
      LocationPermissionDenied() => (
        title: 'Location permission needed',
        message: 'Pantau needs your location to list the queue around you.',
        actionText: 'Try again',
        onAction: onRetry,
      ),
      LocationServiceDisabled() => (
        title: 'Location services are off',
        message:
            'Turn on location services in your device settings to see the '
            'queue.',
        actionText: 'Try again',
        onAction: onRetry,
      ),
      // LocationFailed; LocationSuccess never reaches this widget.
      _ => (
        title: 'Could not get your location',
        message: LocationFailed.message,
        actionText: 'Try again',
        onAction: onRetry,
      ),
    };

    return AppEmptyState(
      icon: Icons.location_off_outlined,
      title: title,
      message: message,
      action: AppButton(
        text: actionText,
        fullWidth: false,
        onPressed: onAction,
      ),
    );
  }
}

class _QueueLocatingState extends StatelessWidget {
  const _QueueLocatingState();

  static const _spinnerSize = 34.0;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const SizedBox(
            width: _spinnerSize,
            height: _spinnerSize,
            child: CircularProgressIndicator(
              strokeWidth: 2,
              color: AppColors.accent,
            ),
          ),
          const Gap(AppSpacing.md),
          Text(
            'Locating your position…',
            style: AppTypography.mono(color: AppColors.textMuted),
          ),
        ],
      ),
    );
  }
}
