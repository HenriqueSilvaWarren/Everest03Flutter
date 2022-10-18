import '../../../domain/view_datas/portfolio_view_data.dart';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';

import '../crypto_coin_datasource.dart';

class CryptoCoinEndPoint implements CryptoCoinDatasource {
  final Dio _dio;
  CryptoCoinEndPoint(
    this._dio,
  );

  int count = 0;

  @override
  Future<Response> getCryptoCoinBasedOnPortfolio(
    PortfolioViewData portfolio,
    String currency,
  ) {
    if (kDebugMode) {
      print(++count);
    }
    String? ids = portfolio.coins
        .map(
          (coin) => coin.name.toLowerCase(),
        )
        .toList()
        .join(',');
    return _dio.get(
      '/coins/markets',
      queryParameters: {
        'vs_currency': currency,
        'ids': ids,
      },
    );
  }

  @override
  Future<Response> getCryptoHistoricPriceById(String id, String currency) {
    if (kDebugMode) {
      print(++count);
    }
    return _dio.get(
      '/coins/$id/market_chart',
      queryParameters: {
        "vs_currency": currency,
        "days": "90",
        "interval": 'daily',
      },
    );
  }
}
