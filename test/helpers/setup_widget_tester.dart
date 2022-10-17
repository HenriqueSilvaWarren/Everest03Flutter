import 'package:card_02_listagem_crypto/app/domain/view_datas/coin_in_portfolio_view_data.dart';
import 'package:card_02_listagem_crypto/app/domain/view_datas/crypto_coin_view_data.dart';
import 'package:card_02_listagem_crypto/app/domain/view_datas/crypto_historic_price_view_data.dart';
import 'package:card_02_listagem_crypto/app/domain/view_datas/list_crypto_view_data.dart';
import 'package:card_02_listagem_crypto/app/domain/view_datas/portfolio_view_data.dart';
import 'package:card_02_listagem_crypto/app/presenter/riverpod/datasources/api/coin_gecko/screens/crypto_coin_from_api_provider.dart';
import 'package:card_02_listagem_crypto/app/presenter/riverpod/datasources/api/coin_gecko/screens/crypto_historic_price_by_id_provider.dart';
import 'package:card_02_listagem_crypto/app/presenter/riverpod/datasources/local/portfolio/screen/portfolio_provider.dart';
import 'package:card_02_listagem_crypto/core/utils/generate_route.dart';
import 'package:card_02_listagem_crypto/l10n/app_localizations.dart';
import 'package:decimal/decimal.dart';
import 'package:faker/faker.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'test_navigator_observer.dart';

class SetupWidgetTester extends ConsumerWidget {
  final Widget child;
  final NavigatorObserver? navigatorObserver;
  const SetupWidgetTester(
      {Key? key, required this.child, this.navigatorObserver})
      : super(key: key);
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ProviderScope(
      overrides: [
        portfolioProvider.overrideWithValue(
          AsyncValue.data(
            PortfolioViewData(
              coins: [
                CoinInPortfolioViewData(
                  symbol: 'BTC',
                  name: 'Bitcoin',
                  quantity: Decimal.parse('0.94'),
                ),
              ],
            ),
          ),
        ),
        cryptoHistoricPriceByIdProvider.overrideWithProvider(
          (argument) => Provider(
            (ref) => AsyncValue.data(
              CryptoHistoricPriceViewData(
                cryptoPricesList: List<Decimal>.generate(
                  90,
                  (index) {
                    return Decimal.parse('$index');
                  },
                ),
              ),
            ),
          ),
        ),
        cryptoCoinFromApiProvider.overrideWithValue(
          AsyncValue.data(
            ListCryptoViewData(
              listCrypto: [
                CryptoCoinViewData(
                  id: 'bitcoin',
                  symbol: 'btc',
                  name: 'Bitcoin',
                  image: Faker().image.image(),
                  currentPrice: Decimal.parse('102432'),
                  priceChangePercentage24h: Decimal.parse('7.2'),
                ),
                CryptoCoinViewData(
                  id: 'ethereum',
                  symbol: 'eth',
                  name: 'Ethereum',
                  image: Faker().image.image(),
                  currentPrice: Decimal.parse('92432'),
                  priceChangePercentage24h: Decimal.parse('5'),
                ),
              ],
            ),
          ),
        )
      ],
      child: MaterialApp(
        navigatorObservers: [navigatorObserver ?? TestNavigatorObserver()],
        home: Material(
          child: MediaQuery(
            data: const MediaQueryData(),
            child: child,
          ),
        ),
        localizationsDelegates: CryptoAppStrings.localizationsDelegates,
        supportedLocales: CryptoAppStrings.supportedLocales,
        locale: const Locale('pt', 'BR'),
        onGenerateRoute: generateRoute,
      ),
    );
  }
}
