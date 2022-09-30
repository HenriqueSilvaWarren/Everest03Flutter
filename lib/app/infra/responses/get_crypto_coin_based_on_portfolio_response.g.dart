// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_crypto_coin_based_on_portfolio_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetCryptoCoinBasedOnPortfolioResponse
    _$GetCryptoCoinBasedOnPortfolioResponseFromJson(
            Map<String, dynamic> json) =>
        GetCryptoCoinBasedOnPortfolioResponse(
          id: json['id'] as String,
          symbol: json['symbol'] as String,
          name: json['name'] as String,
          image: json['image'] as String,
          current_price: Decimal.fromJson(json['current_price'].toString()),
          price_change_percentage_24h:
              Decimal.fromJson(json['price_change_percentage_24h'].toString()),
        );

Map<String, dynamic> _$GetCryptoCoinBasedOnPortfolioResponseToJson(
        GetCryptoCoinBasedOnPortfolioResponse instance) =>
    <String, dynamic>{
      'id': instance.id,
      'symbol': instance.symbol,
      'name': instance.name,
      'image': instance.image,
      'current_price': instance.current_price,
      'price_change_percentage_24h': instance.price_change_percentage_24h,
    };
