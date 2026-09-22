import 'package:material_ui/material_ui.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gap/gap.dart';

import '../../../../../core/theme/theme.dart';
import '../../widgets/widgets.dart';
import 'listener/listener.dart';
import 'provider/provider.dart';

class OnboardingPage extends ConsumerStatefulWidget {
  const OnboardingPage({super.key});

  @override
  ConsumerState<OnboardingPage> createState() => _OnboardingPageState();
}

class _OnboardingPageState extends ConsumerState<OnboardingPage> {
  final _pageController = PageController();

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  void _goToIndex(int index) {
    ref.read(onboardingProvider.notifier).goTo(index);

    _pageController.animateToPage(
      index,
      duration: const Duration(milliseconds: 350),
      curve: Curves.easeInOut,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: OnboardingListener(
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: AppSpacing.xl),
            child: Column(
              children: [
                Align(
                  alignment: Alignment.centerRight,
                  child: TextButton(
                    onPressed: () =>
                        ref.read(onboardingProvider.notifier).complete(),
                    child: const Text('Skip'),
                  ),
                ),
                Expanded(
                  child: PageView.builder(
                    controller: _pageController,
                    itemCount: kOnboardingSlides.length,
                    onPageChanged: (i) =>
                        ref.read(onboardingProvider.notifier).goTo(i),
                    itemBuilder: (context, i) =>
                        OnboardingSlideView(data: kOnboardingSlides[i]),
                  ),
                ),
                Consumer(
                  builder: (context, ref, child) {
                    final index = ref.watch(
                      onboardingProvider.select((state) => state.index),
                    );

                    return OnboardingDotIndicator(
                      count: kOnboardingSlides.length,
                      activeIndex: index,
                      onDotTap: _goToIndex,
                    );
                  },
                ),
                const Gap(AppSpacing.lg),
                Consumer(
                  builder: (context, ref, child) {
                    final index = ref.watch(
                      onboardingProvider.select((state) => state.index),
                    );
                    final isLastSlide = index == kOnboardingSlides.length - 1;

                    return OnboardingNavControls(
                      isFirstSlide: index == 0,
                      isLastSlide: isLastSlide,
                      onPrev: () => _goToIndex(index - 1),
                      onNext: () {
                        if (isLastSlide) {
                          ref.read(onboardingProvider.notifier).complete();
                        } else {
                          _goToIndex(index + 1);
                        }
                      },
                    );
                  },
                ),
                const Gap(AppSpacing.lg),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
