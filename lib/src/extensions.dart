import 'package:flutter/widgets.dart';
import 'package:responsive_mixin_layout/src/screen_size.dart';
import 'package:responsive_mixin_layout/src/utils.dart';

extension ScreenSizesExtension on BuildContext {
  ScreenWidth get width =>
      Utils.screenSizes(this).width.copyWith(context: this);

  ScreenHeight get height =>
      Utils.screenSizes(this).height.copyWith(context: this);
}

extension DoubleExtension on double {
  // Returns this [num] clamped to be in the range [lowerLimit]-[upperLimit] but inverted.
  double clampInverted(double lowerLimit, double upperLimit) =>
      lowerLimit + upperLimit - clamp(lowerLimit, upperLimit);

  // Map the value from one range to another
  double clampMapRanged({
    bool invert = false,
    required double minRange,
    required double maxRange,
    required double minValue,
    required double maxValue,
  }) {
    double mappedValue =
        ((this - minRange) / (maxRange - minRange)) * (maxValue - minValue) +
            minValue;

    // Make sure the mapped value is within the minValue and maxValue ranges
    mappedValue = mappedValue.clamp(minValue, maxValue);

    // Inverts return values if invert is specified as true
    return invert ? maxValue + minValue - mappedValue : mappedValue;
  }
}
