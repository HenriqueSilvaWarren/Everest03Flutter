import 'package:card_02_listagem_crypto/l10n/app_localizations.dart';
import 'package:flutter_test/flutter_test.dart';


void main() {
  test(
    'WHEN reload CryptoAppStrings THEN return false',
    () {
      expect(
        CryptoAppStrings.delegate.shouldReload.call(CryptoAppStrings.delegate),
        false,
      );
    },
  );
}
