import 'dart:io';

import 'package:card_02_listagem_crypto/l10n/app_localizations.dart';
import 'package:flutter/cupertino.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../../domain/view_datas/crypto_coin_view_data.dart';
import 'package:decimal/decimal.dart';


String exchangedCurrency({
  required String controllerText,
  required CryptoCoinViewData cryptoLeft,
  required CryptoCoinViewData cryptoRight,
  required BuildContext context,
  required WidgetRef ref,
}) {
  if (controllerText.isEmpty ||
      controllerText == '${cryptoLeft.symbol.toUpperCase()} ') {
    return CryptoAppStrings.of(context)!.valueWasntInformed;
  }

  String quantity = controllerText.split(' ')[1];
  quantity = quantity.replaceAll(',', '.');
  Decimal decimalQuantity = Decimal.parse(quantity);
  Decimal decimalValue = decimalQuantity * cryptoLeft.currentPrice;
  Decimal actualAmount = (decimalValue / cryptoRight.currentPrice).toDecimal(
    scaleOnInfinitePrecision: 8,
    toBigInt: (p0) => p0.toBigInt(),
  );
  String symbol = cryptoRight.symbol.toUpperCase();
  return '${Platform.localeName == 'en_US' ? actualAmount : actualAmount.toString().replaceAll('.', ',')} $symbol';
}
