import 'package:material_ui/material_ui.dart';
import 'package:go_router/go_router.dart';

import '../../widgets/resolver_nav_bar.dart';

/// Authenticated shell for the resolver role: keeps one navigation stack per
/// tab and hosts the bottom tab bar shared by Queue and Profile.
class ResolverShellPage extends StatelessWidget {
  const ResolverShellPage({super.key, required this.navigationShell});

  final StatefulNavigationShell navigationShell;

  void _onTabSelected(int index) {
    // Re-tapping the active tab pops that branch back to its root.
    navigationShell.goBranch(
      index,
      initialLocation: index == navigationShell.currentIndex,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: navigationShell,
      bottomNavigationBar: ResolverNavBar(
        currentIndex: navigationShell.currentIndex,
        onTabSelected: _onTabSelected,
      ),
    );
  }
}
