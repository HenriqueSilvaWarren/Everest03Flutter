// ignore_for_file: non_constant_identifier_names

class TransactionsViewData {
  String convertedCryptoAmount;
  String receivedCryptoAmount;
  DateTime dateOfExchange;
  String valueOfTransaction;

  TransactionsViewData({
    required this.convertedCryptoAmount,
    required this.receivedCryptoAmount,
    required this.dateOfExchange,
    required this.valueOfTransaction,
  });  
}
