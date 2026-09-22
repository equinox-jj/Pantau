import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../features/auth/presentation/pages/login/login.dart';
import '../../features/auth/presentation/pages/register/register.dart';
import '../../features/dashboard/presentation/pages/dashboard/dashboard.dart';
import '../../features/map/domain/entity/entity.dart';
import '../../features/map/presentation/pages/create_report/create_report.dart';
import '../../features/map/presentation/pages/location_picker/location_picker.dart';
import '../../features/map/presentation/pages/map/map.dart';
import '../../features/map/presentation/pages/report_detail/report_detail.dart';
import '../../features/onboarding/presentation/pages/onboarding/onboarding.dart';
import '../../features/onboarding/presentation/pages/splash/splash.dart';
import '../../features/profile/presentation/pages/profile/profile.dart';
import '../../features/report/presentation/pages/feed/feed.dart';
import '../../features/resolver/presentation/pages/map/map.dart';
import '../../features/resolver/presentation/pages/queue/queue.dart';
import '../../features/resolver/presentation/pages/shell/shell.dart';
import '../di/core_di.dart';
import 'app_routes.dart';

final _rootNavigatorKey = GlobalKey<NavigatorState>();

final appRouterProvider = Provider<GoRouter>((ref) {
  final router = GoRouter(
    navigatorKey: _rootNavigatorKey,
    debugLogDiagnostics: kDebugMode,
    initialLocation: AppRoutes.splash,
    routes: [
      GoRoute(
        path: AppRoutes.splash,
        builder: (context, state) => const SplashPage(),
      ),
      GoRoute(
        path: AppRoutes.onboarding,
        builder: (context, state) => const OnboardingPage(),
      ),
      GoRoute(
        path: AppRoutes.login,
        builder: (context, state) => const LoginPage(),
      ),
      GoRoute(
        path: AppRoutes.register,
        builder: (context, state) => const RegisterPage(),
      ),
      GoRoute(
        path: AppRoutes.createReport,
        parentNavigatorKey: _rootNavigatorKey,
        // A rejected report's "Edit & resubmit" hands its own detail over as
        // `extra` to pre-fill the form; a fresh report from the map/feed has
        // none.
        builder: (context, state) => CreateReportPage(
          initialReport: state.extra is ReportDetail
              ? state.extra as ReportDetail?
              : null,
        ),
        routes: [
          GoRoute(
            path: AppRoutes.locationPickerSegment,
            parentNavigatorKey: _rootNavigatorKey,
            // `extra` carries the pin already chosen, so reopening the picker
            // resumes where the form left off; a cold deep link has none and
            // the page locates the device instead.
            builder: (context, state) => LocationPickerPage(
              initialLocation: state.extra is PickedLocation
                  ? state.extra as PickedLocation?
                  : null,
            ),
          ),
        ],
      ),
      GoRoute(
        path: AppRoutes.reportDetail,
        parentNavigatorKey: _rootNavigatorKey,
        builder: (context, state) => ReportDetailPage(
          reportId: state.pathParameters['id'] ?? '',
          // The map and the feed hand over the distance they already computed;
          // a cold deep link has no extra, and the line is dropped.
          distanceInMeters: state.extra is double
              ? state.extra as double?
              : null,
        ),
      ),
      StatefulShellRoute.indexedStack(
        builder: (context, state, navigationShell) =>
            DashboardPage(navigationShell: navigationShell),
        branches: [
          StatefulShellBranch(
            routes: [
              GoRoute(
                path: AppRoutes.map,
                builder: (context, state) => const MapPage(),
              ),
            ],
          ),
          StatefulShellBranch(
            routes: [
              GoRoute(
                path: AppRoutes.feed,
                builder: (context, state) => const FeedPage(),
              ),
            ],
          ),
          StatefulShellBranch(
            routes: [
              GoRoute(
                path: AppRoutes.profile,
                builder: (context, state) => const ProfilePage(),
              ),
            ],
          ),
        ],
      ),
      StatefulShellRoute.indexedStack(
        builder: (context, state, navigationShell) =>
            ResolverShellPage(navigationShell: navigationShell),
        branches: [
          StatefulShellBranch(
            routes: [
              GoRoute(
                path: AppRoutes.queue,
                builder: (context, state) => const QueuePage(),
              ),
            ],
          ),
          StatefulShellBranch(
            routes: [
              GoRoute(
                path: AppRoutes.resolverMap,
                builder: (context, state) => const ResolverMapPage(),
              ),
            ],
          ),
          StatefulShellBranch(
            routes: [
              GoRoute(
                path: AppRoutes.resolverProfile,
                builder: (context, state) => const ProfilePage(),
              ),
            ],
          ),
        ],
      ),
    ],
  );

  // AuthInterceptor clears the token on a 401 and fires here; bounce the user
  // out of the authenticated shell so they can sign in again.
  final subscription = ref
      .watch(sessionManagerProvider)
      .onSessionExpired
      .listen((_) => router.go(AppRoutes.login));

  ref.onDispose(subscription.cancel);

  return router;
});
