// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_portfolio_by_id_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetPortfolioByIdResponse _$GetPortfolioByIdResponseFromJson(
        Map<String, dynamic> json) =>
    GetPortfolioByIdResponse(
      symbol: json['symbol'] as String,
      name: json['name'] as String,
      quantity: const DecimalConverter().fromJson(json['quantity'] as num),
    );

Map<String, dynamic> _$GetPortfolioByIdResponseToJson(
        GetPortfolioByIdResponse instance) =>
    <String, dynamic>{
      'symbol': instance.symbol,
      'name': instance.name,
      'quantity': const DecimalConverter().toJson(instance.quantity),
    };
