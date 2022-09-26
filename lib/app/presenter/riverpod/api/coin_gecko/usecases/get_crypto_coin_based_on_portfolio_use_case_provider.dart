import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../../../domain/use_cases/get_crypto_coin_based_on_portfolio_usecase/get_crypto_coin_based_on_portfolio_usecase_imp.dart';
import '../repository_provider.dart';

final getCryptoCoinBasedOnPortfolioUseCaseProvider = Provider(
  (ref) {
    final repository = ref.read(cryptoCoinRepositoryProvider);
    return GetCryptoCoinBasedOnPortfolioUsecaseImp(repository);
  },
);
