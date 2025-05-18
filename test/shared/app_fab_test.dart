import 'package:budget_fusion_app/core/core.dart';
import 'package:budget_fusion_app/shared/shared.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('AppFab.save shows a check icon and calls onPressed', (WidgetTester tester) async {
    var pressed = false;
    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          floatingActionButton: AppFab.save(() {
            pressed = true;
          }),
        ),
      ),
    );
    expect(find.byIcon(Icons.check), findsOneWidget);
    expect(pressed, isFalse);
    await tester.tap(find.byType(FloatingActionButton));
    expect(pressed, isTrue);
    final fab = tester.widget<FloatingActionButton>(find.byType(FloatingActionButton));
    expect(fab.backgroundColor, AppColors.accentColor);
    expect(fab.foregroundColor, AppColors.primaryTextColor);
  });

  testWidgets('AppFab.add shows an add icon and calls onPressed', (WidgetTester tester) async {
    var pressed = false;
    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          floatingActionButton: AppFab.add(() {
            pressed = true;
          }),
        ),
      ),
    );
    expect(find.byIcon(Icons.add), findsOneWidget);
    expect(pressed, isFalse);
    await tester.tap(find.byType(FloatingActionButton));
    expect(pressed, isTrue);
    final fab = tester.widget<FloatingActionButton>(find.byType(FloatingActionButton));
    expect(fab.backgroundColor, AppColors.accentColor);
    expect(fab.foregroundColor, AppColors.primaryTextColor);
  });
}
