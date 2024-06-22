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
  responsive_mixin_layout: ^1.0.2
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
class HomePage extends StatelessWidget with ResponsiveLayoutMixin {
  const HomePage({super.key});

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

## Contribution

Contributions are welcome. If you find any issues or have any suggestions for improvement, you can open an [issue](https://github.com/your_username/your_package/issues) or submit a [pull request](https://github.com/your_username/your_package/pulls) on the GitHub repository. 
 
## Support

If you have any questions or need additional help, you can contact the development team at [detextre4@gmail.com](mailto:detextre4@gmail.com).