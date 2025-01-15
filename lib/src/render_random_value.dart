import 'dart:math';
import 'package:flutter/material.dart';

/// A widget that generates a random integer within a specified range
class RenderRandomInt extends StatefulWidget {
  const RenderRandomInt({
    super.key,
    this.range = 10,
    required this.builder,
  });

  /// The range within which the random integer will be generated
  final int range;

  /// A function that builds the widget using the generated random integer
  final Widget Function(BuildContext context, int randomInt) builder;

  @override
  State<RenderRandomInt> createState() => _RenderRandomIntState();
}

class _RenderRandomIntState extends State<RenderRandomInt> {
  /// The generated random integer
  late int randomInt = Random().nextInt(widget.range - 1) + 1;

  @override
  Widget build(BuildContext context) => widget.builder(context, randomInt);
}

/// A widget that generates a random double within a specified range
class RenderRandomDouble extends StatefulWidget {
  const RenderRandomDouble({
    super.key,
    this.range = 10.0,
    required this.builder,
  });

  /// The range within which the random double will be generated
  final double range;

  /// A function that builds the widget using the generated random double
  final Widget Function(BuildContext context, double randomDouble) builder;

  @override
  State<RenderRandomDouble> createState() => _RenderRandomDoubleState();
}

class _RenderRandomDoubleState extends State<RenderRandomDouble> {
  /// The generated random double
  late double randomDouble = Random().nextDouble() * widget.range;

  @override
  Widget build(BuildContext context) => widget.builder(context, randomDouble);
}

/// A widget that generates a random boolean value
class RenderRandomBool extends StatefulWidget {
  const RenderRandomBool({
    super.key,
    required this.builder,
  });

  /// A function that builds the widget using the generated random boolean value
  final Widget Function(BuildContext context, bool randomBool) builder;

  @override
  State<RenderRandomBool> createState() => _RenderRandomBoolState();
}

class _RenderRandomBoolState extends State<RenderRandomBool> {
  /// The generated random boolean value
  late bool randomBool = Random().nextBool();

  @override
  Widget build(BuildContext context) => widget.builder(context, randomBool);
}
