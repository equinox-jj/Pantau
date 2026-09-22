import 'package:material_ui/material_ui.dart';
import 'package:gap/gap.dart';

import '../../../../core/theme/theme.dart';
import 'dashboard_tab.dart';

/// Bottom tab bar of the dashboard shell.
///
/// Spec: pad 8/14 · icon 23 · label 10.5 · active accent · badge 8 + ring 2.
/// Colour is always paired with a label, never carrying meaning alone.
class DashboardNavBar extends StatelessWidget {
  const DashboardNavBar({
    super.key,
    required this.currentIndex,
    required this.onTabSelected,
    this.badgedTabs = const {},
  });

  final int currentIndex;
  final ValueChanged<int> onTabSelected;

  /// Tabs showing an unread dot (e.g. a status change on one of the caller's
  /// own reports, which live in the feed's "My reports" segment).
  final Set<DashboardTab> badgedTabs;

  @override
  Widget build(BuildContext context) {
    final bottomInset = MediaQuery.paddingOf(context).bottom;

    return DecoratedBox(
      decoration: const BoxDecoration(
        color: AppColors.surfaceSunken,
        border: Border(top: BorderSide(color: AppColors.borderHairline)),
      ),
      child: Padding(
        padding: EdgeInsets.fromLTRB(
          AppSpacing.sm,
          AppSpacing.xs2,
          AppSpacing.sm,
          AppSpacing.xs + bottomInset,
        ),
        child: Row(
          children: [
            for (final tab in DashboardTab.values)
              Expanded(
                child: _DashboardNavItem(
                  tab: tab,
                  isActive: tab.index == currentIndex,
                  hasBadge: badgedTabs.contains(tab),
                  onTap: () => onTabSelected(tab.index),
                ),
              ),
          ],
        ),
      ),
    );
  }
}

class _DashboardNavItem extends StatelessWidget {
  const _DashboardNavItem({
    required this.tab,
    required this.isActive,
    required this.hasBadge,
    required this.onTap,
  });

  static const double _iconSize = 23;
  static const double _badgeSize = 8;

  final DashboardTab tab;
  final bool isActive;
  final bool hasBadge;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final color = isActive ? AppColors.accent : AppColors.textMuted;

    return Semantics(
      button: true,
      selected: isActive,
      label: tab.label,
      child: InkResponse(
        onTap: onTap,
        radius: AppSpacing.xl2,
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: AppSpacing.xs2),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Stack(
                clipBehavior: Clip.none,
                children: [
                  Icon(
                    isActive ? tab.activeIcon : tab.icon,
                    size: _iconSize,
                    color: color,
                  ),
                  if (hasBadge)
                    Positioned(
                      top: -3,
                      right: -3,
                      child: Container(
                        width: _badgeSize,
                        height: _badgeSize,
                        decoration: BoxDecoration(
                          color: AppColors.statusInProgress,
                          shape: BoxShape.circle,
                          border: Border.all(
                            color: AppColors.surfaceSunken,
                            width: 2,
                          ),
                        ),
                      ),
                    ),
                ],
              ),
              const Gap(5),
              Text(
                tab.label,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: AppTypography.label.copyWith(
                  fontSize: 10.5,
                  fontWeight: isActive ? FontWeight.w700 : FontWeight.w600,
                  color: color,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
