import 'package:flutter/widgets.dart';
import 'package:responsive_mixin_layout/src/screen_size.dart';

ScreenSizes _screenSizes(BuildContext context) {
  final screenSizes = context.findAncestorWidgetOfExactType<ScreenSizes>();
  if (screenSizes == null) {
    throw 'ResponsiveLayout must have an ancestor of type ScreenSizes';
  }

  return screenSizes;
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
    final screenSizes = _screenSizes(context);

    return LayoutBuilder(
      builder: (context, constraints) {
        if (mobile != null && constraints.maxWidth < screenSizes.mobile) {
          return mobile!(context, constraints) ?? const Placeholder();
        } else if (tablet != null && constraints.maxWidth < screenSizes.tablet) {
          return tablet!(context, constraints) ?? const Placeholder();
        } else if (desktop != null &&
            constraints.maxWidth < screenSizes.desktop) {
          return desktop!(context, constraints) ?? const Placeholder();
        } else if (tv != null && constraints.maxWidth < screenSizes.tv) {
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
    final screenSizes = _screenSizes(context);

    return LayoutBuilder(
      builder: (context, constraints) {
        if (mobileLayout(context, constraints) != null &&
            constraints.maxWidth < screenSizes.mobile) {
          return mobileLayout(context, constraints) ?? const Placeholder();
        } else if (tabletLayout(context, constraints) != null &&
            constraints.maxWidth < screenSizes.tablet) {
          return tabletLayout(context, constraints) ?? const Placeholder();
        } else if (desktopLayout(context, constraints) != null &&
            constraints.maxWidth < screenSizes.desktop) {
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
    final screenSizes = _screenSizes(context);

    return LayoutBuilder(
      builder: (context, constraints) {
        if (mobileLayout(context, constraints) != null &&
            constraints.maxWidth < screenSizes.mobile) {
          return mobileLayout(context, constraints) ?? const Placeholder();
        } else if (tabletLayout(context, constraints) != null &&
            constraints.maxWidth < screenSizes.tablet) {
          return tabletLayout(context, constraints) ?? const Placeholder();
        } else if (desktopLayout(context, constraints) != null &&
            constraints.maxWidth < screenSizes.desktop) {
          return desktopLayout(context, constraints) ?? const Placeholder();
        }
        return tvLayout(context, constraints) ?? const Placeholder();
      },
    );
  }

  @override
  Widget build(BuildContext context) => buildResponsiveLayout(context);
}
