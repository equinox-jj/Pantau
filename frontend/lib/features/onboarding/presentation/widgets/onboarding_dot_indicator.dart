import 'package:material_ui/material_ui.dart';

import '../../../../core/theme/theme.dart';

/// Tap-able progress dots for the onboarding carousel.
class OnboardingDotIndicator extends StatelessWidget {
  const OnboardingDotIndicator({
    super.key,
    required this.count,
    required this.activeIndex,
    this.onDotTap,
  });

  final int count;
  final int activeIndex;
  final ValueChanged<int>? onDotTap;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 7,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemCount: count,
        itemBuilder: (context, index) {
          final isActive = index == activeIndex;

          return GestureDetector(
            onTap: onDotTap == null ? null : () => onDotTap!(index),
            child: Container(
              margin: const EdgeInsets.symmetric(horizontal: 4),
              width: isActive ? 22 : 7,
              height: 7,
              decoration: BoxDecoration(
                color: isActive ? AppColors.accent : AppColors.fillSubtle,
                borderRadius: AppRadius.radiusFull,
              ),
            ),
          );
        },
      ),
    );
  }
}
