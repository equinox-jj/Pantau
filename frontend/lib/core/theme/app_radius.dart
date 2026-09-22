import 'package:flutter/widgets.dart';

/// Corner radius scale from the Pantau design system.
abstract final class AppRadius {
  static const double xs = 3; // photo ticks
  static const double sm = 6; // tiny chips
  static const double md = 13; // icon buttons
  static const double lg = 16; // buttons, inputs
  static const double xl = 24; // cards, sheets
  static const double full = 999; // pills, dots

  static const BorderRadius radiusXs = BorderRadius.all(Radius.circular(xs));
  static const BorderRadius radiusSm = BorderRadius.all(Radius.circular(sm));
  static const BorderRadius radiusMd = BorderRadius.all(Radius.circular(md));
  static const BorderRadius radiusLg = BorderRadius.all(Radius.circular(lg));
  static const BorderRadius radiusXl = BorderRadius.all(Radius.circular(xl));
  static const BorderRadius radiusFull = BorderRadius.all(
    Radius.circular(full),
  );
}
