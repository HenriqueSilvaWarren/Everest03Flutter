// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'dart:io';

import 'package:card_02_listagem_crypto/app/presenter/screens/splash/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'helpers/setup_widget_tester.dart';

void main() {
  setUpAll(
    () => HttpOverrides.global = null,
  );
  testWidgets('WHEN load SplashScreen THEN ensure Warren Image is loaded',
      (WidgetTester tester) async {
    await tester.pumpWidget(
      const SetupWidgetTester(
        child: SplashScreen(),
      ),
    );

    expect(
      find.image(const AssetImage('assets/images/warren.png')),
      findsOneWidget,
    );

    await tester.pump(
      const Duration(seconds: 4),
    );
    await tester.pump(
      const Duration(seconds: 4),
    );
  });
}
