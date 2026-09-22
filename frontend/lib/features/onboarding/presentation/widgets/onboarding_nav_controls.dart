import 'package:material_ui/material_ui.dart';
import 'package:gap/gap.dart';

import '../../../../core/components/button/button.dart';
import '../../../../core/theme/theme.dart';

/// Prev/Next (or Get started) controls at the bottom of the onboarding page.
class OnboardingNavControls extends StatelessWidget {
  const OnboardingNavControls({
    super.key,
    required this.isFirstSlide,
    required this.isLastSlide,
    required this.onPrev,
    required this.onNext,
  });

  final bool isFirstSlide;
  final bool isLastSlide;
  final VoidCallback onPrev;
  final VoidCallback onNext;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        if (!isFirstSlide) ...[
          SizedBox(
            width: AppSpacing.xl4,
            height: AppSpacing.xl4,
            child: IconButton.outlined(
              onPressed: onPrev,
              style: OutlinedButton.styleFrom(
                shape: const RoundedRectangleBorder(
                  borderRadius: AppRadius.radiusLg,
                ),
                side: const BorderSide(color: AppColors.borderDefault),
              ),
              icon: const Icon(Icons.arrow_back),
            ),
          ),
          const Gap(AppSpacing.xs),
        ],
        Expanded(
          child: AppButton(
            text: isLastSlide ? 'Get started' : 'Next',
            trailing: const Icon(Icons.arrow_forward),
            onPressed: onNext,
          ),
        ),
      ],
    );
  }
}
