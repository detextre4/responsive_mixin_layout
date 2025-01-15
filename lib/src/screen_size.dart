import 'package:flutter/material.dart';
import 'package:responsive_mixin_layout/src/utils.dart';

// * Responsive sizes
/// A list of sizes from device screen resolution
class ScreenSizes extends StatelessWidget {
  const ScreenSizes({
    super.key,
    required this.child,
    this.width = const ScreenWidth(),
    this.height = const ScreenHeight(),
  });

  final Widget child;
  final ScreenWidth width;
  final ScreenHeight height;

  @override
  Widget build(BuildContext context) => child;
}

/// values in [ScreenWidth] represents limit about each resolution
class ScreenWidth {
  const ScreenWidth({
    this.context,
    this.xmobile = 400,
    this.mobile = 600,
    this.tablet = 880,
    this.xdesktop = 1280,
    this.desktop = 2000,
    this.tv = 4000,
  });

  final BuildContext? context;

  /// The data from the closest instance of this class that encloses the given
  /// context.
  ///
  /// You can use this function to query the size and orientation of the screen,
  /// as well as other media parameters (see [MediaQueryData] for more
  /// examples). When that information changes, your widget will be scheduled to
  /// be rebuilt, keeping your widget up-to-date.
  ///
  /// If the widget only requires a subset of properties of the [MediaQueryData]
  MediaQueryData get media {
    assert(context != null, Utils.missingContextText);
    return MediaQuery.of(context!);
  }

  /// The horizontal extent of this size.
  double get screenWidth {
    assert(context != null, Utils.missingContextText);
    return MediaQuery.of(context!).size.width;
  }

  /// represent 400 viewport width
  final double xmobile;

  /// represent 600 viewport width
  final double mobile;

  /// represent 880 viewport width
  final double tablet;

  /// represent 1280 viewport width
  final double xdesktop;

  /// represent 2000 viewport width
  final double desktop;

  /// represent 4000 or more viewport width
  final double tv;

  /// represent range between 0 - 400 viewport width
  bool get isXmobile => media.size.width <= xmobile;

  /// represent range between 400 - 600 viewport width
  bool get isMobile => media.size.width <= mobile;

  /// represent range between 600 - 880 viewport width
  bool get isTablet => media.size.width <= tablet;

  /// represent range between 880 - 1280 viewport width
  bool get isXDesktop => media.size.width <= xdesktop;

  /// represent range between 1280 - 2000 viewport width
  bool get isDesktop => media.size.width <= desktop;

  /// represent range between 2000 - 4000 or more viewport width
  bool get isTv => media.size.width > desktop;

  ScreenWidth copyWith({
    BuildContext? context,
    double? xmobile,
    double? mobile,
    double? tablet,
    double? xdesktop,
    double? desktop,
    double? tv,
  }) =>
      ScreenWidth(
        context: context ?? this.context,
        xmobile: xmobile ?? this.xmobile,
        mobile: mobile ?? this.mobile,
        tablet: tablet ?? this.tablet,
        xdesktop: xdesktop ?? this.xdesktop,
        desktop: desktop ?? this.desktop,
        tv: tv ?? this.tv,
      );
}

/// values in [ScreenHeight] represents limit about each resolution
class ScreenHeight {
  const ScreenHeight({
    this.context,
    this.small = 720,
    this.medium = 1024,
    this.large = 2048,
  });

  final BuildContext? context;

  /// The data from the closest instance of this class that encloses the given
  /// context.
  ///
  /// You can use this function to query the size and orientation of the screen,
  /// as well as other media parameters (see [MediaQueryData] for more
  /// examples). When that information changes, your widget will be scheduled to
  /// be rebuilt, keeping your widget up-to-date.
  ///
  /// If the widget only requires a subset of properties of the [MediaQueryData]
  MediaQueryData get media {
    assert(context != null, Utils.missingContextText);
    return MediaQuery.of(context!);
  }

  /// The vertical extent of this size.
  double get screenHeight {
    assert(context != null, Utils.missingContextText);
    return MediaQuery.of(context!).size.height;
  }

  /// represent 400 viewport height
  final double small;

  /// represent 720 viewport height
  final double medium;

  /// represent 1024 or more viewport height
  final double large;

  /// represent range between 0 - 400 viewport height
  bool get isSmall => media.size.height <= small;

  /// represent range between 400 - 720 viewport height
  bool get isMedium => media.size.height <= medium;

  /// represent range between 720 - 1024 or more viewport height
  bool get isLarge => media.size.height > medium;

  ScreenHeight copyWith({
    BuildContext? context,
    double? small,
    double? medium,
    double? large,
  }) =>
      ScreenHeight(
        context: context ?? this.context,
        small: small ?? this.small,
        medium: medium ?? this.medium,
        large: large ?? this.large,
      );
}
