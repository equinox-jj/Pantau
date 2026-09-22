import 'package:material_ui/material_ui.dart';

/// The three resolver tabs of the resolver shell, in bar order.
///
/// Index order must match the branch order of the resolver
/// `StatefulShellRoute` in `app_router.dart`.
enum ResolverTab {
  queue(
    label: 'Queue',
    icon: Icons.assignment_outlined,
    activeIcon: Icons.assignment,
  ),
  map(label: 'Map', icon: Icons.map_outlined, activeIcon: Icons.map),
  profile(
    label: 'Profile',
    icon: Icons.person_outline,
    activeIcon: Icons.person,
  );

  const ResolverTab({
    required this.label,
    required this.icon,
    required this.activeIcon,
  });

  final String label;
  final IconData icon;
  final IconData activeIcon;
}
