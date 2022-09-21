import 'package:dio/dio.dart';
import 'package:fl_chart/fl_chart.dart';

import '../../use_cases/models/crypto_coin_model.dart';

class GetCryptoByIdWebService {
  Future<CryptoCoinModel> getCryptoById(String id) async {
    var response = await Dio().get(
      "https://api.coingecko.com/api/v3/coins/$id",
      queryParameters: {
        "localization": "false",
        "tickers": false,
        "market_data": false,
        "community_data": false,
        "developer_data": false,
        "sparkline": false,
      },
      options: Options(
        followRedirects: false,
        validateStatus: (status) {
          return status! < 500;
        },
        headers: {
          "Accept" : "application/json"
        },
      ),
    );

    var data = response.data;

    Map<String, List<FlSpot>> prices = await getHistoricalPrices(id);

    return CryptoCoinModel(
        abbreviation: data["symbol"].toUpperCase(),
        name: data["name"],
        imagePath: data["image"]["large"],
        prices: prices);
  }

  Future<Map<String, List<FlSpot>>> getHistoricalPrices(String id) async {
    DateTime todaysDate = DateTime.now();

    var response = await Dio().get(
      "https://api.coingecko.com/api/v3/coins/$id/market_chart/range",
      queryParameters: {
        "vs_currency": "brl",
        "from": (todaysDate
                    .subtract(
                      const Duration(days: 90, seconds: 1),
                    )
                    .toUtc()
                    .millisecondsSinceEpoch /
                1000)
            .toString(),
        "to": (todaysDate.toUtc().millisecondsSinceEpoch / 1000).toString(),
      },
    );

    double count = -1;
    List<FlSpot> d90 = List.from(
      response.data["prices"].map(
        (value) {
          count++;
          return FlSpot(
            count,
            double.parse(
              value[1].toStringAsFixed(2),
            ),
          );
        },
      ),
    );

    return {
      "5D": d90
          .sublist(85, d90.length)
          .map(
            (e) => FlSpot(e.x - 85, e.y),
          )
          .toList(),
      "15D": d90
          .sublist(75, d90.length)
          .map(
            (e) => FlSpot(e.x - 75, e.y),
          )
          .toList(),
      "30D": d90
          .sublist(60, d90.length)
          .map(
            (e) => FlSpot(e.x - 60, e.y),
          )
          .toList(),
      "45D": d90
          .sublist(45, d90.length)
          .map(
            (e) => FlSpot(e.x - 45, e.y),
          )
          .toList(),
      "90D": d90,
    };
  }
}
