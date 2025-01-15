import 'package:flutter/material.dart';

/// A widget that provides a custom text scaling factor based on the screen size.
///
/// This widget uses a [MediaQuery] to obtain the current screen size and applies a custom
/// text scaling factor using the provided [scaler] function. The [scaler] function takes
/// the [BuildContext] and [MediaQueryData] as parameters and returns a scaling factor.
///
/// Example usage:
///
/// ```dart
/// TextScalerBuilder(
///   child: YourWidget(),
///   scaler: (context, media) {
///     // Calculate the scaling factor based on the screen size
///     return media.size.width / 400.0;
///   },
/// )
/// ```
///
/// @param scaler The function that calculates the text scaling factor based on the screen size.
/// @param child The child widget to display with the custom text scaling factor.
class TextScalerBuilder extends StatelessWidget {
  const TextScalerBuilder({
    super.key,
    required this.child,
    required this.scaler,
  });
  final double Function(BuildContext context, MediaQueryData media) scaler;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    final data = MediaQuery.of(context);

    return MediaQuery(
      data: data.copyWith(
        textScaler: TextScaler.linear(scaler(context, data)),
      ),
      child: child,
    );
  }
}
