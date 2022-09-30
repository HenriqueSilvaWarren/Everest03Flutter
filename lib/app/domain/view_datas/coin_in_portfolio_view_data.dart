// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:decimal/decimal.dart';

class CoinInPortfolioViewData {
  String symbol;
  String name;
  Decimal quantity;

  CoinInPortfolioViewData({
    required this.symbol,
    required this.name,
    required this.quantity,
  });
}
