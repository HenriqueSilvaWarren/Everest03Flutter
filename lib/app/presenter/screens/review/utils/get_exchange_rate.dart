import 'dart:io';

import 'package:decimal/decimal.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

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
    toBigInt: (p0) => p0.toBigInt(),
  );

  return '1 $convSymbol = ${Platform.localeName == 'en_US' ? exchange : exchange.toString().replaceAll('.', ',')} $recSymbol';
}
