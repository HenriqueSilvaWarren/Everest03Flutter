import 'package:decimal/decimal.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../../../core/utils/get_value_helper_text.dart';
import '../../../../domain/view_datas/coin_in_portfolio_view_data.dart';
import '../../../../domain/view_datas/crypto_coin_view_data.dart';
import '../../../../domain/view_datas/list_crypto_view_data.dart';
import '../../../../domain/view_datas/portfolio_view_data.dart';
import '../../../../domain/view_datas/transactions_view_data.dart';
import '../../../riverpod/datasources/api/coin_gecko/screens/crypto_coin_from_api_provider.dart';
import '../../../riverpod/datasources/local/portfolio/screen/portfolio_provider.dart';
import '../../../riverpod/datasources/local/transactions/screen/transactions_provider.dart';
import '../../../riverpod/view/conversion_controller_text_state_provider.dart';
import '../../../riverpod/view/conversion_data_state_provider.dart';
import '../../../riverpod/view/crypto_drop_down_left_provider.dart';

void buttonExchangeCoins(
  WidgetRef ref,
) {
  Map<String, List<String>> dataFromConversion =
      ref.watch(conversionDataStateProvider)!;
  PortfolioViewData portfolio = ref.watch(portfolioProvider).value!;
  ListCryptoViewData listCryptoViewData =
      ref.watch(cryptoCoinFromApiProvider).value!;

  List<String> convCrypto = dataFromConversion['convertingCrypto']!;
  CoinInPortfolioViewData convCryptoInPortfolio = portfolio.coins.firstWhere(
    (coin) => coin.symbol.toUpperCase() == convCrypto[1].toUpperCase(),
  );
  Decimal convCryptoQuantity = Decimal.parse(
    convCrypto[0].replaceAll(',', '.'),
  );
  if (convCryptoInPortfolio.quantity - convCryptoQuantity == Decimal.zero) {
    portfolio.coins.remove(convCryptoInPortfolio);
  } else {
    convCryptoInPortfolio.quantity -= convCryptoQuantity;
  }

  List<String> recCrypto = dataFromConversion['receivingCrypto']!;
  CryptoCoinViewData recCryptoFromApi =
      listCryptoViewData.listCrypto.firstWhere(
    (crypto) => crypto.symbol.toUpperCase() == recCrypto[1].toUpperCase(),
  );
  CoinInPortfolioViewData recCryptoFromPortfolio = portfolio.coins.singleWhere(
    (coin) {
      return coin.symbol.toUpperCase() == recCryptoFromApi.symbol.toUpperCase();
    },
    orElse: () => CoinInPortfolioViewData(
      symbol: '',
      name: '',
      quantity: Decimal.zero,
    ),
  );
  if (recCryptoFromPortfolio.symbol.isEmpty) {
    portfolio.coins.add(
      CoinInPortfolioViewData(
        symbol: recCryptoFromApi.symbol.toUpperCase(),
        name: recCryptoFromApi.id,
        quantity: Decimal.parse(
          recCrypto[0].replaceAll(',', '.'),
        ),
      ),
    );
  } else {
    recCryptoFromPortfolio.quantity += Decimal.parse(
      recCrypto[0].replaceAll(',', '.'),
    );
  }
  TransactionsViewData transactionsViewData = TransactionsViewData(
    convertedCryptoAmount: convCrypto.join(' '),
    receivedCryptoAmount: recCrypto.join(' '),
    dateOfExchange: DateTime.now(),
    valueOfTransaction: getValueHelperText(
      controllerText: ref.watch(conversionControllerTextStateProvider),
      crypto: ref.watch(cryptoDropdownLeftProvider),
    ),
  );
  ref
      .watch(transactionsProvider)
      .value!
      .listTransactions
      .add(transactionsViewData);
}
