// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_all_transactions_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetAllTransactionsResponse _$GetAllTransactionsResponseFromJson(
        Map<String, dynamic> json) =>
    GetAllTransactionsResponse(
      list_transactions: (json['list_transactions'] as List<dynamic>)
          .map((e) =>
              SingleTransactionResponse.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$GetAllTransactionsResponseToJson(
        GetAllTransactionsResponse instance) =>
    <String, dynamic>{
      'list_transactions': instance.list_transactions,
    };
