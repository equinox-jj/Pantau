import 'package:material_ui/material_ui.dart';

extension ContextExt on BuildContext {
  static const _maxMobile = 600;
  static const _maxTablet = 1024;

  ThemeData get theme => Theme.of(this);
  TextTheme get textTheme => TextTheme.of(this);
  ColorScheme get colorScheme => ColorScheme.of(this);
  double get screenWidth => MediaQuery.sizeOf(this).width;
  double get screenHeight => MediaQuery.sizeOf(this).height;
  EdgeInsets get viewInsets => MediaQuery.viewInsetsOf(this);
  EdgeInsets get padding => MediaQuery.paddingOf(this);

  bool get isMobileSize {
    return screenWidth < _maxMobile;
  }

  bool get isTabletSize {
    final width = screenWidth;
    return width >= _maxMobile && width <= _maxTablet;
  }

  bool get isDesktopSize {
    return screenWidth > _maxTablet;
  }

  T responsiveValue<T>({
    required T desktop,
    required T tablet,
    required T mobile,
  }) {
    if (isDesktopSize) return desktop;
    if (isTabletSize) return tablet;
    if (isMobileSize) return mobile;

    return mobile;
  }
}
