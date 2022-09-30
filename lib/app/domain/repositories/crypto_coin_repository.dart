import '../view_datas/portfolio_view_data.dart';

import '../../infra/responses/get_crypto_coin_based_on_portfolio_response.dart';
import '../../infra/responses/get_crypto_historic_price_by_id_response.dart';

abstract class CryptoCoinRepository {
  Future<List<GetCryptoCoinResponse>> getCryptoCoinBasedOnPortfolio(
      PortfolioViewData portfolio);

  // Future<List<GetCryptoCoinResponse>> getCryptoCoinsFromApi();

  Future<GetCryptoHistoricPriceByIdResponse> getCryptoHistoricPriceById(
      String id);
}
