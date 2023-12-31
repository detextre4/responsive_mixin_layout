import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:responsive_mixin_layout/responsive_mixin_layout.dart';

void main() {
  testWidgets('Mobile layout should display correctly',
      (WidgetTester tester) async {
    await tester.pumpWidget(
      MaterialApp(
        home: ResponsiveLayout(
          mobile: (context, constraints) => Container(
            color: Colors.red,
            child: const Text('Mobile Layout'),
          ),
        ),
      ),
    );

    expect(find.text('Mobile Layout'), findsOneWidget);
    expect(find.byType(Container), findsOneWidget);
    expect(find.byType(Text), findsOneWidget);
    expect(find.byType(ResponsiveLayout), findsOneWidget);
  });
}
