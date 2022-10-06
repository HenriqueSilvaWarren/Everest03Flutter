import 'package:brasil_fields/brasil_fields.dart';
import 'package:decimal/decimal.dart';
import 'package:flutter/material.dart';

import '../../../../domain/view_datas/crypto_coin_view_data.dart';

String getValueHelperText({
  required TextEditingController controller,
  required CryptoCoinViewData crypto,
}) {
  if (controller.text.isEmpty ||
      controller.text == '${crypto.symbol.toUpperCase()} ') {
    return 'R\$ 0,00';
  }
  String quantity = controller.text.split(' ')[1];
  quantity = quantity.replaceAll(',', '.');
  Decimal decimalQuantity = Decimal.parse(quantity);
  Decimal actualValue = decimalQuantity * crypto.currentPrice;
  return UtilBrasilFields.obterReal(actualValue.toDouble());
}
