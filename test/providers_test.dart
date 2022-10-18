import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'helpers/setup_providers.dart';

void main() {
  testWidgets(
    'WHEN load SetupProviders THEN ensure watch all providers',
    (tester) async {
      await tester.pumpWidget(
        const ProviderScope(
          child: MaterialApp(
            home: SetupProviders(),
          ),
        ),
      );

      await tester.pump(const Duration(seconds: 4));
      await tester.pump(const Duration(seconds: 4));
    },
  );
}
 