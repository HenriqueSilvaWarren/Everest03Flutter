// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_crypto_coin_based_on_portfolio_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetCryptoCoinResponse _$GetCryptoCoinResponseFromJson(
        Map<String, dynamic> json) =>
    GetCryptoCoinResponse(
      id: json['id'] as String,
      symbol: json['symbol'] as String,
      name: json['name'] as String,
      image: json['image'] as String,
      current_price:
          const DecimalConverter().fromJson(json['current_price'] as num),
      price_change_percentage_24h: const DecimalConverter()
          .fromJson(json['price_change_percentage_24h'] as num),
    );

Map<String, dynamic> _$GetCryptoCoinResponseToJson(
        GetCryptoCoinResponse instance) =>
    <String, dynamic>{
      'id': instance.id,
      'symbol': instance.symbol,
      'name': instance.name,
      'image': instance.image,
      'current_price': const DecimalConverter().toJson(instance.current_price),
      'price_change_percentage_24h':
          const DecimalConverter().toJson(instance.price_change_percentage_24h),
    };
