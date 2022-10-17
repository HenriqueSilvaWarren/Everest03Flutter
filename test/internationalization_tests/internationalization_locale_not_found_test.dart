import 'package:card_02_listagem_crypto/l10n/app_localizations.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_test/flutter_test.dart';

import '../helpers/internationalization_widget_tester.dart';
import '../helpers/setupl10n.dart';

void main() {
  test(
    'WHEN lookingUp wrong CryptoAppStrings locale THEN throw flutter error',
    () {
      expect(
          () => lookupCryptoAppStrings(
                const Locale('ru'),
              ),
          throwsFlutterError);
    },
  );
}
