import 'package:flutter/material.dart';

/// A widget that provides access to the [RenderBox] of its child widget and triggers a callback.
///
/// This widget uses a [Builder] to obtain the [RenderBox] of its child widget. When the
/// [RenderBox] is available, the provided [onRenderBox] callback is called with the
/// [BuildContext] and the [RenderBox].
///
/// Example usage:
///
/// ```dart
/// RenderBoxBuilder(
///   child: YourWidget(),
///   onRenderBox: (context, renderBox) {
///     // Handle the RenderBox
///   },
/// )
/// ```
///
/// @param onRenderBox The callback to trigger when the [RenderBox] is available.
/// @param child The child widget to display and obtain the [RenderBox] from.
class RenderBoxBuilder extends Builder {
  RenderBoxBuilder({
    super.key,
    required void Function(BuildContext context, RenderBox renderBox)
        onRenderBox,
    required Widget child,
  }) : super(builder: (context) {
          final renderBox = context.findRenderObject() as RenderBox?;
          if (renderBox != null) onRenderBox(context, renderBox);

          return child;
        });
}
