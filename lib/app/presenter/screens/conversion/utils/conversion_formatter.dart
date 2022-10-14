import 'dart:io';


import 'package:flutter/services.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../../domain/view_datas/crypto_coin_view_data.dart';

class ConversionFormatter extends TextInputFormatter {
  CryptoCoinViewData crypto;
  WidgetRef ref;
  ConversionFormatter(this.crypto, this.ref);

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
    if (Platform.localeName == 'en_US') {
      if (text.contains('.', text.indexOf('.') + 1) || text.contains(',')) {
        return TextEditingValue(
          text: oldValue.text,
          selection: TextSelection.collapsed(offset: oldValue.text.length),
        );
      }
    } else {
      if (text.contains(',', text.indexOf(',') + 1) || text.contains('.')) {
        return TextEditingValue(
          text: oldValue.text,
          selection: TextSelection.collapsed(offset: oldValue.text.length),
        );
      }
    }
    return TextEditingValue(
      text: text,
      selection: TextSelection.collapsed(offset: text.length),
    );
  }
}
