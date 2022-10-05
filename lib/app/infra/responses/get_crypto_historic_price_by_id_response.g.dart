// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_crypto_historic_price_by_id_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetCryptoHistoricPriceByIdResponse _$GetCryptoHistoricPriceByIdResponseFromJson(
        Map<String, dynamic> json) =>
    GetCryptoHistoricPriceByIdResponse(
      prices: const ListDecimalConverter().fromJson(json['prices'] as List),
    );

Map<String, dynamic> _$GetCryptoHistoricPriceByIdResponseToJson(
        GetCryptoHistoricPriceByIdResponse instance) =>
    <String, dynamic>{
      'prices': const ListDecimalConverter().toJson(instance.prices),
    };
