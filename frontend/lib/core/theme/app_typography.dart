import 'package:material_ui/material_ui.dart';
import 'package:google_fonts/google_fonts.dart';

import 'app_colors.dart';

/// Type scale from the Pantau design system. Plus Jakarta Sans for UI,
/// headings and body; IBM Plex Mono for labels, data and coordinates.
abstract final class AppTypography {
  static TextStyle _jakarta({
    required double fontSize,
    required FontWeight fontWeight,
    double? letterSpacing,
    double? height,
    Color color = AppColors.textPrimary,
  }) {
    return GoogleFonts.plusJakartaSans(
      fontSize: fontSize,
      fontWeight: fontWeight,
      letterSpacing: letterSpacing,
      height: height,
      color: color,
    );
  }

  /// IBM Plex Mono, for labels, data & coordinates.
  static TextStyle mono({
    double fontSize = 13,
    FontWeight fontWeight = FontWeight.w500,
    double? letterSpacing,
    Color color = AppColors.textSecondary,
  }) {
    return GoogleFonts.ibmPlexMono(
      fontSize: fontSize,
      fontWeight: fontWeight,
      letterSpacing: letterSpacing,
      color: color,
    );
  }

  /// 42 / 800 · −1.6 tracking · display · splash wordmark
  static final TextStyle display = _jakarta(
    fontSize: 42,
    fontWeight: FontWeight.w800,
    letterSpacing: -1.6,
    height: 1.05,
  );

  /// 28 / 800 · −0.8 tracking · title · screen H1
  static final TextStyle title = _jakarta(
    fontSize: 28,
    fontWeight: FontWeight.w800,
    letterSpacing: -0.8,
    height: 1.1,
  );

  /// 25 / 800 · −0.6 tracking · heading · onboarding H2
  static final TextStyle heading = _jakarta(
    fontSize: 25,
    fontWeight: FontWeight.w800,
    letterSpacing: -0.6,
    height: 1.14,
  );

  /// 17 / 700 · −0.3 tracking · subheading · section
  static final TextStyle subheading = _jakarta(
    fontSize: 17,
    fontWeight: FontWeight.w700,
    letterSpacing: -0.3,
    height: 1.3,
  );

  /// 15 / 400 · body L · lead paragraph
  static final TextStyle bodyLarge = _jakarta(
    fontSize: 15,
    fontWeight: FontWeight.w400,
    height: 1.5,
    color: const Color(0xFFC6D6D1),
  );

  /// 14 / 400 · body · default
  static final TextStyle body = _jakarta(
    fontSize: 14,
    fontWeight: FontWeight.w400,
    height: 1.55,
    color: AppColors.textSecondary,
  );

  /// 12.5 / 600 · label · form field
  static final TextStyle label = _jakarta(
    fontSize: 12.5,
    fontWeight: FontWeight.w600,
    color: const Color(0xFF8DA39D),
  );

  /// 11 / 500 · +2.5 tracking · uppercase · overline · mono eyebrow
  static final TextStyle overline = mono(
    fontSize: 11,
    fontWeight: FontWeight.w500,
    letterSpacing: 2.5,
    color: AppColors.accent,
  );

  /// 10.5 · small mono metadata size — report detail's meta line and the
  /// status timeline card's per-step timestamps share this scale.
  static const double metaMonoSize = 10.5;
}
