import 'package:material_ui/material_ui.dart';

import '../../theme/theme.dart';

enum AppButtonVariant { primary, secondary, ghost }

/// Reusable button styled from the Pantau style guide's "Buttons" section.
///
/// Covers the primary (accent gradient), secondary (outlined) and ghost
/// (text-only) variants. Icon-only, FAB and dialog-height buttons come from
/// [AppTheme]'s `iconButtonTheme`/`floatingActionButtonTheme` instead.
class AppButton extends StatelessWidget {
  const AppButton({
    super.key,
    required this.text,
    this.onPressed,
    this.variant = AppButtonVariant.primary,
    this.leading,
    this.trailing,
    this.isLoading = false,
    this.fullWidth = true,
  });

  final String text;
  final VoidCallback? onPressed;
  final AppButtonVariant variant;
  final Widget? leading;
  final Widget? trailing;
  final bool isLoading;
  final bool fullWidth;

  bool get _enabled => onPressed != null && !isLoading;

  @override
  Widget build(BuildContext context) {
    final button = switch (variant) {
      AppButtonVariant.primary => _PrimaryButton(
        enabled: _enabled,
        onPressed: onPressed,
        text: text,
        leading: leading,
        trailing: trailing,
        isLoading: isLoading,
      ),
      AppButtonVariant.secondary => _SecondaryButton(
        enabled: _enabled,
        onPressed: onPressed,
        text: text,
        leading: leading,
        trailing: trailing,
        isLoading: isLoading,
      ),
      AppButtonVariant.ghost => _GhostButton(
        enabled: _enabled,
        onPressed: onPressed,
        text: text,
        leading: leading,
        trailing: trailing,
        isLoading: isLoading,
      ),
    };

    if (!fullWidth) return button;
    return SizedBox(width: double.infinity, child: button);
  }
}

class _PrimaryButton extends StatelessWidget {
  const _PrimaryButton({
    required this.enabled,
    required this.onPressed,
    required this.text,
    required this.leading,
    required this.trailing,
    required this.isLoading,
  });

  final bool enabled;
  final VoidCallback? onPressed;
  final String text;
  final Widget? leading;
  final Widget? trailing;
  final bool isLoading;

  @override
  Widget build(BuildContext context) {
    const accent = AppColors.accent;
    return DecoratedBox(
      decoration: BoxDecoration(
        borderRadius: AppRadius.radiusLg,
        gradient: enabled
            ? LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                stops: const [0, 0.58, 1],
                colors: [
                  Color.lerp(accent, Colors.white, 0.08)!,
                  accent,
                  Color.lerp(accent, Colors.black, 0.18)!,
                ],
              )
            : null,
        color: enabled ? null : AppColors.fillSubtle,
        boxShadow: enabled ? AppShadows.accentGlow(accent: accent) : null,
      ),
      child: Material(
        type: MaterialType.transparency,
        child: InkWell(
          borderRadius: AppRadius.radiusLg,
          onTap: enabled ? onPressed : null,
          child: Container(
            height: AppSpacing.xl4,
            padding: const EdgeInsets.symmetric(horizontal: AppSpacing.xl),
            alignment: Alignment.center,
            child: _ButtonContent(
              text: text,
              leading: leading,
              trailing: trailing,
              isLoading: isLoading,
              textColor: enabled ? AppColors.onAccent : AppColors.textMuted,
              fontSize: 16,
            ),
          ),
        ),
      ),
    );
  }
}

class _SecondaryButton extends StatelessWidget {
  const _SecondaryButton({
    required this.enabled,
    required this.onPressed,
    required this.text,
    required this.leading,
    required this.trailing,
    required this.isLoading,
  });

  final bool enabled;
  final VoidCallback? onPressed;
  final String text;
  final Widget? leading;
  final Widget? trailing;
  final bool isLoading;

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(
        borderRadius: AppRadius.radiusLg,
        color: AppColors.fillSubtle,
        border: Border.all(color: AppColors.borderDefault),
      ),
      child: Material(
        type: MaterialType.transparency,
        child: InkWell(
          borderRadius: AppRadius.radiusLg,
          onTap: enabled ? onPressed : null,
          child: Container(
            height: AppSpacing.xl4,
            padding: const EdgeInsets.symmetric(horizontal: AppSpacing.xl2),
            alignment: Alignment.center,
            child: _ButtonContent(
              text: text,
              leading: leading,
              trailing: trailing,
              isLoading: isLoading,
              textColor: enabled ? AppColors.textPrimary : AppColors.textMuted,
              fontSize: 15,
            ),
          ),
        ),
      ),
    );
  }
}

class _GhostButton extends StatelessWidget {
  const _GhostButton({
    required this.enabled,
    required this.onPressed,
    required this.text,
    required this.leading,
    required this.trailing,
    required this.isLoading,
  });

  final bool enabled;
  final VoidCallback? onPressed;
  final String text;
  final Widget? leading;
  final Widget? trailing;
  final bool isLoading;

  @override
  Widget build(BuildContext context) {
    return Material(
      type: MaterialType.transparency,
      child: InkWell(
        borderRadius: AppRadius.radiusSm,
        onTap: enabled ? onPressed : null,
        child: Padding(
          padding: const EdgeInsets.all(AppSpacing.xs2),
          child: _ButtonContent(
            text: text,
            leading: leading,
            trailing: trailing,
            isLoading: isLoading,
            textColor: enabled ? AppColors.accent : AppColors.textMuted,
            fontSize: 14,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
    );
  }
}

class _ButtonContent extends StatelessWidget {
  const _ButtonContent({
    required this.text,
    required this.leading,
    required this.trailing,
    required this.isLoading,
    required this.textColor,
    required this.fontSize,
    this.fontWeight = FontWeight.w700,
  });

  final String text;
  final Widget? leading;
  final Widget? trailing;
  final bool isLoading;
  final Color textColor;
  final double fontSize;
  final FontWeight fontWeight;

  @override
  Widget build(BuildContext context) {
    if (isLoading) {
      return SizedBox(
        width: 18,
        height: 18,
        child: CircularProgressIndicator(strokeWidth: 2, color: textColor),
      );
    }

    final textStyle = AppTypography.subheading.copyWith(
      fontSize: fontSize,
      fontWeight: fontWeight,
      color: textColor,
    );

    if (leading == null && trailing == null) {
      return Text(text, style: textStyle);
    }

    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        if (leading != null) ...[
          IconTheme(
            data: IconThemeData(color: textColor, size: AppIconSizes.md),
            child: leading!,
          ),
          const SizedBox(width: AppSpacing.xs2),
        ],
        Flexible(child: Text(text, style: textStyle)),
        if (trailing != null) ...[
          const SizedBox(width: AppSpacing.xs2),
          IconTheme(
            data: IconThemeData(color: textColor, size: AppIconSizes.md),
            child: trailing!,
          ),
        ],
      ],
    );
  }
}
