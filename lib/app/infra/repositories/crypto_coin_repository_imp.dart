import 'package:decimal/decimal.dart';

import '../../domain/repositories/crypto_coin_repository.dart';
import '../../domain/view_datas/portfolio_view_data.dart';
import '../data_sources/crypto_coin_datasource.dart';
import '../responses/get_crypto_coin_based_on_portfolio_response.dart';
import '../responses/get_crypto_historic_price_by_id_response.dart';

class CryptoCoinRepositoryImp implements CryptoCoinRepository {
  final CryptoCoinDatasource cryptoCoinDatasource;

  CryptoCoinRepositoryImp(this.cryptoCoinDatasource);

  @override
  Future<List<GetCryptoCoinResponse>> getCryptoCoinBasedOnPortfolio(
    PortfolioViewData portfolio,
    String currency,
  ) async {
    final result = await cryptoCoinDatasource.getCryptoCoinBasedOnPortfolio(
        portfolio, currency);

    return List<GetCryptoCoinResponse>.from(
      result.data.map((item) => GetCryptoCoinResponse.fromJson(item)),
    );
  }

  @override
  Future<GetCryptoHistoricPriceByIdResponse> getCryptoHistoricPriceById(
    String id,
    String currency,
  ) async {
    final result = await cryptoCoinDatasource.getCryptoHistoricPriceById(id, currency);

    List<Decimal> cryptoPricesList = result.data!['prices']!
        .map<Decimal>((price) => Decimal.parse('${price[1]}'))
        .toList();

    Map<String, List<Decimal>> json = {"prices": cryptoPricesList};

    return GetCryptoHistoricPriceByIdResponse.fromJson(json);
  }
}
