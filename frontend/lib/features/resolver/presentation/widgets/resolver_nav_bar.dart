import 'package:material_ui/material_ui.dart';
import 'package:gap/gap.dart';

import '../../../../core/theme/theme.dart';
import 'resolver_tab.dart';

/// Bottom tab bar of the resolver shell. Same visual spec as the citizen
/// dashboard's `DashboardNavBar`, just over `ResolverTab` and with no badge
/// support (nothing in the resolver shell needs one yet).
class ResolverNavBar extends StatelessWidget {
  const ResolverNavBar({
    super.key,
    required this.currentIndex,
    required this.onTabSelected,
  });

  final int currentIndex;
  final ValueChanged<int> onTabSelected;

  static const double _iconSize = 23;

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
            for (final tab in ResolverTab.values)
              Expanded(
                child: _ResolverNavItem(
                  tab: tab,
                  isActive: tab.index == currentIndex,
                  onTap: () => onTabSelected(tab.index),
                ),
              ),
          ],
        ),
      ),
    );
  }
}

class _ResolverNavItem extends StatelessWidget {
  const _ResolverNavItem({
    required this.tab,
    required this.isActive,
    required this.onTap,
  });

  final ResolverTab tab;
  final bool isActive;
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
              Icon(
                isActive ? tab.activeIcon : tab.icon,
                size: ResolverNavBar._iconSize,
                color: color,
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
