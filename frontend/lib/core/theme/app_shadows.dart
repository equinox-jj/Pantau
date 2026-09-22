import 'package:material_ui/material_ui.dart';

import 'app_colors.dart';

/// Elevation shadows from the Pantau design system.
abstract final class AppShadows {
  /// 0 28 46 −22 · black .75 — cards
  static const List<BoxShadow> card = [
    BoxShadow(
      color: Color(0xBF000000), // black · .75
      offset: Offset(0, 28),
      blurRadius: 46,
      spreadRadius: -22,
    ),
  ];

  /// 0 12 24 −10 · black .8 — floating chips, toasts
  static const List<BoxShadow> floating = [
    BoxShadow(
      color: Color(0xCC000000), // black · .8
      offset: Offset(0, 12),
      blurRadius: 24,
      spreadRadius: -10,
    ),
  ];

  /// 0 4 10 −4 · black .6 — the raised segment of a segmented control
  static const List<BoxShadow> segment = [
    BoxShadow(
      color: Color(0x99000000), // black · .6
      offset: Offset(0, 4),
      blurRadius: 10,
      spreadRadius: -4,
    ),
  ];

  /// 0 12 26 −10 · teal .65 — accent glow (primary buttons, FAB)
  static List<BoxShadow> accentGlow({Color accent = AppColors.accent}) {
    return [
      BoxShadow(
        color: accent.withValues(alpha: 0.65),
        offset: const Offset(0, 12),
        blurRadius: 26,
        spreadRadius: -10,
      ),
    ];
  }

  /// 0 0 0 4 · teal .18 — focus ring (text fields)
  static List<BoxShadow> focusRing({Color color = AppColors.accent}) {
    return [BoxShadow(color: color.withValues(alpha: 0.18), spreadRadius: 4)];
  }
}
