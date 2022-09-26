// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:dio/dio.dart';

import '../crypto_coin_datasource.dart';
import '../local/get_portfolio_database.dart';

class CryptoCoinEndPoint implements CryptoCoinDatasource {
  final Dio _dio;
  CryptoCoinEndPoint(
    this._dio,
  );

  @override
  Future<Response> getCryptoCoinBasedOnPortfolio() {
    return _dio.get(
      '/coins/markets',
      queryParameters: {
        'vs_currency': 'brl',
        'ids': GetPortfolioDatabase.getPortfolio().coins.map((coin) => coin.name.toLowerCase()).toList().join(','),
      },
    );
  }

  @override
  Future<Response> getCryptoHistoricPriceById(String id) {
    return _dio.get(
      '/coins/$id/market_chart',
      queryParameters: {
        "vs_currency": "brl",
        "days": "90",
        "interval": 'daily',
      },
    );
  }
}
