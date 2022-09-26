// ignore_for_file: non_constant_identifier_names

import 'package:decimal/decimal.dart';
import 'package:json_annotation/json_annotation.dart';

part 'get_crypto_coin_based_on_portfolio_response.g.dart';

@JsonSerializable()
class GetCryptoCoinBasedOnPortfolioResponse {
  final String id;
  final String symbol;
  final String name;
  final String image;
  final Decimal current_price;
  final Decimal price_change_percentage_24h;

  GetCryptoCoinBasedOnPortfolioResponse({
    required this.id,
    required this.symbol,
    required this.name,
    required this.image,
    required this.current_price,
    required this.price_change_percentage_24h,
  });

  factory GetCryptoCoinBasedOnPortfolioResponse.fromJson(
      Map<String, dynamic> json) {
  
    return _$GetCryptoCoinBasedOnPortfolioResponseFromJson(json);
  }

  Map<String, dynamic> toJson() =>
      _$GetCryptoCoinBasedOnPortfolioResponseToJson(this);
}
