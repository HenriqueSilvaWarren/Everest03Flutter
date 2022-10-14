import 'package:decimal/decimal.dart';
import 'package:json_annotation/json_annotation.dart';

class DecimalConverter implements JsonConverter<Decimal, num> {
  const DecimalConverter();

  @override
  Decimal fromJson(num json) {
    return Decimal.parse(json.toString());
  }

  @override
  double toJson(Decimal object) {
    return object.toDouble();
  }
}
