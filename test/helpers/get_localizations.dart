import 'package:card_02_listagem_crypto/l10n/app_localizations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

Future<CryptoAppStrings> getLocalizations(WidgetTester t) async {
  late CryptoAppStrings result;
  await t.pumpWidget(
    MaterialApp(
      localizationsDelegates: CryptoAppStrings.localizationsDelegates,
      supportedLocales: CryptoAppStrings.supportedLocales,
      home: Material(
        child: Builder(
          builder: (BuildContext context) {
            result = CryptoAppStrings.of(context)!;
            return Container();
          },
        ),
      ),
    ),
  );
  return result;
}
