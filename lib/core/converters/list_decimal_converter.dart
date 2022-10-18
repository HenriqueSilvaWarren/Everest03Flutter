import 'package:decimal/decimal.dart';
import 'package:json_annotation/json_annotation.dart';

class ListDecimalConverter
    implements JsonConverter<List<Decimal>, List<dynamic>> {
  const ListDecimalConverter();

  @override
  List<Decimal> fromJson(List<dynamic> json) {
    return json
        .map<Decimal>(
          (e) => e, // coverage:ignore-line
        )
        .toList();
  }

  @override
  List<dynamic> toJson(List<Decimal> object) {
    return [
      for (var prices in object) prices.toDouble(),
    ];
  }
}
