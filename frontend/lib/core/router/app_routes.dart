/// Top-level route paths, shared by [GoRouter] configuration and every
/// screen/notifier that navigates.
abstract final class AppRoutes {
  static const String splash = '/splash';
  static const String onboarding = '/onboarding';
  static const String login = '/login';
  static const String register = '/register';

  /// Full-screen compose flow, pushed over the dashboard shell.
  static const String createReport = '/create-report';

  /// Full-screen pin placement, pushed over the compose flow. Segment only —
  /// it is declared as a child of [createReport].
  static const String locationPickerSegment = 'location';
  static const String locationPicker = '$createReport/$locationPickerSegment';

  /// Full-screen report detail, pushed over the dashboard shell.
  static const String reportDetail = '/reports/:id';

  /// Path for [reportDetail] with [id] filled in.
  static String reportDetailPath(String id) => '/reports/$id';

  // Dashboard shell — one branch (and one navigation stack) per tab.
  static const String map = '/map';
  static const String feed = '/feed';
  static const String profile = '/profile';

  /// Entry point of the authenticated shell: the map tab.
  static const String dashboard = map;

  // Resolver dashboard shell — one branch per tab, mirrors the citizen shell
  // above but for the resolver role.
  static const String queue = '/queue';
  static const String resolverMap = '/resolver/map';
  static const String resolverProfile = '/resolver/profile';

  /// Entry point of the resolver shell: the queue tab.
  static const String resolverDashboard = queue;

  static const List<String> all = [
    splash,
    onboarding,
    login,
    register,
    createReport,
    locationPicker,
    reportDetail,
    map,
    feed,
    profile,
    queue,
    resolverMap,
    resolverProfile,
  ];
}
