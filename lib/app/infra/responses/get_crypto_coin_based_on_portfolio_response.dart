// ignore_for_file: non_constant_identifier_names

import 'package:decimal/decimal.dart';
import 'package:json_annotation/json_annotation.dart';

part 'get_crypto_coin_based_on_portfolio_response.g.dart';

@JsonSerializable()
class GetCryptoCoinResponse {
  final String id;
  final String symbol;
  final String name;
  final String image;
  final Decimal current_price;
  final Decimal price_change_percentage_24h;

  GetCryptoCoinResponse({
    required this.id,
    required this.symbol,
    required this.name,
    required this.image,
    required this.current_price,
    required this.price_change_percentage_24h,
  });

  factory GetCryptoCoinResponse.fromJson(
      Map<String, dynamic> json) {
  
    return _$GetCryptoCoinResponseFromJson(json);
  }

  Map<String, dynamic> toJson() =>
      _$GetCryptoCoinResponseToJson(this);
}
