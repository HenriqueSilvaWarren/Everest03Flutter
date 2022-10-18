import 'package:flutter_test/flutter_test.dart';

import 'helpers/setup_core.dart';

void main() {
  testWidgets(
    "WHEN load SetupCore THEN ensure run its methods",
    (tester) async {
      await tester.pumpWidget(
        const SetupCore(),
      );
    },
  );
}