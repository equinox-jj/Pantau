import 'package:material_ui/material_ui.dart';

/// The three citizen tabs of the dashboard shell, in bar order.
///
/// Index order must match the branch order of the `StatefulShellRoute` in
/// `app_router.dart`.
enum DashboardTab {
  map(label: 'Map', icon: Icons.place_outlined, activeIcon: Icons.place),
  feed(label: 'Feed', icon: Icons.subject_outlined, activeIcon: Icons.subject),
  profile(
    label: 'Profile',
    icon: Icons.person_outline,
    activeIcon: Icons.person,
  );

  const DashboardTab({
    required this.label,
    required this.icon,
    required this.activeIcon,
  });

  final String label;
  final IconData icon;
  final IconData activeIcon;
}
