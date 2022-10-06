// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:card_02_listagem_crypto/app/domain/view_datas/portfolio_view_data.dart';
import 'package:dio/dio.dart';

import '../crypto_coin_datasource.dart';

class CryptoCoinEndPoint implements CryptoCoinDatasource {
  final Dio _dio;
  CryptoCoinEndPoint(
    this._dio,
  );

  int count = 0;

  @override
  Future<Response> getCryptoCoinBasedOnPortfolio(PortfolioViewData portfolio) {
    String? ids = portfolio.coins
        .map(
          (coin) => coin.name.toLowerCase(),
        )
        .toList()
        .join(',');
    return _dio.get(
      '/coins/markets',
      queryParameters: {
        'vs_currency': 'brl',
        'ids': ids,
      },
    );
  }

  // @override
  // Future<Response> getCryptoCoinsFromApi() {
  //   return _dio.get(
  //     '/coins/markets',
  //     queryParameters: {
  //       'vs_currency': 'brl',
  //     },
  //   );
  // }

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
