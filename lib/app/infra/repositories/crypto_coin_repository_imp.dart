import '../../domain/view_datas/portfolio_view_data.dart';
import 'package:decimal/decimal.dart';

import '../../domain/repositories/crypto_coin_repository.dart';
import '../data_sources/crypto_coin_datasource.dart';
import '../responses/get_crypto_coin_based_on_portfolio_response.dart';
import '../responses/get_crypto_historic_price_by_id_response.dart';


class CryptoCoinRepositoryImp implements CryptoCoinRepository {
  final CryptoCoinDatasource cryptoCoinDatasource;

  CryptoCoinRepositoryImp(this.cryptoCoinDatasource);

  @override
  Future<List<GetCryptoCoinBasedOnPortfolioResponse>>
      getCryptoCoinBasedOnPortfolio(PortfolioViewData portfolio) async {
    final result = await cryptoCoinDatasource.getCryptoCoinBasedOnPortfolio(portfolio);

    return List<GetCryptoCoinBasedOnPortfolioResponse>.from(
      result.data
          .map((item) => GetCryptoCoinBasedOnPortfolioResponse.fromJson(item)),
    );
  }

  @override
  Future<GetCryptoHistoricPriceByIdResponse> getCryptoHistoricPriceById(
      String id) async {
    final result = await cryptoCoinDatasource.getCryptoHistoricPriceById(id);

    List<Decimal> cryptoPricesList = result.data!['prices']!
        .map<Decimal>((price) => Decimal.parse('${price[1]}')).toList();

    Map<String, List<Decimal>> json = {"prices": cryptoPricesList};

    return GetCryptoHistoricPriceByIdResponse.fromJson(json);
  }
}
