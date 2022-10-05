// ignore_for_file: non_constant_identifier_names

class TransactionsViewData {
  String converted_crypto_amount;
  String received_crypto_amount;
  DateTime date_of_exchange;
  String value_of_transaction;

  TransactionsViewData({
    required this.converted_crypto_amount,
    required this.received_crypto_amount,
    required this.date_of_exchange,
    required this.value_of_transaction,
  });  
}
