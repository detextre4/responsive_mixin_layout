import 'package:flutter/widgets.dart';
import 'package:responsive_mixin_layout/src/screen_size.dart';

ScreenSizes _screenSizes(BuildContext context) {
  final screenSizes = context.findAncestorWidgetOfExactType<ScreenSizes>();
  assert(
    screenSizes != null,
    'ResponsiveLayout must have an ancestor of type ScreenSizes',
  );

  return screenSizes!;
}

extension ScreenSizesExtension on BuildContext {
  ScreenWidth get width => _screenSizes(this).width.copyWith(context: this);

  ScreenHeight get height => _screenSizes(this).height.copyWith(context: this);
}
