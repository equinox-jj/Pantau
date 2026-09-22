import 'package:flutter/foundation.dart';

/// Which decorative illustration a slide shows.
enum OnboardingGraphic { snapPhoto, statusTimeline, privacyMap }

@immutable
class OnboardingSlideData {
  const OnboardingSlideData({
    required this.graphic,
    required this.title,
    required this.description,
  });

  final OnboardingGraphic graphic;
  final String title;
  final String description;
}

const List<OnboardingSlideData> kOnboardingSlides = [
  OnboardingSlideData(
    graphic: OnboardingGraphic.snapPhoto,
    title: 'Snap the problem',
    description:
        'A photo and a tap — we capture the location automatically. '
        'Your report lands on the map in seconds.',
  ),
  OnboardingSlideData(
    graphic: OnboardingGraphic.statusTimeline,
    title: 'Watch it reach resolved',
    description:
        'No more reporting into a void. Follow every report from reported '
        'to resolved — each update is logged.',
  ),
  OnboardingSlideData(
    graphic: OnboardingGraphic.privacyMap,
    title: 'Public impact, private you',
    description:
        'Your name is never shown on the map. Report freely and help fix '
        'your neighbourhood, together.',
  ),
];
