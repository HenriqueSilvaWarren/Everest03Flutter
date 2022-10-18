import '../../view_datas/list_crypto_view_data.dart';
import '../../view_datas/portfolio_view_data.dart';

abstract class GetCryptoCoinBasedOnPortfolioUsecase {
  Future<ListCryptoViewData> execute(
    PortfolioViewData portfolio,
    String currency,
  );
}
