import 'dart:io';

import 'package:card_02_listagem_crypto/app/domain/view_datas/coin_in_portfolio_view_data.dart';
import 'package:card_02_listagem_crypto/app/domain/view_datas/crypto_coin_view_data.dart';
import 'package:card_02_listagem_crypto/app/domain/view_datas/list_crypto_view_data.dart';
import 'package:card_02_listagem_crypto/app/domain/view_datas/portfolio_view_data.dart';
import 'package:card_02_listagem_crypto/app/presenter/riverpod/datasources/api/coin_gecko/screens/crypto_coin_based_on_portfolio_provider.dart';
import 'package:card_02_listagem_crypto/app/presenter/riverpod/datasources/local/portfolio/screen/portfolio_provider.dart';
import 'package:card_02_listagem_crypto/app/presenter/screens/details/details_screen.dart';
import 'package:card_02_listagem_crypto/app/presenter/screens/portfolio/portfolio_screen.dart';
import 'package:card_02_listagem_crypto/app/presenter/screens/portfolio/widgets/body_portfolio_screen.dart';
import 'package:card_02_listagem_crypto/core/utils/generate_route.dart';
import 'package:card_02_listagem_crypto/core/utils/hide_values_button.dart';
import 'package:card_02_listagem_crypto/l10n/app_localizations.dart';
import 'package:card_02_listagem_crypto/main.dart';
import 'package:decimal/decimal.dart';
import 'package:faker/faker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'helpers/setup_widget_tester.dart';
import 'helpers/test_navigator_observer.dart';

void main() {
  setUpAll(
    () => HttpOverrides.global = null,
  );
  group(
    'error portfolio widgets',
    () {
      testWidgets(
        'WHEN error PortfolioScreen return SizedBox.shrink',
        (WidgetTester tester) async {
          await tester.pumpWidget(
            ProviderScope(
              overrides: [
                portfolioProvider.overrideWithValue(
                  const AsyncValue.error(''),
                )
              ],
              child: const MaterialApp(
                home: Material(
                  child: MediaQuery(
                    data: MediaQueryData(),
                    child: PortfolioScreen(),
                  ),
                ),
                localizationsDelegates: CryptoAppStrings.localizationsDelegates,
                supportedLocales: CryptoAppStrings.supportedLocales,
                locale: Locale('pt', 'BR'),
                onGenerateRoute: generateRoute,
              ),
            ),
          );
          await tester.pumpAndSettle();

          var error = find.byKey(
            const Key('errorPortfolio'),
          );
          expect(
            error,
            findsOneWidget,
          );
        },
      );

      testWidgets(
        'WHEN error BodyPortfolioScreen return SizedBox.shrink()',
        (WidgetTester tester) async {
          await tester.pumpWidget(
            ProviderScope(
              overrides: [
                cryptoCoinBasedOnPortfolioProvider.overrideWithValue(
                  const AsyncValue.error(''),
                )
              ],
              child: SetupWidgetTester(
                child: BodyPortfolioScreen(
                  portfolio: PortfolioViewData(
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
            ),
          );

          var error = find.byKey(
            const Key('errorBodyPortfolio'),
          );
          expect(
            error,
            findsOneWidget,
          );
        },
      );
    },
  );
  group(
    'loading portfolio widgets',
    () {
      testWidgets(
        'WHEN loading PortfolioScreen ensure return LoadingPortfolioScreen ',
        (WidgetTester tester) async {
          await tester.pumpWidget(
            ProviderScope(
              overrides: [
                portfolioProvider.overrideWithValue(
                  const AsyncValue.loading(),
                )
              ],
              child: const MaterialApp(
                home: Material(
                  child: MediaQuery(
                    data: MediaQueryData(),
                    child: PortfolioScreen(),
                  ),
                ),
                localizationsDelegates: CryptoAppStrings.localizationsDelegates,
                supportedLocales: CryptoAppStrings.supportedLocales,
                locale: Locale('pt', 'BR'),
                onGenerateRoute: generateRoute,
              ),
            ),
          );

          expect(
            find.byKey(
              const Key('loadingPortfolioScreen'),
            ),
            findsOneWidget,
          );
          await tester.pump(const Duration(seconds: 4));
        },
      );

      testWidgets(
        'WHEN loading BodyPortfolioScreen return LoadingPortfolioScreen',
        (WidgetTester tester) async {
          await tester.pumpWidget(
            ProviderScope(
              overrides: [
                cryptoCoinBasedOnPortfolioProvider.overrideWithValue(
                  const AsyncValue.loading(),
                )
              ],
              child: SetupWidgetTester(
                child: BodyPortfolioScreen(
                  portfolio: PortfolioViewData(
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
            ),
          );

          var loading = find.byKey(
            const Key('bodyLoadingScreen'),
          );
          expect(
            loading,
            findsOneWidget,
          );
        },
      );
    },
  );

  group(
    'portfolio widgets',
    () {
      PortfolioScreen portfolio = const PortfolioScreen();
      TestNavigatorObserver navigatorObserver = TestNavigatorObserver();

      testWidgets(
        'WHEN load PortfolioScreen THEN ensure load CustomBottomNavigatioBar',
        (WidgetTester tester) async {
          await tester.pumpWidget(
            const SetupWidgetTester(
              child: PortfolioScreen(),
            ),
          );

          expect(
            find.byKey(const Key('bottomNavigationPortfolio')),
            findsOneWidget,
          );

          await tester.pump(const Duration(seconds: 4));
        },
      );
      testWidgets(
        'WHEN tap BottomNavigationItem "Portfolio" THEN ensure load PortfolioScreen',
        (WidgetTester tester) async {
          await tester.pumpWidget(
            const SetupWidgetTester(
              child: PortfolioScreen(),
            ),
          );

          var warrenButton = find.byKey(
            const Key('warrenActive'),
          );
          expect(
            warrenButton,
            findsOneWidget,
          );
          var movButton = find.byKey(
            const Key('movInactive'),
          );
          expect(
            movButton,
            findsOneWidget,
          );

          await tester.tap(warrenButton);

          expect(
            warrenButton,
            findsOneWidget,
          );
          expect(
            movButton,
            findsOneWidget,
          );

          await tester.pump(const Duration(seconds: 4));
        },
      );
      testWidgets(
        'WHEN tap BottomNavigationItem "Movimentações/Transactions" THEN ensure load TransactionsScreen',
        (WidgetTester tester) async {
          await tester.pumpWidget(
            const SetupWidgetTester(
              child: PortfolioScreen(),
            ),
          );

          var warrenButton = find.byKey(
            const Key('warrenActive'),
          );
          expect(
            warrenButton,
            findsOneWidget,
          );
          var movButton = find.byKey(
            const Key('movInactive'),
          );
          expect(
            movButton,
            findsOneWidget,
          );

          await tester.tap(movButton);
          await tester.pumpAndSettle();

          expect(
            find.byKey(
              const Key('warrenInactive'),
            ),
            findsOneWidget,
          );
          expect(
            find.byKey(
              const Key('movActive'),
            ),
            findsOneWidget,
          );
        },
      );
      testWidgets(
        'WHEN tap ChangeLanguagesButton THEN change value of localeStateProvider',
        (WidgetTester tester) async {
          await tester.pumpWidget(
            ProviderScope(
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
                cryptoCoinBasedOnPortfolioProvider.overrideWithValue(
                  AsyncValue.data(
                    ListCryptoViewData(
                      listCrypto: [
                        CryptoCoinViewData(
                          id: 'bitcoin',
                          symbol: 'btc',
                          name: 'bitcoin',
                          image: Faker().image.image(),
                          currentPrice: Decimal.parse('101150.50'),
                          priceChangePercentage24h: Decimal.parse(
                            '0.94',
                          ),
                        ),
                      ],
                    ),
                  ),
                )
              ],
              child: const MyApp(),
            ),
          );
          await tester.pump(const Duration(seconds: 4));
          expect(
            find.text('Crypto'),
            findsOneWidget,
          );
          await tester.tap(
            find.byKey(
              const Key('changeLanguageButton'),
            ),
          );
          await tester.pump(const Duration(seconds: 3));
          expect(
            find.text('Cripto'),
            findsOneWidget,
          );
          await tester.tap(
            find.byKey(
              const Key('changeLanguageButton'),
            ),
          );
          await tester.pump(const Duration(seconds: 3));
          expect(
            find.text('Crypto'),
            findsOneWidget,
          );
          await tester.pump(const Duration(seconds: 4));
        },
      );
      testWidgets(
        'WHEN tap ListTile THEN ensure navigation to DetailsScreen',
        (WidgetTester tester) async {
          var isPushed = false;

          await tester.pumpWidget(
            SetupWidgetTester(
              navigatorObserver: navigatorObserver,
              child: ProviderScope(
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
                  cryptoCoinBasedOnPortfolioProvider.overrideWithValue(
                    AsyncValue.data(
                      ListCryptoViewData(
                        listCrypto: [
                          CryptoCoinViewData(
                            id: 'bitcoin',
                            symbol: 'btc',
                            name: 'bitcoin',
                            image: Faker().image.image(),
                            currentPrice: Decimal.parse('101150.50'),
                            priceChangePercentage24h: Decimal.parse(
                              '0.94',
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
                child: portfolio,
              ),
            ),
          );

          navigatorObserver.attachPushRouteObserver(DetailsScreen.route, () {
            isPushed = true;
          });
          await tester.pump(const Duration(seconds: 4));

          await tester.tap(find.byType(ListTile));

          expect(isPushed, true);
        },
      );

      testWidgets(
        'WHEN tap HideValuesButton THEN hide monetary values',
        (WidgetTester tester) async {
          await tester.pumpWidget(
            SetupWidgetTester(
              child: ProviderScope(overrides: [
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
                cryptoCoinBasedOnPortfolioProvider.overrideWithValue(
                  AsyncValue.data(
                    ListCryptoViewData(
                      listCrypto: [
                        CryptoCoinViewData(
                          id: 'bitcoin',
                          symbol: 'btc',
                          name: 'bitcoin',
                          image: Faker().image.image(),
                          currentPrice: Decimal.parse('101150.50'),
                          priceChangePercentage24h: Decimal.parse(
                            '0.94',
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ], child: const PortfolioScreen()),
            ),
          );
          await tester.pump(const Duration(seconds: 4));
          var childFinder = find.descendant(
            of: find.byKey(
              const Key('hideTotalCurrencyValue'),
            ),
            matching: find.byType(Text),
          );

          expect(childFinder, findsOneWidget);

          await tester.tap(
            find.byType(HideValuesButton),
          );

          await tester.pumpAndSettle();

          childFinder = find.descendant(
            of: find.byKey(
              const Key('hideTotalCurrencyValue'),
            ),
            matching: find.byType(Container),
          );
        },
      );
    },
  );
}
