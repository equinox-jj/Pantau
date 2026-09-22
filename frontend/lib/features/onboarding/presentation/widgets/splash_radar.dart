import 'package:material_ui/material_ui.dart';

import '../../../../core/theme/theme.dart';

/// Decorative radar-sweep animation shown on the splash screen. Purely
/// cosmetic — does not request location permissions or read GPS.
class SplashRadar extends StatefulWidget {
  const SplashRadar({super.key});

  @override
  State<SplashRadar> createState() => _SplashRadarState();
}

class _SplashRadarState extends State<SplashRadar>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller = AnimationController(
    vsync: this,
    duration: const Duration(milliseconds: 4200),
  )..repeat();

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 220,
      height: 220,
      child: Center(
        child: RotationTransition(
          turns: _controller,
          child: Container(
            width: 160,
            height: 160,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              gradient: SweepGradient(
                colors: [
                  AppColors.accent.withValues(alpha: 0.35),
                  Colors.transparent,
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
