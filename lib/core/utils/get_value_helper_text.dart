import 'package:brasil_fields/brasil_fields.dart';
import 'package:decimal/decimal.dart';

import '../../app/domain/view_datas/crypto_coin_view_data.dart';

String getValueHelperText({
  required String controllerText,
  required CryptoCoinViewData crypto,
}) {
  if (controllerText.isEmpty ||
      controllerText == '${crypto.symbol.toUpperCase()} ') {
    return 'R\$ 0,00';
  }
  String quantity = controllerText.split(' ')[1];
  quantity = quantity.replaceAll(',', '.');
  Decimal decimalQuantity = Decimal.parse(quantity);
  Decimal actualValue = decimalQuantity * crypto.currentPrice;
  return UtilBrasilFields.obterReal(actualValue.toDouble());
}
