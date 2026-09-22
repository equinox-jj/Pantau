import 'package:material_ui/material_ui.dart';

import '../../../../../core/theme/theme.dart';
import '../../widgets/widgets.dart';
import 'listener/listener.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SplashListener(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SplashRadar(),
              const SizedBox(height: AppSpacing.xl2),
              Text('Pantau', style: AppTypography.display),
              const SizedBox(height: AppSpacing.xs2),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: AppSpacing.xl2),
                child: Text(
                  'See it. Report it. Track it all the way to resolved.',
                  style: AppTypography.body,
                  textAlign: TextAlign.center,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
