import 'package:material_ui/material_ui.dart';
import 'package:gap/gap.dart';

import '../../../../core/theme/theme.dart';
import 'onboarding_slide_data.dart';

/// One onboarding carousel slide: illustration + heading + body copy.
class OnboardingSlideView extends StatelessWidget {
  const OnboardingSlideView({super.key, required this.data});

  final OnboardingSlideData data;

  IconData get _icon => switch (data.graphic) {
    OnboardingGraphic.snapPhoto => Icons.camera_alt_outlined,
    OnboardingGraphic.statusTimeline => Icons.timeline_outlined,
    OnboardingGraphic.privacyMap => Icons.shield_outlined,
  };

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          child: Center(
            child: Container(
              width: 220,
              height: 220,
              decoration: BoxDecoration(
                color: AppColors.fillAccent,
                borderRadius: AppRadius.radiusXl,
                border: Border.all(color: AppColors.borderAccent),
              ),
              child: Icon(_icon, size: 88, color: AppColors.accent),
            ),
          ),
        ),
        Text(data.title, style: AppTypography.heading),
        const Gap(AppSpacing.xs),
        Text(data.description, style: AppTypography.body),
      ],
    );
  }
}
