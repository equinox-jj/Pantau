import 'package:material_ui/material_ui.dart';
import 'package:go_router/go_router.dart';

import '../../widgets/widgets.dart';

/// Authenticated shell: keeps one navigation stack per tab and hosts the
/// bottom tab bar shared by every tab.
class DashboardPage extends StatelessWidget {
  const DashboardPage({super.key, required this.navigationShell});

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
      bottomNavigationBar: DashboardNavBar(
        currentIndex: navigationShell.currentIndex,
        onTabSelected: _onTabSelected,
      ),
    );
  }
}
