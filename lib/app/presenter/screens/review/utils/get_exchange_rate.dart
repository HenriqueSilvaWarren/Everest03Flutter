
import 'package:decimal/decimal.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../riverpod/view/locale_state_provider.dart';

String getExchangeRate(
    List<String> convCrypto, List<String> recCrypto, WidgetRef ref) {
  String convSymbol = convCrypto[1];
  String recSymbol = recCrypto[1];

  Decimal exchange = (Decimal.parse(
            recCrypto[0].replaceAll(',', '.'),
          ) /
          Decimal.parse(
            convCrypto[0].replaceAll(',', '.'),
          ))
      .toDecimal(
    scaleOnInfinitePrecision: 8,
    toBigInt: (p0) => p0.toBigInt(), // coverage:ignore-line
  );

  return '1 $convSymbol = ${ref.watch(localeStateProvider) == const Locale('en', 'US') ? exchange : exchange.toString().replaceAll('.', ',')} $recSymbol';
}
