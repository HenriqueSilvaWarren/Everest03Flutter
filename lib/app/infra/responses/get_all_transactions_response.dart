// ignore_for_file: non_constant_identifier_names

import 'package:card_02_listagem_crypto/app/domain/view_datas/list_transactions_view_data.dart';
import 'package:card_02_listagem_crypto/app/domain/view_datas/transactions_view_data.dart';
import 'package:json_annotation/json_annotation.dart';

import 'single_transaction_response.dart';

part 'get_all_transactions_response.g.dart';

@JsonSerializable()
class GetAllTransactionsResponse {
  List<SingleTransactionResponse> list_transactions;

  GetAllTransactionsResponse({
    required this.list_transactions,
  });

  factory GetAllTransactionsResponse.fromJson(Map<String, dynamic> json) {
    return _$GetAllTransactionsResponseFromJson(json);
  }

  Map<String, dynamic> toJson() => _$GetAllTransactionsResponseToJson(this);

  ListTransactionsViewData toViewData() {
    var viewData = list_transactions
        .map(
          (transaction) => TransactionsViewData(
            convertedCryptoAmount: transaction.converted_crypto_amount,
            receivedCryptoAmount: transaction.received_crypto_amount,
            dateOfExchange: transaction.date_of_exchange,
            valueOfTransaction: transaction.value_of_transaction,
          ),
        )
        .toList();

    return ListTransactionsViewData(listTransactions: viewData);
  }
}
