import 'package:flutter/widgets.dart';
import 'package:responsive_mixin_layout/src/screen_size.dart';

ScreenSize _screenSize(BuildContext context) {
  final screenSize = context.findAncestorWidgetOfExactType<ScreenSize>();
  if (screenSize == null) {
    throw 'ResponsiveLayout must have an ancestor of type ScreenSize';
  }

  return screenSize;
}

extension ScreenSizeExtension on BuildContext {
  bool get isMobile =>
      MediaQuery.of(this).size.width < _screenSize(this).mobile;

  bool isTablet(BuildContext context) =>
      MediaQuery.of(context).size.width < _screenSize(this).tablet;

  bool isDesktop(BuildContext context) =>
      MediaQuery.of(context).size.width < _screenSize(this).desktop;

  bool isTV(BuildContext context) =>
      MediaQuery.of(context).size.width < _screenSize(this).tv;
}
