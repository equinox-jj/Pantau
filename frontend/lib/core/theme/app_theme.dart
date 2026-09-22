import 'package:material_ui/material_ui.dart';

import 'app_colors.dart';
import 'app_radius.dart';
import 'app_spacing.dart';
import 'app_typography.dart';

/// Assembles the Pantau design tokens into a [ThemeData]. Dark-only by
/// design — there is no light variant.
abstract final class AppTheme {
  static ThemeData dark({Color accent = AppColors.accent}) {
    final colorScheme = ColorScheme.dark(
      primary: accent,
      onPrimary: AppColors.onAccent,
      secondary: accent,
      onSecondary: AppColors.onAccent,
      surface: AppColors.surfaceSurface,
      onSurface: AppColors.textPrimary,
      error: AppColors.statusRejected,
      onError: AppColors.statusRejectedInk,
      outline: AppColors.borderDefault,
    );

    final textTheme = TextTheme(
      displayLarge: AppTypography.display,
      headlineLarge: AppTypography.title,
      headlineMedium: AppTypography.heading,
      titleMedium: AppTypography.subheading,
      bodyLarge: AppTypography.bodyLarge,
      bodyMedium: AppTypography.body,
      labelLarge: AppTypography.label,
      labelSmall: AppTypography.overline,
    );

    return ThemeData(
      useMaterial3: true,
      brightness: Brightness.dark,
      colorScheme: colorScheme,
      scaffoldBackgroundColor: AppColors.surfaceBase,
      textTheme: textTheme,
      fontFamily: AppTypography.body.fontFamily,
      dividerColor: AppColors.borderHairline,
      splashFactory: InkRipple.splashFactory,
      appBarTheme: AppBarTheme(
        backgroundColor: AppColors.surfaceBase,
        foregroundColor: AppColors.textPrimary,
        elevation: 0,
        centerTitle: false,
        titleTextStyle: AppTypography.subheading,
      ),
      cardTheme: const CardThemeData(
        color: AppColors.surfaceRaised,
        elevation: 0,
        margin: EdgeInsets.zero,
        shape: RoundedRectangleBorder(
          borderRadius: AppRadius.radiusXl,
          side: BorderSide(color: AppColors.borderHairline),
        ),
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: accent,
          foregroundColor: AppColors.onAccent,
          disabledBackgroundColor: AppColors.fillSubtle,
          minimumSize: const Size.fromHeight(AppSpacing.xl4),
          padding: const EdgeInsets.symmetric(horizontal: AppSpacing.xl2),
          textStyle: AppTypography.subheading.copyWith(fontSize: 16),
          shape: const RoundedRectangleBorder(borderRadius: AppRadius.radiusLg),
          elevation: 0,
        ),
      ),
      outlinedButtonTheme: OutlinedButtonThemeData(
        style: OutlinedButton.styleFrom(
          backgroundColor: AppColors.fillSubtle,
          foregroundColor: AppColors.textPrimary,
          minimumSize: const Size.fromHeight(AppSpacing.xl4),
          side: const BorderSide(color: AppColors.borderDefault),
          shape: const RoundedRectangleBorder(borderRadius: AppRadius.radiusLg),
          textStyle: AppTypography.subheading.copyWith(fontSize: 15),
        ),
      ),
      textButtonTheme: TextButtonThemeData(
        style: TextButton.styleFrom(
          foregroundColor: accent,
          textStyle: AppTypography.body.copyWith(
            fontWeight: FontWeight.w600,
            color: accent,
          ),
        ),
      ),
      iconButtonTheme: IconButtonThemeData(
        style: IconButton.styleFrom(
          backgroundColor: AppColors.fillSubtle,
          foregroundColor: AppColors.textPrimary,
          minimumSize: const Size.square(AppSpacing.xl3),
          shape: const RoundedRectangleBorder(borderRadius: AppRadius.radiusMd),
        ),
      ),
      floatingActionButtonTheme: FloatingActionButtonThemeData(
        backgroundColor: accent,
        foregroundColor: AppColors.onAccent,
        elevation: 0,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      ),
      inputDecorationTheme: InputDecorationTheme(
        filled: true,
        fillColor: AppColors.fillSubtle,
        hintStyle: AppTypography.body.copyWith(
          fontSize: 15,
          color: AppColors.textMuted,
        ),
        labelStyle: AppTypography.label,
        constraints: const BoxConstraints(minHeight: AppSpacing.xl4),
        contentPadding: const EdgeInsets.symmetric(
          horizontal: AppSpacing.md,
          vertical: AppSpacing.md,
        ),
        border: const OutlineInputBorder(
          borderRadius: AppRadius.radiusLg,
          borderSide: BorderSide(color: AppColors.borderDefault),
        ),
        enabledBorder: const OutlineInputBorder(
          borderRadius: AppRadius.radiusLg,
          borderSide: BorderSide(color: AppColors.borderDefault),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: AppRadius.radiusLg,
          borderSide: BorderSide(color: accent, width: 1.5),
        ),
        errorBorder: const OutlineInputBorder(
          borderRadius: AppRadius.radiusLg,
          borderSide: BorderSide(color: AppColors.statusRejected),
        ),
      ),
      chipTheme: ChipThemeData(
        backgroundColor: AppColors.fillSubtle,
        labelStyle: AppTypography.body.copyWith(
          fontSize: 12.5,
          fontWeight: FontWeight.w700,
          color: AppColors.textPrimary,
        ),
        padding: const EdgeInsets.symmetric(
          horizontal: AppSpacing.xs,
          vertical: 7,
        ),
        shape: const RoundedRectangleBorder(
          borderRadius: AppRadius.radiusFull,
          side: BorderSide(color: AppColors.borderDefault),
        ),
      ),
      dialogTheme: DialogThemeData(
        backgroundColor: AppColors.surfaceRaised,
        shape: const RoundedRectangleBorder(borderRadius: AppRadius.radiusXl),
        titleTextStyle: AppTypography.title.copyWith(fontSize: 19),
        contentTextStyle: AppTypography.body,
      ),
      snackBarTheme: SnackBarThemeData(
        backgroundColor: AppColors.surfaceFloat,
        contentTextStyle: AppTypography.body.copyWith(
          color: AppColors.textPrimary,
        ),
        shape: const RoundedRectangleBorder(borderRadius: AppRadius.radiusLg),
        behavior: SnackBarBehavior.floating,
      ),
    );
  }
}
