import 'package:card_02_listagem_crypto/app/domain/view_datas/crypto_coin_view_data.dart';
import 'package:decimal/decimal.dart';

String exchangedCurrency({
  required String controllerText,
  required CryptoCoinViewData cryptoLeft,
  required CryptoCoinViewData cryptoRight,
}) {
  if (controllerText.isEmpty ||
      controllerText == '${cryptoLeft.symbol.toUpperCase()} ') {
    return 'Valor não informado';
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
  return '${actualAmount.toString().replaceAll('.', ',')} $symbol';
}
