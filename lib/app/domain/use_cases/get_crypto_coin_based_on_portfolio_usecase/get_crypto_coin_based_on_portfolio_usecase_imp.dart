import '../../../infra/mapper/crypto_mapper.dart';
import '../../repositories/crypto_coin_repository.dart';
import '../../view_datas/list_crypto_view_data.dart';
import '../../view_datas/portfolio_view_data.dart';
import 'get_crypto_coin_based_on_portfolio_usecase.dart';

class GetCryptoCoinBasedOnPortfolioUsecaseImp
    implements GetCryptoCoinBasedOnPortfolioUsecase {
  @override
  final CryptoCoinRepository repository;
  GetCryptoCoinBasedOnPortfolioUsecaseImp(this.repository);

  @override
  Future<ListCryptoViewData> execute(
      PortfolioViewData portfolio, String currency) async {
    final response = await repository.getCryptoCoinBasedOnPortfolio(
      portfolio,
      currency,
    );

    return response.toViewData();
  }
}
