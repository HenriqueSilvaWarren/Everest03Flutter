
import 'package:dio/dio.dart';

abstract class CryptoCoinDatasource {
  Future<Response> getCryptoCoinBasedOnPortfolio();

  Future<Response> getCryptoHistoricPriceById(String id);
}