import 'package:flutter/widgets.dart';
import 'package:responsive_mixin_layout/src/screen_size.dart';

ScreenSizes _screenSizes(BuildContext context) {
  final screenSizes = context.findAncestorWidgetOfExactType<ScreenSizes>();
  if (screenSizes == null) {
    throw 'ResponsiveLayout must have an ancestor of type ScreenSizes';
  }

  return screenSizes;
}

extension ScreenSizesExtension on BuildContext {
  bool get isMobile =>
      MediaQuery.of(this).size.width < _screenSizes(this).mobile;

  bool get isTablet =>
      MediaQuery.of(this).size.width < _screenSizes(this).tablet;

  bool get isDesktop =>
      MediaQuery.of(this).size.width < _screenSizes(this).desktop;

  bool get isTV => MediaQuery.of(this).size.width < _screenSizes(this).tv;
}
