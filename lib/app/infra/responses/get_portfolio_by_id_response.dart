import 'package:decimal/decimal.dart';
import 'package:json_annotation/json_annotation.dart';

import '../../../core/converters/decimal_converter.dart';

part 'get_portfolio_by_id_response.g.dart';

@JsonSerializable()
@DecimalConverter()
class GetPortfolioByIdResponse {
  String symbol;
  String name;
  Decimal quantity;

  GetPortfolioByIdResponse({
    required this.symbol,
    required this.name,
    required this.quantity,
  });

  factory GetPortfolioByIdResponse.fromJson(Map<String, dynamic> json) =>
      _$GetPortfolioByIdResponseFromJson(json);

  Map<String, dynamic> toJson() => _$GetPortfolioByIdResponseToJson(this);
}
