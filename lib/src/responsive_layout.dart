import 'package:flutter/widgets.dart';
import 'package:responsive_mixin_layout/src/screen_size.dart';

ScreenSize _screenSize(BuildContext context) {
  final screenSize = context.findAncestorWidgetOfExactType<ScreenSize>();
  if (screenSize == null) {
    throw 'ResponsiveLayout must have an ancestor of type ScreenSize';
  }

  return screenSize;
}

/// Custom responsive layout widget
class ResponsiveLayout extends StatelessWidget {
  const ResponsiveLayout({
    super.key,
    this.mobile,
    this.tablet,
    this.desktop,
    this.tv,
  });
  final Widget? Function(BuildContext context, BoxConstraints constraints)?
      mobile;
  final Widget? Function(BuildContext context, BoxConstraints constraints)?
      tablet;
  final Widget? Function(BuildContext context, BoxConstraints constraints)?
      desktop;
  final Widget? Function(BuildContext context, BoxConstraints constraints)? tv;

  @override
  Widget build(BuildContext context) {
    final screenSize = _screenSize(context);

    return LayoutBuilder(
      builder: (context, constraints) {
        if (mobile != null && constraints.maxWidth < screenSize.mobile) {
          return mobile!(context, constraints) ?? const Placeholder();
        } else if (tablet != null && constraints.maxWidth < screenSize.tablet) {
          return tablet!(context, constraints) ?? const Placeholder();
        } else if (desktop != null &&
            constraints.maxWidth < screenSize.desktop) {
          return desktop!(context, constraints) ?? const Placeholder();
        } else if (tv != null && constraints.maxWidth < screenSize.tv) {
          return desktop!(context, constraints) ?? const Placeholder();
        }

        return const Placeholder();
      },
    );
  }
}

/// Custom responsive layout mixin
mixin ResponsiveLayoutMixin<T extends Widget> on Widget {
  Widget? mobileLayout(BuildContext context, BoxConstraints constraints) =>
      null;
  Widget? tabletLayout(BuildContext context, BoxConstraints constraints) =>
      null;
  Widget? desktopLayout(BuildContext context, BoxConstraints constraints) =>
      null;
  Widget? tvLayout(BuildContext context, BoxConstraints constraints) => null;

  Widget buildResponsiveLayout(BuildContext context) {
    final screenSize = _screenSize(context);

    return LayoutBuilder(
      builder: (context, constraints) {
        if (mobileLayout(context, constraints) != null &&
            constraints.maxWidth < screenSize.mobile) {
          return mobileLayout(context, constraints) ?? const Placeholder();
        } else if (tabletLayout(context, constraints) != null &&
            constraints.maxWidth < screenSize.tablet) {
          return tabletLayout(context, constraints) ?? const Placeholder();
        } else if (desktopLayout(context, constraints) != null &&
            constraints.maxWidth < screenSize.desktop) {
          return desktopLayout(context, constraints) ?? const Placeholder();
        }
        return tvLayout(context, constraints) ?? const Placeholder();
      },
    );
  }

  Widget build(BuildContext context) => buildResponsiveLayout(context);
}

/// Custom responsive layout mixin to `StatefullWidget`
mixin ResponsiveLayoutMixinStateful<T extends StatefulWidget> on State<T> {
  Widget? mobileLayout(BuildContext context, BoxConstraints constraints) =>
      null;
  Widget? tabletLayout(BuildContext context, BoxConstraints constraints) =>
      null;
  Widget? desktopLayout(BuildContext context, BoxConstraints constraints) =>
      null;
  Widget? tvLayout(BuildContext context, BoxConstraints constraints) => null;

  Widget buildResponsiveLayout(BuildContext context) {
    final screenSize = _screenSize(context);

    return LayoutBuilder(
      builder: (context, constraints) {
        if (mobileLayout(context, constraints) != null &&
            constraints.maxWidth < screenSize.mobile) {
          return mobileLayout(context, constraints) ?? const Placeholder();
        } else if (tabletLayout(context, constraints) != null &&
            constraints.maxWidth < screenSize.tablet) {
          return tabletLayout(context, constraints) ?? const Placeholder();
        } else if (desktopLayout(context, constraints) != null &&
            constraints.maxWidth < screenSize.desktop) {
          return desktopLayout(context, constraints) ?? const Placeholder();
        }
        return tvLayout(context, constraints) ?? const Placeholder();
      },
    );
  }

  @override
  Widget build(BuildContext context) => buildResponsiveLayout(context);
}
