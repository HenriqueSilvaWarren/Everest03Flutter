// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:dio/dio.dart';

class CryptoCoinEndpoint {
  final Dio _dio;
  CryptoCoinEndpoint(
    this._dio,
  );

  Future<Response> getCryptoCoinBasedOnPortfolio() {
    return _dio.get(
      '/coins/markets',
      queryParameters: {
        'vs_currency': 'brl',
        'ids': 'bitcoin,matic-network,litecoin,dogecoin,ethereum'
      },
    );
  }

  Future<Response> getCryptoHistoricPriceById(String id) {
    return _dio.get(
      '/coins/$id/market_chart',
      queryParameters: {
        "vs_currency": "brl",
        "days": "89   ",
        "interval": 'daily',
      },
    );
  }
}
