import 'package:material_ui/material_ui.dart';

/// Colour tokens from the Pantau design system (status system leads).
abstract final class AppColors {
  // Brand · civic teal
  static const Color teal400 = Color(0xFF2DD4BF);
  static const Color teal500 = Color(0xFF14B8A6); // default accent
  static const Color teal550 = Color(0xFF0EA5A5);
  static const Color teal600 = Color(0xFF0D9488);
  static const Color accent = teal500;

  /// Ink used on top of the accent gradient (primary buttons, FAB).
  static const Color onAccent = Color(0xFF04211D);

  // Status system — colour is always paired with a label + icon.
  static const Color statusReported = Color(0xFFF5A524);
  static const Color statusReportedInk = Color(0xFF3A2606);
  static const Color statusAcknowledged = Color(0xFF4F9DF7);
  static const Color statusAcknowledgedInk = Color(0xFF08243F);
  static const Color statusInProgress = Color(0xFF8B7CF6);
  static const Color statusInProgressInk = Color(0xFF241B47);
  static const Color statusResolved = Color(0xFF34D399);
  static const Color statusResolvedInk = Color(0xFF053A27);
  static const Color statusClosed = Color(0xFF94A3B8);
  static const Color statusClosedInk = Color(0xFF1F2733);
  static const Color statusRejected = Color(0xFFF26D6D);
  static const Color statusRejectedInk = Color(0xFF3F1414);

  // Text · on dark
  static const Color textPrimary = Color(0xFFEAF3F0);
  static const Color textSecondary = Color(0xFF93A8A2);
  static const Color textMuted = Color(0xFF5C736D);
  static const Color textFaint = Color(0xFF4E635D);

  // Surfaces · dark greens
  static const Color surfaceBase = Color(0xFF050C0B);
  static const Color surfaceSunken = Color(0xFF081413);
  static const Color surfaceSurface = Color(0xFF0B1917);
  static const Color surfaceRaised = Color(0xFF0E1E1B);
  static const Color surfaceFloat = Color(0xFF10201D);

  // Borders & fills · white alpha
  static const Color borderHairline = Color(0x12FFFFFF); // .07
  static const Color borderDefault = Color(0x1FFFFFFF); // .12
  static const Color fillSubtle = Color(0x0AFFFFFF); // .04
  static Color fillAccent = accent.withValues(alpha: 0.16);
  static Color borderAccent = accent.withValues(alpha: 0.34);
}
