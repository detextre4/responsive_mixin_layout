## 1.0.0

* Initial release of the package.
* Added the `ResponsiveLayout` widget to create responsive layouts in Flutter.
* Provides custom widgets for mobile devices, tablets, desktops, and TVs.
* Allows customization of the application's appearance based on the device's screen size.

## 1.0.1

* Changed `ScreenSize` class name to `ScreenSizes`.
* Updated extension on context to have getters.

## 1.0.2

* Changed `ResponsiveLayoutMixin` mixin name to `ResponsiveMixinLayout`.

## 1.0.3

* Updated Flutter SDK.
* Updated README.

## 1.1.0

* Added `ScreenWidth` and `ScreenHeight` classes to record sizes and methods.

## 1.2.0

* Added `basedOnLayout` bool on `ResponsiveLayout` to switch between getting screen size from screen size or layout box constraints.

## 1.3.0

* Added `xdesktop` field into `ScreenSizes`.

## 1.4.0

* Added `screenWidth` and `screenHeight` fields into `BuildContext` extension.

## 1.5.0

### Added

- `RenderBoxBuilder`: A widget that provides access to the `RenderBox` of its child widget and triggers a callback.
- `BoxSizeListener`: A widget that listens for size changes of its child widget and triggers a callback.
- `ScreenSizeListener`: A widget that listens for screen size changes and triggers a callback.
- `TextScalerBuilder`: A widget that provides a custom text scaling factor based on the screen size.
- `DoubleExtension`: An extension for the `double` class that provides additional utility methods, including `clampInverted` and `clampMapRanged`.

### Changed

- Improved documentation and examples in the README file.
- Updated the `ResponsiveLayout` and `ResponsiveMixinLayout` widgets to enhance flexibility and usability.

### Fixed

- Minor bug fixes and performance improvements.
