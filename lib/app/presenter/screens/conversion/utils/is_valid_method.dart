import 'package:decimal/decimal.dart';

import '../../../../domain/view_datas/crypto_coin_view_data.dart';
import '../../../../domain/view_datas/portfolio_view_data.dart';

dynamic isValid(
  PortfolioViewData portfolio, {
  required String? text,
  required CryptoCoinViewData cryptoLeft,
  required CryptoCoinViewData cryptoRight,
  bool isCalledFromTextField = false,
}) {
  if (text == null ||
      text.isEmpty ||
      text == '${cryptoLeft.symbol.toUpperCase()} ') {
    return isCalledFromTextField ? 'Por favor insira algum valor' : false;
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
          ? 'Por favor insira um valor acima de 0'
          : false;
    }
    if (quantity > quantityInPortfolio) {
      return isCalledFromTextField
          ? 'Por favor insira um valor abaixo ou igual a quantidade possuída'
          : false;
    }
  }
  if (cryptoLeft.id == cryptoRight.id) {
    return isCalledFromTextField ? 'Por favor escolha duas moedas diferentes' : false;
  }
  return isCalledFromTextField ? null : true;
}
