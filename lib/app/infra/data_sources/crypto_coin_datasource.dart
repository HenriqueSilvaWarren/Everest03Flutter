
import '../../domain/view_datas/portfolio_view_data.dart';
import 'package:dio/dio.dart';

abstract class CryptoCoinDatasource {
  Future<Response> getCryptoCoinBasedOnPortfolio(PortfolioViewData portfolio);

  Future<Response> getCryptoHistoricPriceById(String id);
}