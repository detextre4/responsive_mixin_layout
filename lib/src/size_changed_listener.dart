import 'package:flutter/material.dart';

/// A widget that listens for size changes of its child widget and triggers a callback.
///
/// This widget uses a [SizeChangedLayoutNotifier] to detect size changes of its child
/// widget. When a size change is detected, the provided [onSizeChanged] callback is called.
///
/// Example usage:
///
/// ```dart
/// BoxSizeListener(
///   child: YourWidget(),
///   onSizeChanged: () {
///     // Handle size change
///   },
/// )
/// ```
///
/// @param child The child widget to listen for size changes.
/// @param onSizeChanged The callback to trigger when the size changes.
class BoxSizeListener extends NotificationListener {
  BoxSizeListener({
    super.key,
    required Widget child,
    required VoidCallback onSizeChanged,
  }) : super(
          onNotification: (notification) {
            if (notification is SizeChangedLayoutNotification) onSizeChanged();
            return true;
          },
          child: SizeChangedLayoutNotifier(child: child),
        );
}

/// A widget that listens for screen size changes and triggers a callback.
///
/// This widget uses [MediaQuery] to detect changes in the screen size. When a screen size
/// change is detected, the provided [onSizeChanged] callback is called with the new size.
///
/// Example usage:
///
/// ```dart
/// ScreenSizeListener(
///   child: YourWidget(),
///   onSizeChanged: (newSize) {
///     // Handle screen size change
///   },
/// )
/// ```
///
/// @param child The child widget to display.
/// @param onSizeChanged The callback to trigger when the screen size changes.
class ScreenSizeListener extends StatefulWidget {
  const ScreenSizeListener({
    super.key,
    required this.child,
    required this.onSizeChanged,
  });

  final Widget child;
  final void Function(Size size) onSizeChanged;

  @override
  State<StatefulWidget> createState() => _ScreenSizeListenerState();
}

class _ScreenSizeListenerState extends State<ScreenSizeListener> {
  Size? _oldSize;

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      final newSize = MediaQuery.of(context).size;
      if (_oldSize != newSize) {
        _oldSize = newSize;
        widget.onSizeChanged(newSize);
      }
    });

    return widget.child;
  }
}
