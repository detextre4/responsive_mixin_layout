import 'package:flutter/material.dart';

// * Responsive sizes
/// A list of sizes from device screen resolution
class ScreenSize extends StatelessWidget {
  const ScreenSize({
    super.key,
    required this.child,
    this.mobile = 600,
    this.tablet = 880,
    this.desktop = 2000,
    this.tv = 4000,
  });

  final Widget child;
  final double mobile;
  final double tablet;
  final double desktop;
  final double tv;

  @override
  Widget build(BuildContext context) => child;
}
