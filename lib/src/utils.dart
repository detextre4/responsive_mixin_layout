import 'package:flutter/widgets.dart';
import 'package:responsive_mixin_layout/src/screen_size.dart';

class Utils {
  static const missingContextText =
      "Must to provide context to use this feature";

  /// Retrieves the nearest ancestor [ScreenSizes] widget from the context.
  ///
  /// Throws an error if no [ScreenSizes] ancestor is found.
  ///
  /// @param context The build context to search for the ancestor.
  /// @return The nearest ancestor [ScreenSizes] widget.
  static ScreenSizes screenSizes(BuildContext context) {
    final screenSizes = context.findAncestorWidgetOfExactType<ScreenSizes>();
    if (screenSizes == null) {
      throw 'ResponsiveLayout must have an ancestor of type ScreenSizes';
    }

    return screenSizes;
  }
}
