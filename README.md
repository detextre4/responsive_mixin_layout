# Responsive Mixin Layout

The Flutter Responsive Layout package provides an easy way to create responsive layouts in Flutter that adapt to different screen sizes. It allows you to customize the appearance of your Flutter applications on mobile devices, tablets, desktops, and TVs. 
 
## Features

- Adapt your application's content based on the device's screen size. 
- Provides custom widgets for mobile devices, tablets, desktops, and TVs. 
- Easy to use and integrate into your existing Flutter application. 
 
## Getting Started

Make sure you have Flutter installed on your machine. For more information on how to install Flutter, please refer to the [official Flutter documentation](https://flutter.dev/docs/get-started/install).

## Installation 

Add the following dependency to your `pubspec.yaml`:

```yaml
dependencies: 
  responsive_mixin_layout: ^1.6.0
```

Then, run the command  flutter pub get  to get the dependencies. 

## Setup
Wrap your materialApp with [ScreenSizes] widget, you can configure globally screen width and height values in this widget
```dart
ScreenSizes(
  child: MaterialApp(
    theme: ThemeApp.of(context),
    navigatorKey: navigatorKey,
    debugShowCheckedModeBanner: false,
  ),
)
```
 
## Usage
Here is a basic example of how to use the Flutter Responsive Mixin Layout package:

```dart
class HomePage extends StatelessWidget with ResponsiveMixinLayout {
  const HomePage({super.key});

  @override
  bool get basedOnLayout => true;

  @override
  Widget? desktopLayout(BuildContext context, BoxConstraints constraints) {
    return const Scaffold(
      body: _Page1(),
    );
  }

  @override
  Widget tabletLayout(BuildContext context, BoxConstraints constraints) {
    return Scaffold(
      body: PageView(
        children: const [
          _Page1(),
        ],
      ),
    );
  }
}
```

You can also use the `ResponsiveLayout`

```dart
import 'package:flutter/material.dart'; 
import 'package:responsive_mixin_layout/responsive_mixin_layout.dart'; 
 
void main() { 
  runApp(MyApp()); 
} 
 
class MyApp extends StatelessWidget { 
  @override 
  Widget build(BuildContext context) { 
    return ResponsiveLayout( 
      mobile: (context, constraints) { 
        // Widget para dispositivos móviles 
        return Container( 
          color: Colors.red, 
          child: Text('Mobile Layout'), 
        ); 
      }, 
      tablet: (context, constraints) { 
        // Widget para tabletas 
        return Container( 
          color: Colors.blue, 
          child: Text('Tablet Layout'), 
        ); 
      }, 
      desktop: (context, constraints) { 
        // Widget para escritorios 
        return Container( 
          color: Colors.green, 
          child: Text('Desktop Layout'), 
        ); 
      }, 
      tv: (context, constraints) { 
        // Widget para televisores 
        return Container( 
          color: Colors.yellow, 
          child: Text('TV Layout'), 
        ); 
      }, 
    ); 
  } 
}
```

## RenderBoxBuilder
A widget that provides access to the RenderBox of its child widget and triggers a callback.

### Example usage:

```dart
RenderBoxBuilder(
  child: YourWidget(),
  onRenderBox: (context, renderBox) {
    // Handle the RenderBox
    print('RenderBox size: ${renderBox.size}');
  },
)
```

## BoxSizeListener
A widget that listens for size changes of its child widget and triggers a callback.

### Example usage:

```dart
BoxSizeListener(
  child: YourWidget(),
  onSizeChanged: () {
    // Handle size change
    print('Size changed');
  },
)
```

## ScreenSizeListener
A widget that listens for screen size changes and triggers a callback.

### Example usage:

```dart
ScreenSizeListener(
  child: YourWidget(),
  onSizeChanged: (newSize) {
    // Handle screen size change
    print('Screen size changed: $newSize');
  },
)
```

## TextScalerBuilder
A widget that provides a custom text scaling factor based on the screen size.

### Example usage:

```dart
TextScalerBuilder(
  child: YourWidget(),
  scaler: (context) {
    // Calculate the scaling factor based on the screen size
    return context.width.screenWidth / 400.0;
  },
)
```

## DoubleExtension
An extension for the `double` class that provides additional utility methods.

### Methods:
* clampInverted(double lowerLimit, double upperLimit): Returns this double clamped to be in the range [lowerLimit]-[upperLimit] but inverted.

* clampMapRanged({bool invert = false, required double minRange, required double maxRange, required double minValue, required double maxValue}): Maps the value from one range to another and optionally inverts the result.

### Example usage:

```dart
void main() {
  double value = 5.0;
  double clampedInverted = value.clampInverted(1.0, 10.0);
  double mappedValue = value.clampMapRanged(
    minRange: 0.0,
    maxRange: 10.0,
    minValue: 100.0,
    maxValue: 200.0,
  );

  print('Clamped Inverted: $clampedInverted');
  print('Mapped Value: $mappedValue');
}
```

### Random Integer Widget
Use the RenderRandomInt widget to generate a random integer within a specified range and use it in your widget tree.

### Example usage:

```dart
import 'package:random_widgets_package/random_widgets_package.dart';

RenderRandomInt(
  range: 100,
  builder: (context, randomInt) {
    return Text('Random Integer: $randomInt');
  },
);
```

### Random Double Widget
Use the RenderRandomDouble widget to generate a random double within a specified range and use it in your widget tree.

### Example usage:

```dart
import 'package:random_widgets_package/random_widgets_package.dart';

RenderRandomDouble(
  range: 100.0,
  builder: (context, randomDouble) {
    return Text('Random Double: $randomDouble');
  },
);
```

### Random Boolean Widget
Use the RenderRandomBool widget to generate a random boolean value and use it in your widget tree.

### Example usage:

```dart
import 'package:random_widgets_package/random_widgets_package.dart';

RenderRandomBool(
  builder: (context, randomBool) {
    return Text('Random Boolean: $randomBool');
  },
);
```

## Contribution

Contributions are welcome. If you find any issues or have any suggestions for improvement, you can open an [issue](https://github.com/your_username/your_package/issues) or submit a [pull request](https://github.com/your_username/your_package/pulls) on the GitHub repository.
 
## Support

If you have any questions or need additional help, you can contact the development team at [detextre4@gmail.com](mailto:detextre4@gmail.com).