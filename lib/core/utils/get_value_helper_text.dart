import 'package:decimal/decimal.dart';

import '../../app/domain/view_datas/crypto_coin_view_data.dart';

double getValueHelperText({
  required String controllerText,
  required CryptoCoinViewData crypto,
}) {
  if (controllerText.isEmpty ||
      controllerText == '${crypto.symbol.toUpperCase()} ') {
    return 0.00;
  }
  String quantity = controllerText.split(' ')[1];
  quantity = quantity.replaceAll(',', '.');
  Decimal decimalQuantity = Decimal.parse(quantity);
  Decimal actualValue = decimalQuantity * crypto.currentPrice;
  return actualValue.toDouble();
}
