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
    this.xdesktop,
    this.desktop,
    this.tv,
    this.basedOnLayout = false,
  });
  final Widget? Function(BuildContext context, BoxConstraints constraints)?
      mobile;
  final Widget? Function(BuildContext context, BoxConstraints constraints)?
      tablet;
  final Widget? Function(BuildContext context, BoxConstraints constraints)?
      xdesktop;
  final Widget? Function(BuildContext context, BoxConstraints constraints)?
      desktop;
  final Widget? Function(BuildContext context, BoxConstraints constraints)? tv;

  /// This bool is used to switch between get screen size from screen size or layout box constraints
  final bool basedOnLayout;

  @override
  Widget build(BuildContext context) {
    final screenSizes = _screenSizes(context);

    return LayoutBuilder(
      builder: (context, constraints) {
        final width = basedOnLayout
            ? constraints.maxWidth
            : MediaQuery.of(context).size.width;

        if (mobile != null && width < screenSizes.width.mobile) {
          return mobile!(context, constraints) ?? const Placeholder();
        } else if (tablet != null && width < screenSizes.width.tablet) {
          return tablet!(context, constraints) ?? const Placeholder();
        } else if (xdesktop != null && width < screenSizes.width.xdesktop) {
          return xdesktop!(context, constraints) ?? const Placeholder();
        } else if (desktop != null && width < screenSizes.width.desktop) {
          return desktop!(context, constraints) ?? const Placeholder();
        } else if (tv != null && width < screenSizes.width.tv) {
          return desktop!(context, constraints) ?? const Placeholder();
        }

        return const Placeholder();
      },
    );
  }
}

/// Custom responsive layout mixin
mixin ResponsiveMixinLayout<T extends Widget> on Widget {
  Widget? mobileLayout(BuildContext context, BoxConstraints constraints) =>
      null;
  Widget? tabletLayout(BuildContext context, BoxConstraints constraints) =>
      null;
  Widget? xdesktopLayout(BuildContext context, BoxConstraints constraints) =>
      null;
  Widget? desktopLayout(BuildContext context, BoxConstraints constraints) =>
      null;
  Widget? tvLayout(BuildContext context, BoxConstraints constraints) => null;

  Widget buildResponsiveLayout(BuildContext context) {
    final screenSizes = _screenSizes(context);

    return LayoutBuilder(
      builder: (context, constraints) {
        if (mobileLayout(context, constraints) != null &&
            constraints.maxWidth < screenSizes.width.mobile) {
          return mobileLayout(context, constraints) ?? const Placeholder();
        } else if (tabletLayout(context, constraints) != null &&
            constraints.maxWidth < screenSizes.width.tablet) {
          return tabletLayout(context, constraints) ?? const Placeholder();
        } else if (xdesktopLayout(context, constraints) != null &&
            constraints.maxWidth < screenSizes.width.xdesktop) {
          return desktopLayout(context, constraints) ?? const Placeholder();
        } else if (desktopLayout(context, constraints) != null &&
            constraints.maxWidth < screenSizes.width.desktop) {
          return desktopLayout(context, constraints) ?? const Placeholder();
        }
        return tvLayout(context, constraints) ?? const Placeholder();
      },
    );
  }

  Widget build(BuildContext context) => buildResponsiveLayout(context);
}

/// Custom responsive layout mixin to `StatefullWidget`
mixin ResponsiveMixinLayoutStateful<T extends StatefulWidget> on State<T> {
  Widget? mobileLayout(BuildContext context, BoxConstraints constraints) =>
      null;
  Widget? tabletLayout(BuildContext context, BoxConstraints constraints) =>
      null;
  Widget? xdesktopLayout(BuildContext context, BoxConstraints constraints) =>
      null;
  Widget? desktopLayout(BuildContext context, BoxConstraints constraints) =>
      null;
  Widget? tvLayout(BuildContext context, BoxConstraints constraints) => null;

  Widget buildResponsiveLayout(BuildContext context) {
    final screenSizes = _screenSizes(context);

    return LayoutBuilder(
      builder: (context, constraints) {
        if (mobileLayout(context, constraints) != null &&
            constraints.maxWidth < screenSizes.width.mobile) {
          return mobileLayout(context, constraints) ?? const Placeholder();
        } else if (tabletLayout(context, constraints) != null &&
            constraints.maxWidth < screenSizes.width.tablet) {
          return tabletLayout(context, constraints) ?? const Placeholder();
        } else if (xdesktopLayout(context, constraints) != null &&
            constraints.maxWidth < screenSizes.width.xdesktop) {
          return desktopLayout(context, constraints) ?? const Placeholder();
        } else if (desktopLayout(context, constraints) != null &&
            constraints.maxWidth < screenSizes.width.desktop) {
          return desktopLayout(context, constraints) ?? const Placeholder();
        }
        return tvLayout(context, constraints) ?? const Placeholder();
      },
    );
  }

  @override
  Widget build(BuildContext context) => buildResponsiveLayout(context);
}
