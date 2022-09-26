import '../../repositories/crypto_coin_repository.dart';
import '../../view_datas/list_crypto_view_data.dart';
import '../../../infra/mapper/crypto_mapper.dart';

import 'get_crypto_coin_based_on_portfolio_usecase.dart';

class GetCryptoCoinBasedOnPortfolioUsecaseImp
    implements GetCryptoCoinBasedOnPortfolioUsecase {
  @override
  final CryptoCoinRepository repository;
  GetCryptoCoinBasedOnPortfolioUsecaseImp(this.repository);

  @override
  Future<ListCryptoViewData> execute() async {
      final response = await repository.getCryptoCoinBasedOnPortfolio();

    return response.toViewData();
  }
}
