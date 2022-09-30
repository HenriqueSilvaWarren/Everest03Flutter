import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../../../../domain/view_datas/list_crypto_view_data.dart';
import '../../../../../../domain/view_datas/portfolio_view_data.dart';
import '../usecases/get_crypto_coin_based_on_portfolio_use_case_provider.dart';

final cryptoCoinFromApiProvider = FutureProvider<ListCryptoViewData>(
  (ref) async {
    return ref.read(getCryptoCoinBasedOnPortfolioUseCaseProvider).execute(
          PortfolioViewData(
            coins: [],
          ),
        );
  },
);
