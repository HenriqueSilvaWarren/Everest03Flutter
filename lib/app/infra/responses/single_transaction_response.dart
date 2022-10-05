// ignore_for_file: non_constant_identifier_names, annotate_overrides, overridden_fields

import '../../domain/view_datas/transactions_view_data.dart';

class SingleTransactionResponse extends TransactionsViewData {
  String converted_crypto_amount;

  String received_crypto_amount;

  DateTime date_of_exchange;

  String value_of_transaction;

  SingleTransactionResponse({
    required this.converted_crypto_amount,
    required this.received_crypto_amount,
    required this.date_of_exchange,
    required this.value_of_transaction,
  }) : super(
          convertedCryptoAmount: converted_crypto_amount,
          receivedCryptoAmount: received_crypto_amount,
          dateOfExchange: date_of_exchange,
          valueOfTransaction: value_of_transaction,
        );

  factory SingleTransactionResponse.fromJson(Map<String, dynamic> json) {
    return SingleTransactionResponse(
      converted_crypto_amount: json['convertedCryptoAmount'],
      received_crypto_amount: json['receivedCryptoAmount'],
      date_of_exchange: DateTime.parse(json['dateOfExchange']),
      value_of_transaction: json['valueOfTransaction'],
    );
  }

  Map<String, dynamic> toJson() => {
        'convertedCryptoAmount': converted_crypto_amount,
        'receivedCryptoAmount': received_crypto_amount,
        'dateOfExchange': date_of_exchange,
        'valueOfTransaction': value_of_transaction,
      };
}
