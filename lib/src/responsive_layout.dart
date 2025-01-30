import 'package:flutter/widgets.dart';
import 'package:responsive_mixin_layout/src/screen_size.dart';
import 'package:responsive_mixin_layout/src/utils.dart';

/// A custom responsive layout widget that renders different views based on [ScreenSizes].
///
/// This widget uses a [LayoutBuilder] to determine the width of the screen or layout box
/// constraints and renders the appropriate view for mobile, tablet, xdesktop, desktop, or tv
/// based on the provided functions.
///
/// Example usage:
///
/// ```dart
/// ResponsiveLayout(
///   mobile: (context, constraints) => MobileView(),
///   tablet: (context, constraints) => TabletView(),
///   desktop: (context, constraints) => DesktopView(),
/// )
/// ```
///
/// @param mobile The function to build the mobile view.
/// @param tablet The function to build the tablet view.
/// @param xdesktop The function to build the xdesktop view.
/// @param desktop The function to build the desktop view.
/// @param tv The function to build the tv view.
/// @param basedOnLayout A boolean to switch between getting screen size from screen size or layout box constraints.
class ResponsiveLayout extends StatelessWidget {
  const ResponsiveLayout({
    super.key,
    this.xmobile,
    this.mobile,
    this.tablet,
    this.xdesktop,
    this.desktop,
    this.tv,
    this.basedOnLayout = false,
  });
  final Widget? Function(BuildContext context, BoxConstraints constraints)?
      xmobile;
  final Widget? Function(BuildContext context, BoxConstraints constraints)?
      mobile;
  final Widget? Function(BuildContext context, BoxConstraints constraints)?
      tablet;
  final Widget? Function(BuildContext context, BoxConstraints constraints)?
      xdesktop;
  final Widget? Function(BuildContext context, BoxConstraints constraints)?
      desktop;
  final Widget? Function(BuildContext context, BoxConstraints constraints)? tv;

  /// This bool is used to switch between getting screen size from screen size or layout box constraints.
  final bool basedOnLayout;

  @override
  Widget build(BuildContext context) {
    final screenSizes = Utils.screenSizes(context);

    return LayoutBuilder(
      builder: (context, constraints) {
        final width = basedOnLayout
            ? constraints.maxWidth
            : MediaQuery.of(context).size.width;

        if (xmobile != null && width < screenSizes.width.xmobile) {
          return xmobile!(context, constraints) ?? const Placeholder();
        } else if (mobile != null && width < screenSizes.width.mobile) {
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

/// A mixin that provides responsive layout capabilities for a widget.
///
/// This mixin allows a widget to define different layouts for mobile, tablet, xdesktop, desktop,
/// and tv screen sizes. It uses a [LayoutBuilder] to determine the width of the layout box
/// constraints and renders the appropriate layout based on the provided functions.
///
/// Example usage:
///
/// ```dart
/// class MyResponsiveWidget extends StatelessWidget with ResponsiveMixinLayout {
///   @override
///   Widget? mobileLayout(BuildContext context, BoxConstraints constraints) => MobileView();
///   @override
///   Widget? tabletLayout(BuildContext context, BoxConstraints constraints) => TabletView();
///   @override
///   Widget? desktopLayout(BuildContext context, BoxConstraints constraints) => DesktopView();
/// }
/// ```
///
/// @param xmobileLayout The function to build the xmobile layout.
/// @param mobileLayout The function to build the mobile layout.
/// @param tabletLayout The function to build the tablet layout.
/// @param xdesktopLayout The function to build the xdesktop layout.
/// @param desktopLayout The function to build the desktop layout.
/// @param tvLayout The function to build the tv layout.
mixin ResponsiveMixinLayout<T extends Widget> on Widget {
  /// This bool is used to switch between getting screen size from screen size or layout box constraints.
  bool get basedOnLayout => false;

  Widget? xmobileLayout(BuildContext context, BoxConstraints constraints) =>
      null;
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
    final screenSizes = Utils.screenSizes(context);

    return LayoutBuilder(
      builder: (context, constraints) {
        final width = basedOnLayout
            ? constraints.maxWidth
            : MediaQuery.of(context).size.width;

        if (xmobileLayout(context, constraints) != null &&
            width < screenSizes.width.xmobile) {
          return mobileLayout(context, constraints) ?? const Placeholder();
        } else if (mobileLayout(context, constraints) != null &&
            width < screenSizes.width.mobile) {
          return mobileLayout(context, constraints) ?? const Placeholder();
        } else if (tabletLayout(context, constraints) != null &&
            width < screenSizes.width.tablet) {
          return tabletLayout(context, constraints) ?? const Placeholder();
        } else if (xdesktopLayout(context, constraints) != null &&
            width < screenSizes.width.xdesktop) {
          return desktopLayout(context, constraints) ?? const Placeholder();
        } else if (desktopLayout(context, constraints) != null &&
            width < screenSizes.width.desktop) {
          return desktopLayout(context, constraints) ?? const Placeholder();
        }
        return tvLayout(context, constraints) ?? const Placeholder();
      },
    );
  }

  Widget build(BuildContext context) => buildResponsiveLayout(context);
}

/// A mixin that provides responsive layout capabilities for a `StatefulWidget`.
///
/// This mixin allows a `StatefulWidget` to define different layouts for mobile, tablet, xdesktop,
/// desktop, and tv screen sizes. It uses a [LayoutBuilder] to determine the width of the layout
/// box constraints and renders the appropriate layout based on the provided functions.
///
/// Example usage:
///
/// ```dart
/// class MyResponsiveStatefulWidget extends StatefulWidget {
///   @override
///   _MyResponsiveStatefulWidgetState createState() => _MyResponsiveStatefulWidgetState();
/// }
///
/// class _MyResponsiveStatefulWidgetState extends State<MyResponsiveStatefulWidget>
///     with ResponsiveMixinLayoutStateful {
///   @override
///   Widget? mobileLayout(BuildContext context, BoxConstraints constraints) => MobileView();
///   @override
///   Widget? tabletLayout(BuildContext context, BoxConstraints constraints) => TabletView();
///   @override
///   Widget? desktopLayout(BuildContext context, BoxConstraints constraints) => DesktopView();
/// }
/// ```
///
/// @param xmobileLayout The function to build the xmobile layout.
/// @param mobileLayout The function to build the mobile layout.
/// @param tabletLayout The function to build the tablet layout.
/// @param xdesktopLayout The function to build the xdesktop layout.
/// @param desktopLayout The function to build the desktop layout.
/// @param tvLayout The function to build the tv layout.
mixin ResponsiveMixinLayoutStateful<T extends StatefulWidget> on State<T> {
  /// This bool is used to switch between getting screen size from screen size or layout box constraints.
  bool get basedOnLayout => false;

  Widget? xmobileLayout(BuildContext context, BoxConstraints constraints) =>
      null;
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
    final screenSizes = Utils.screenSizes(context);

    return LayoutBuilder(
      builder: (context, constraints) {
        final width = basedOnLayout
            ? constraints.maxWidth
            : MediaQuery.of(context).size.width;

        if (xmobileLayout(context, constraints) != null &&
            width < screenSizes.width.xmobile) {
          return mobileLayout(context, constraints) ?? const Placeholder();
        } else if (mobileLayout(context, constraints) != null &&
            width < screenSizes.width.mobile) {
          return mobileLayout(context, constraints) ?? const Placeholder();
        } else if (tabletLayout(context, constraints) != null &&
            width < screenSizes.width.tablet) {
          return tabletLayout(context, constraints) ?? const Placeholder();
        } else if (xdesktopLayout(context, constraints) != null &&
            width < screenSizes.width.xdesktop) {
          return desktopLayout(context, constraints) ?? const Placeholder();
        } else if (desktopLayout(context, constraints) != null &&
            width < screenSizes.width.desktop) {
          return desktopLayout(context, constraints) ?? const Placeholder();
        }
        return tvLayout(context, constraints) ?? const Placeholder();
      },
    );
  }

  @override
  Widget build(BuildContext context) => buildResponsiveLayout(context);
}
