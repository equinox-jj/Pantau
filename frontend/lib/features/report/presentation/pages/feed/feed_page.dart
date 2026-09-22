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
import '../../../../../core/utils/helpers/helpers.dart';
import 'listener/listener.dart';
import 'provider/provider.dart';
import 'widgets/widgets.dart';

/// Feed tab — reports as a photo-led list, in two segments: what is around the
/// device, and what the caller reported themselves.
///
/// For the nearby segment the device position is the query, so locating is also
/// the fetch trigger: there is no camera to pan and nothing to show without a
/// fix. The "My reports" segment needs no position and loads on first open.
class FeedPage extends ConsumerStatefulWidget {
  const FeedPage({super.key});

  @override
  ConsumerState<FeedPage> createState() => _FeedPageState();
}

class _FeedPageState extends ConsumerState<FeedPage> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      ref.read(feedProvider.notifier).locate();
    });
  }

  void _handleLocated(LocationResult result) {
    if (result is! LocationSuccess) return;

    ref
        .read(feedProvider.notifier)
        .load(latitude: result.latitude, longitude: result.longitude);
  }

  void _selectTab(FeedTab tab) =>
      ref.read(feedProvider.notifier).selectTab(tab);

  /// Refetches whichever segment is showing. For the nearby list this reuses
  /// the position already queried with — cheaper than re-locating, which is
  /// what the location-error state's action is for.
  Future<void> _refresh() {
    return switch (ref.read(feedProvider).tab) {
      FeedTab.nearby => ref.read(feedProvider.notifier).refresh(),
      FeedTab.mine => ref.read(myReportsProvider.notifier).refresh(),
    };
  }

  void _locate() => ref.read(feedProvider.notifier).locate();

  void _openSettings() => ref.read(feedProvider.notifier).openSettings();

  void _openReport(FeedItem item) {
    final id = item.report.id;
    if (id == null) return;

    context.push(AppRoutes.reportDetailPath(id), extra: item.distanceInMeters);
  }

  void _startReport() => context.push(AppRoutes.createReport);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FeedListener(
        onLocated: _handleLocated,
        child: SafeArea(
          bottom: false,
          child: RefreshIndicator(
            onRefresh: _refresh,
            backgroundColor: AppColors.surfaceRaised,
            color: AppColors.accent,
            child: CustomScrollView(
              // Every state must stay pullable, including the empty ones.
              physics: const AlwaysScrollableScrollPhysics(),
              slivers: [
                SliverToBoxAdapter(
                  child: _FeedHeader(onTabSelected: _selectTab),
                ),
                _FeedBody(
                  onReportTap: _openReport,
                  onRetry: _refresh,
                  onLocate: _locate,
                  onOpenSettings: _openSettings,
                  onStartReport: _startReport,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

/// Screen title, the line describing what the list covers, and the segmented
/// control that picks which list that is.
class _FeedHeader extends StatelessWidget {
  const _FeedHeader({required this.onTabSelected});

  final ValueChanged<FeedTab> onTabSelected;

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
          Text('Feed', style: AppTypography.title.copyWith(fontSize: 24)),
          const Gap(4),
          const _FeedSubtitle(),
          const Gap(AppSpacing.md),
          Consumer(
            builder: (context, ref, _) {
              return FeedTabSelector(
                currentTab: ref.watch(
                  feedProvider.select((state) => state.tab),
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

/// Report count, and what bounds it. Subscribes on its own so a fetch repaints
/// this line alone, not the whole header.
class _FeedSubtitle extends StatelessWidget {
  const _FeedSubtitle();

  @override
  Widget build(BuildContext context) {
    return Consumer(
      builder: (context, ref, _) {
        final tab = ref.watch(feedProvider.select((state) => state.tab));
        final items = switch (tab) {
          FeedTab.nearby => ref.watch(
            feedProvider.select((state) => state.nearbyReports.value),
          ),
          FeedTab.mine => ref.watch(
            myReportsProvider.select((state) => state.value),
          ),
        };
        final fallback = switch (tab) {
          FeedTab.nearby => 'Around you',
          FeedTab.mine => 'Your reports',
        };
        final bound = switch (tab) {
          FeedTab.nearby =>
            '${formatDistance(kFeedRadiusInMeters.toDouble())} radius',
          FeedTab.mine => 'newest first',
        };
        final count = items == null
            ? fallback
            : '${items.length} ${items.length == 1 ? 'report' : 'reports'}';

        return Text(
          '$count · $bound',
          style: AppTypography.mono(fontSize: 11, color: AppColors.textMuted),
        );
      },
    );
  }
}

/// The active list and every state that replaces it: location refused, fetch
/// failed, first load, and nothing to show.
class _FeedBody extends StatelessWidget {
  const _FeedBody({
    required this.onReportTap,
    required this.onRetry,
    required this.onLocate,
    required this.onOpenSettings,
    required this.onStartReport,
  });

  final ValueChanged<FeedItem> onReportTap;
  final VoidCallback onRetry;
  final VoidCallback onLocate;
  final VoidCallback onOpenSettings;
  final VoidCallback onStartReport;

  @override
  Widget build(BuildContext context) {
    return Consumer(
      builder: (context, ref, _) {
        final tab = ref.watch(feedProvider.select((state) => state.tab));

        return switch (tab) {
          FeedTab.nearby => _NearbyBody(
            onReportTap: onReportTap,
            onRetry: onRetry,
            onLocate: onLocate,
            onOpenSettings: onOpenSettings,
            onStartReport: onStartReport,
          ),
          FeedTab.mine => _MyReportsBody(
            onReportTap: onReportTap,
            onRetry: onRetry,
            onStartReport: onStartReport,
          ),
        };
      },
    );
  }
}

class _NearbyBody extends StatelessWidget {
  const _NearbyBody({
    required this.onReportTap,
    required this.onRetry,
    required this.onLocate,
    required this.onOpenSettings,
    required this.onStartReport,
  });

  final ValueChanged<FeedItem> onReportTap;
  final VoidCallback onRetry;
  final VoidCallback onLocate;
  final VoidCallback onOpenSettings;
  final VoidCallback onStartReport;

  @override
  Widget build(BuildContext context) {
    return Consumer(
      builder: (context, ref, _) {
        // Location first: without a fix there is no query, so its outcome
        // outranks whatever the reports state still holds.
        final locationResult = ref.watch(
          feedProvider.select((state) => state.location.value),
        );
        if (locationResult != null && locationResult is! LocationSuccess) {
          return _FeedStateSliver(
            child: _FeedLocationState(
              result: locationResult,
              onRetry: onLocate,
              onOpenSettings: onOpenSettings,
            ),
          );
        }

        // Still waiting on the fix itself — distinct from the skeletons below,
        // which stand for a report fetch that has not started yet.
        final isLocating = ref.watch(
          feedProvider.select((state) => state.location.isLoading),
        );
        if (locationResult == null && isLocating) {
          return const _FeedStateSliver(child: _FeedLocatingState());
        }

        final reports = ref.watch(
          feedProvider.select((state) => state.nearbyReports),
        );

        return switch (reports) {
          AsyncError(error: final error) => _FeedStateSliver(
            child: _FeedErrorState(
              title: 'Could not load the feed',
              error: error,
              onRetry: onRetry,
            ),
          ),
          // A refetch keeps the previous cards; only a first load has nothing
          // to show and falls back to skeletons.
          AsyncValue(isLoading: true, value: null) => const _FeedSkeletonList(),
          AsyncValue<List<FeedItem>>(value: final items?) when items.isEmpty =>
            _FeedStateSliver(
              child: AppEmptyState(
                icon: Icons.subject_outlined,
                title: 'Nothing reported nearby',
                message:
                    'No reports within '
                    '${formatDistance(kFeedRadiusInMeters.toDouble())} of you '
                    'yet. Be the first to flag something.',
                action: AppButton(
                  text: 'Report an issue',
                  fullWidth: false,
                  onPressed: onStartReport,
                ),
              ),
            ),
          AsyncValue<List<FeedItem>>(value: final items?) => _FeedList(
            items: items,
            onReportTap: onReportTap,
          ),
          _ => const _FeedSkeletonList(),
        };
      },
    );
  }
}

/// The caller's own submissions with their current status. No location gate —
/// this list is not anchored to where the device is.
class _MyReportsBody extends StatelessWidget {
  const _MyReportsBody({
    required this.onReportTap,
    required this.onRetry,
    required this.onStartReport,
  });

  final ValueChanged<FeedItem> onReportTap;
  final VoidCallback onRetry;
  final VoidCallback onStartReport;

  @override
  Widget build(BuildContext context) {
    return Consumer(
      builder: (context, ref, _) {
        final reports = ref.watch(myReportsProvider);

        return switch (reports) {
          AsyncError(error: final error) => _FeedStateSliver(
            child: _FeedErrorState(
              title: 'Could not load your reports',
              error: error,
              onRetry: onRetry,
            ),
          ),
          AsyncValue(isLoading: true, value: null) => const _FeedSkeletonList(),
          AsyncValue<List<FeedItem>>(value: final items?) when items.isEmpty =>
            _FeedStateSliver(
              child: AppEmptyState(
                icon: Icons.photo_camera_outlined,
                title: 'You have not reported anything',
                message:
                    'Every report you submit lands here, with its status from '
                    'reported through to resolved.',
                action: AppButton(
                  text: 'Report an issue',
                  fullWidth: false,
                  onPressed: onStartReport,
                ),
              ),
            ),
          AsyncValue<List<FeedItem>>(value: final items?) => _FeedList(
            items: items,
            onReportTap: onReportTap,
          ),
          _ => const _FeedSkeletonList(),
        };
      },
    );
  }
}

class _FeedList extends StatelessWidget {
  const _FeedList({required this.items, required this.onReportTap});

  final List<FeedItem> items;
  final ValueChanged<FeedItem> onReportTap;

  @override
  Widget build(BuildContext context) {
    return SliverPadding(
      padding: const EdgeInsets.fromLTRB(
        AppSpacing.lg,
        AppSpacing.xs2,
        AppSpacing.lg,
        AppSpacing.xl2,
      ),
      sliver: SliverList.separated(
        itemCount: items.length,
        separatorBuilder: (context, index) => const Gap(AppSpacing.sm),
        itemBuilder: (context, index) {
          final item = items[index];

          return FeedReportCard(
            // Keyed by report so a refetch that reorders the list does not
            // leave a recycled card painting the previous report's photo
            // until the new one decodes.
            key: ValueKey<Object>(item.report.id ?? index),
            item: item,
            onTap: () => onReportTap(item),
          );
        },
      ),
    );
  }
}

class _FeedSkeletonList extends StatelessWidget {
  const _FeedSkeletonList();

  /// Enough to fill a phone screen; the rest arrives before it is scrolled to.
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
      // One Skeletonizer over the whole sliver, not one per card: the shimmer
      // is a per-instance ticker, and three of them run out of phase for no
      // visual gain.
      sliver: SliverSkeletonizer(
        child: SliverList.separated(
          itemCount: _placeholderCount,
          separatorBuilder: (context, index) => const Gap(AppSpacing.sm),
          itemBuilder: (context, index) => const FeedSkeletonCard(),
        ),
      ),
    );
  }
}

/// Wraps a full-screen state so it centres in the remaining viewport while
/// staying inside the pull-to-refresh scroll view.
class _FeedStateSliver extends StatelessWidget {
  const _FeedStateSliver({required this.child});

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

/// A failed fetch, worded per segment but recovering the same way.
class _FeedErrorState extends StatelessWidget {
  const _FeedErrorState({
    required this.title,
    required this.error,
    required this.onRetry,
  });

  final String title;
  final Object error;
  final VoidCallback onRetry;

  @override
  Widget build(BuildContext context) {
    return AppEmptyState(
      icon: Icons.cloud_off,
      title: title,
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

/// Explains why the nearby list has no position to query with, and offers the
/// recovery that matches the outcome.
class _FeedLocationState extends StatelessWidget {
  const _FeedLocationState({
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
            'The feed lists what has been reported around you. Enable '
            'location access to see it.',
        actionText: 'Open settings',
        onAction: onOpenSettings,
      ),
      LocationPermissionDenied() => (
        title: 'Location permission needed',
        message: 'Pantau needs your location to list reports around you.',
        actionText: 'Try again',
        onAction: onRetry,
      ),
      LocationServiceDisabled() => (
        title: 'Location services are off',
        message:
            'Turn on location services in your device settings to see '
            'reports around you.',
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

/// Waiting on the device fix itself, not a report fetch — a spinner rather
/// than skeleton cards, so it never reads as content already on its way.
class _FeedLocatingState extends StatelessWidget {
  const _FeedLocatingState();

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
