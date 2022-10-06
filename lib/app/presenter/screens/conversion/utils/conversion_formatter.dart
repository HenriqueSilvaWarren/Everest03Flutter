import 'package:flutter/services.dart';

import '../../../../domain/view_datas/crypto_coin_view_data.dart';

class ConversionFormatter extends TextInputFormatter {
  CryptoCoinViewData crypto;

  ConversionFormatter(this.crypto);

  @override
  TextEditingValue formatEditUpdate(
    TextEditingValue oldValue,
    TextEditingValue newValue,
  ) {
    String text = newValue.text.trim();
    if (text.length < crypto.symbol.length + 1) {
      return TextEditingValue(
        text: '${crypto.symbol.toUpperCase()} ',
        selection: TextSelection.collapsed(
          offset: crypto.symbol.length + 1,
        ),
      );
    }
    if (text.length > crypto.symbol.length + 1) {
      switch (text[crypto.symbol.length + 1]) {
        case ',':
        case '.':
          return TextEditingValue(
            text: '${crypto.symbol.toUpperCase()} ',
            selection:
                TextSelection.collapsed(offset: crypto.symbol.length + 1),
          );
      }
    }
    if (text.contains(',', text.indexOf(',') + 1) || text.contains('.')) {
      return TextEditingValue(
        text: oldValue.text,
        selection: TextSelection.collapsed(offset: oldValue.text.length),
      );
    }
    return TextEditingValue(
      text: text,
      selection: TextSelection.collapsed(offset: text.length),
    );
  }
}
