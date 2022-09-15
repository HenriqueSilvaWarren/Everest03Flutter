
import 'package:decimal/decimal.dart';

class CryptoCoinModel {
  final String abbreviation;
  final String name;
  final String imagePath;

  final Decimal value;
  final Decimal cryptoAmount;

  CryptoCoinModel({
    required this.abbreviation,
    required this.name,
    required this.imagePath,
    required this.value,
    required this.cryptoAmount,
  });
}
