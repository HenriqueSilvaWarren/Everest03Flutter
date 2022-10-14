import '../../view_datas/portfolio_view_data.dart';

import '../../repositories/crypto_coin_repository.dart';
import '../../view_datas/list_crypto_view_data.dart';

abstract class GetCryptoCoinBasedOnPortfolioUsecase {
  final CryptoCoinRepository repository;
  GetCryptoCoinBasedOnPortfolioUsecase({required this.repository});

  Future<ListCryptoViewData> execute(
    PortfolioViewData portfolio,
    String currency,
  );
}
