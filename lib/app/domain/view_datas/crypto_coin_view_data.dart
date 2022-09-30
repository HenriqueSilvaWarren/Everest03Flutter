import 'package:decimal/decimal.dart';

class CryptoCoinViewData {
  final String id;
  final String symbol;
  final String name;
  final String image;
  final Decimal currentPrice;
  final Decimal priceChangePercentage24h;
  
  CryptoCoinViewData({
    required this.id,
    required this.symbol,
    required this.name,
    required this.image,
    required this.currentPrice,
    required this.priceChangePercentage24h,
  });
}