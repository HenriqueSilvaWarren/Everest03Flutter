import 'package:decimal/decimal.dart';

String getExchangeRate(List<String> convCrypto, List<String> recCrypto) {
  String convSymbol = convCrypto[1];
  String recSymbol = recCrypto[1];

  Decimal exchange = (Decimal.parse(
            recCrypto[0].replaceAll(',', '.'),
          ) /
          Decimal.parse(
            convCrypto[0].replaceAll(',', '.'),
          ))
      .toDecimal();

  return '1 $convSymbol = $exchange $recSymbol';
}
