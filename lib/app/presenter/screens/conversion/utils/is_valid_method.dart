import '../../../../../l10n/app_localizations.dart';
import 'package:decimal/decimal.dart';
import 'package:flutter/cupertino.dart';

import '../../../../domain/view_datas/crypto_coin_view_data.dart';
import '../../../../domain/view_datas/portfolio_view_data.dart';

dynamic isValid(
  PortfolioViewData portfolio, {
  required String? text,
  required CryptoCoinViewData cryptoLeft,
  required CryptoCoinViewData cryptoRight,
  required BuildContext context,
  bool isCalledFromTextField = false,
}) {
  if (text == null ||
      text.isEmpty ||
      text == '${cryptoLeft.symbol.toUpperCase()} ') {
    return isCalledFromTextField
        ? CryptoAppStrings.of(context)!.insertAAmount
        : false;
  }
  if (text.length > cryptoLeft.symbol.length + 1) {
    var quantity = Decimal.parse(
      text.substring(cryptoLeft.symbol.length + 1).replaceAll(',', '.'),
    );
    var quantityInPortfolio = portfolio.coins
        .firstWhere(
          (coin) =>
              coin.symbol.toLowerCase() == cryptoLeft.symbol.toLowerCase(),
        )
        .quantity;
    if (quantity == Decimal.zero) {
      return isCalledFromTextField
          ? CryptoAppStrings.of(context)!.insertAAmountAboveZero
          : false;
    }
    if (quantity > quantityInPortfolio) {
      return isCalledFromTextField
          ? CryptoAppStrings.of(context)!.insertAAmountAvailable
          : false;
    }
  }
  if (cryptoLeft.id == cryptoRight.id) {
    return isCalledFromTextField
        ? 'Por favor escolha duas moedas diferentes'
        : false;
  }
  return isCalledFromTextField ? null : true;
}
