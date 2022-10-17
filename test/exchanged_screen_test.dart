import 'dart:io';

import 'package:card_02_listagem_crypto/app/presenter/screens/exchanged/exchanged_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'helpers/setup_widget_tester.dart';

void main() {
  setUpAll(
    () => HttpOverrides.global = null,
  );

  testWidgets(
    'WHEN load FinishConversionButton THEN ensure click FinishConversionButton with no receiving crypto',
    (tester) async {
      await tester.pumpWidget(
        const SetupWidgetTester(
          child: ExchangedScreen(),
        ),
      );

      await tester.pump(const Duration(seconds: 1));
      await tester.pump(const Duration(seconds: 1));
      await tester.pump(const Duration(seconds: 1));
      await tester.pump(const Duration(seconds: 1));
    },
  );
  testWidgets(
    'WHEN load FinishConversionButton THEN ensure click FinishConversionButton with no receiving crypto',
    (tester) async {
      await tester.pumpWidget(
        const SetupWidgetTester(
          child: ExchangedScreen(),
        ),
      );

      await tester.tap(
        find.byType(IconButton),
      );
      await tester.pump(const Duration(seconds: 5));
    },
  );
}
