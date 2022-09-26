import '../usecases/get_crypto_coin_based_on_portfolio_use_case_provider.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../../../domain/view_datas/list_crypto_view_data.dart';

final cryptoCoinBasedOnPortfolioProvider = FutureProvider<ListCryptoViewData>(
  (ref) async {
    return ref.read(getCryptoCoinBasedOnPortfolioUseCaseProvider).execute();
  },
);
