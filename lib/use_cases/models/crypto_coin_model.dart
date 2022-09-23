
import 'package:fl_chart/fl_chart.dart';

class CryptoCoinModel {
  final String symbol;
  final String name;
  final String imagePath;
  final Map<String, List<FlSpot>> prices;


  CryptoCoinModel({
    required this.symbol,
    required this.name,
    required this.imagePath,
    required this.prices,
  });
}
