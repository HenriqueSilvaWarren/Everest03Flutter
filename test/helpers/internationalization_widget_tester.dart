import 'package:card_02_listagem_crypto/core/utils/generate_route.dart';
import 'package:card_02_listagem_crypto/l10n/app_localizations.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';


class InternationalizationWidgetTester extends ConsumerWidget {
  final Widget child;
  final Locale locale;
  const InternationalizationWidgetTester({
    Key? key,
    required this.child,
    required this.locale,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return MaterialApp(
      home: Material(
        child: child,
      ),
      localizationsDelegates: CryptoAppStrings.localizationsDelegates,
      supportedLocales: CryptoAppStrings.supportedLocales,
      locale: locale,
      onGenerateRoute: generateRoute,
    );
  }
}
