// ignore_for_file: non_constant_identifier_names

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
}
