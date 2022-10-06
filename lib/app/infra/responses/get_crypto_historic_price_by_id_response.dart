// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:decimal/decimal.dart';
import 'package:json_annotation/json_annotation.dart';

part 'get_crypto_historic_price_by_id_response.g.dart';

@JsonSerializable()
class GetCryptoHistoricPriceByIdResponse {
  List<Decimal> prices;

  GetCryptoHistoricPriceByIdResponse({
    required this.prices,
  });
  factory GetCryptoHistoricPriceByIdResponse.fromJson(
          Map<String, dynamic> json) =>
      _$GetCryptoHistoricPriceByIdResponseFromJson(json);

  Map<String, dynamic> toJson() =>
      _$GetCryptoHistoricPriceByIdResponseToJson(this);
}
