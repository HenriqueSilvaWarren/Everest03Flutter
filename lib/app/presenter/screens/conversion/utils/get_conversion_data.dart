Map<String, List<String>> getConversionData(
  String cryptoFromField,
  String exchangedCurrency,
) {
  List<String> splittedCryptoFromField = cryptoFromField.split(' ');
  List<String> splittedExchangedCurrency = exchangedCurrency.split(' ');
  return {
    "convertingCrypto": splittedCryptoFromField.reversed.toList(),
    "receivingCrypto": splittedExchangedCurrency,
  };
}
