import 'dart:io';

import 'package:card_02_listagem_crypto/app/domain/view_datas/coin_in_portfolio_view_data.dart';
import 'package:card_02_listagem_crypto/app/domain/view_datas/crypto_coin_view_data.dart';
import 'package:card_02_listagem_crypto/app/domain/view_datas/list_crypto_view_data.dart';
import 'package:card_02_listagem_crypto/app/domain/view_datas/portfolio_view_data.dart';
import 'package:card_02_listagem_crypto/app/presenter/riverpod/datasources/api/coin_gecko/screens/crypto_coin_based_on_portfolio_provider.dart';
import 'package:card_02_listagem_crypto/app/presenter/riverpod/datasources/api/coin_gecko/screens/crypto_historic_price_by_id_provider.dart';
import 'package:card_02_listagem_crypto/app/presenter/riverpod/datasources/local/portfolio/screen/portfolio_provider.dart';
import 'package:card_02_listagem_crypto/app/presenter/riverpod/view/crypto_drop_down_left_provider.dart';
import 'package:card_02_listagem_crypto/app/presenter/riverpod/view/get_crypto_state_provider.dart';
import 'package:card_02_listagem_crypto/app/presenter/screens/conversion/conversion_screen.dart';
import 'package:card_02_listagem_crypto/app/presenter/screens/details/details_screen.dart';
import 'package:card_02_listagem_crypto/app/presenter/screens/details/loading_widgets/loading_chart.dart';
import 'package:card_02_listagem_crypto/app/presenter/screens/details/widgets/body_details_screen.dart';
import 'package:card_02_listagem_crypto/app/presenter/screens/details/widgets/button_convert_currency.dart';
import 'package:card_02_listagem_crypto/app/presenter/screens/details/widgets/custom_line_chart.dart';
import 'package:card_02_listagem_crypto/app/presenter/screens/details/widgets/day_button.dart';
import 'package:card_02_listagem_crypto/app/presenter/screens/details/widgets/details_item_variation.dart';
import 'package:card_02_listagem_crypto/core/utils/animated_hide_text_value.dart';
import 'package:card_02_listagem_crypto/core/utils/custom_app_bar.dart';
import 'package:card_02_listagem_crypto/core/utils/generate_route.dart';
import 'package:card_02_listagem_crypto/core/utils/hide_values_button.dart';
import 'package:card_02_listagem_crypto/l10n/app_localizations.dart';
import 'package:decimal/decimal.dart';
import 'package:faker/faker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:intl/intl.dart';

import 'helpers/setup_widget_tester.dart';
import 'helpers/test_navigator_observer.dart';

void main() {
  setUpAll(
    () => HttpOverrides.global = null,
  );

  List<Override> overrides = [
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
    getCryptoStateProvider.overrideWithValue(
      StateController(
        CryptoCoinViewData(
          id: 'bitcoin',
          symbol: 'btc',
          name: 'Bitcoin',
          image: Faker().image.image(),
          currentPrice: Decimal.parse('102432'),
          priceChangePercentage24h: Decimal.parse('7.2'),
        ),
      ),
    ),
  ];
  group(
    'loading details widgets',
    () {
      testWidgets(
        'WHEN loading DetailsScreen THEN ensure has LoadingChart and LoadingDetailsItemVariation',
        (WidgetTester tester) async {
          await tester.pumpWidget(
            ProviderScope(
              overrides: [
                ...overrides,
                cryptoHistoricPriceByIdProvider.overrideWithProvider(
                  (argument) => Provider(
                    (ref) => const AsyncValue.loading(),
                  ),
                ),
              ],
              child: MaterialApp(
                navigatorObservers: [TestNavigatorObserver()],
                home: const Material(
                  child: MediaQuery(
                    data: MediaQueryData(),
                    child: BodyDetailsScreen(),
                  ),
                ),
                localizationsDelegates: CryptoAppStrings.localizationsDelegates,
                supportedLocales: CryptoAppStrings.supportedLocales,
                locale: const Locale('pt', 'BR'),
                onGenerateRoute: generateRoute,
              ),
            ),
          );

          expect(find.byType(LoadingChart), findsOneWidget);
          var detailsItemVariation = tester.widget<Text>(
            find.byKey(
              const Key('variationText'),
            ),
          );
          expect(
            detailsItemVariation.data,
            "Variação 24H",
          );
          var variationPercentage = tester.widget<AnimatedHideTextValue>(
            find.byKey(
              const Key('variationPercentage'),
            ),
          );
          expect(
            variationPercentage.text,
            "0.00%",
          );
          await tester.pump(
            const Duration(seconds: 5),
          );
        },
      );
    },
  );

  group(
    'error DetailsScreen widgets',
    () {
      testWidgets(
        'WHEN error DetailsScreen THEN ensure has key "errorLineChart","errorVariation"',
        (WidgetTester tester) async {
          await tester.pumpWidget(
            ProviderScope(
              overrides: [
                ...overrides,
                cryptoHistoricPriceByIdProvider.overrideWithProvider(
                  (argument) => Provider((ref) => const AsyncValue.error('')),
                ),
              ],
              child: MaterialApp(
                navigatorObservers: [TestNavigatorObserver()],
                home: const Material(
                  child: MediaQuery(
                    data: MediaQueryData(),
                    child: BodyDetailsScreen(),
                  ),
                ),
                localizationsDelegates: CryptoAppStrings.localizationsDelegates,
                supportedLocales: CryptoAppStrings.supportedLocales,
                locale: const Locale('pt', 'BR'),
                onGenerateRoute: generateRoute,
              ),
            ),
          );

          var detailsItemVariation = tester.widget<Text>(
            find.byKey(
              const Key('errorLineChart'),
            ),
          );
          expect(
            detailsItemVariation.data,
            "Deu erro",
          );
          var variationPercentage = tester.widget<Text>(
            find.byKey(
              const Key('errorVariation'),
            ),
          );
          expect(
            variationPercentage.data,
            "Deu erro",
          );
          await tester.pump(const Duration(seconds: 5));
        },
      );
    },
  );

  group(
    'DetailsScreen widgets',
    () {
      testWidgets(
        'WHEN load DetailsScreen THEN ensure has CustomAppBar has text and HideValueButton and Body exists',
        (WidgetTester tester) async {
          await tester.pumpWidget(
            SetupWidgetTester(
              child: ProviderScope(
                overrides: overrides,
                child: const DetailsScreen(),
              ),
            ),
          );
          await tester.pump(const Duration(seconds: 5));
          expect(find.byType(CustomAppBar), findsOneWidget);
          expect(find.byType(HideValuesButton), findsOneWidget);
          await tester.pump(const Duration(seconds: 5));
        },
      );
      testWidgets(
        'WHEN load BodyDetailsScreen THEN ensure has CustomLineChart and DetailsItemVariation',
        (WidgetTester tester) async {
          await tester.pumpWidget(
            SetupWidgetTester(
              child: ProviderScope(
                overrides: overrides,
                child: const BodyDetailsScreen(),
              ),
            ),
          );
          await tester.pump(const Duration(seconds: 5));
          expect(find.byType(CustomLineChart), findsOneWidget);
          expect(find.byType(DetailsItemVariation), findsOneWidget);
          await tester.pump(const Duration(seconds: 5));
        },
      );

      testWidgets(
        'WHEN tap DayButton THEN ensure isSelected',
        (WidgetTester tester) async {
          await tester.pumpWidget(
            SetupWidgetTester(
              child: ProviderScope(
                overrides: overrides,
                child: const BodyDetailsScreen(),
              ),
            ),
          );

          await tester.pump(const Duration(seconds: 4));

          var dayButton = tester.widget<DayButton>(
            find.widgetWithText(DayButton, '5D'),
          );

          await tester.scrollUntilVisible(
            find.widgetWithText(DayButton, '5D'),
            10,
          );

          expect(dayButton.selectedIndex, true);

          await tester.tap(
            find.widgetWithText(DayButton, '15D'),
          );

          await tester.pump(const Duration(seconds: 2));

          dayButton = tester.widget<DayButton>(
            find.widgetWithText(DayButton, '5D'),
          );

          expect(dayButton.selectedIndex, false);
        },
      );

      testWidgets(
        'WHEN tap RefreshButton THEN ensure refresh',
        (WidgetTester tester) async {
          await tester.pumpWidget(
            SetupWidgetTester(
              child: ProviderScope(
                overrides: [
                  ...overrides,
                  cryptoCoinBasedOnPortfolioProvider.overrideWithProvider(
                    Provider(
                      (ref) => AsyncData(
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
                              currentPrice: Decimal.parse('102432'),
                              priceChangePercentage24h: Decimal.parse('7.2'),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
                child: const BodyDetailsScreen(),
              ),
            ),
          );
          await tester.pump(
            const Duration(seconds: 5),
          );
          await tester.tap(
            find.byKey(
              const Key('refreshButton'),
            ),
          );
          await tester.pump(
            const Duration(
              seconds: 5,
            ),
          );
        },
      );

      var navigatorObserver = TestNavigatorObserver();
      testWidgets(
        'WHEN tap ButtonConvertCurrency THEN navigate to ConversionScreen',
        (WidgetTester tester) async {
          var isPushed = false;
          await tester.pumpWidget(
            SetupWidgetTester(
              navigatorObserver: navigatorObserver,
              child: ProviderScope(
                overrides: [
                  ...overrides,
                  cryptoDropdownLeftProvider.overrideWithValue(
                    StateController(
                      CryptoCoinViewData(
                        id: 'bitcoin',
                        symbol: 'btc',
                        name: 'Bitcoin',
                        image: Faker().image.image(),
                        currentPrice: Decimal.parse('102432'),
                        priceChangePercentage24h: Decimal.parse('7.2'),
                      ),
                    ),
                  )
                ],
                child: const BodyDetailsScreen(),
              ),
            ),
          );
          await tester.scrollUntilVisible(
            find.byType(ButtonConvertCurrency),
            10,
          );
          navigatorObserver.attachPushRouteObserver(
            ConversionScreen.route,
            () {
              isPushed = true;
            },
          );

          await tester.tap(
            find.byType(ButtonConvertCurrency),
          );

          expect(isPushed, true);
        },
      );
      testWidgets(
          'WHEN drag LineChart THEN ensure monetary values on top has changed',
          (WidgetTester tester) async {
        final currencyFormatter = NumberFormat.currency(
          locale: 'pt-BR',
          symbol: 'R\$',
        );
        await tester.pumpWidget(
          SetupWidgetTester(
            child: ProviderScope(
              overrides: overrides,
              child: const BodyDetailsScreen(),
            ),
          ),
        );

        var cryptoPrice = tester.widget<AnimatedHideTextValue>(
          find.byKey(
            const Key('cryptoPrice'),
          ),
        );

        expect(
          cryptoPrice.text,
          currencyFormatter.format(102432),
        );

        final Offset firstLocation = tester.getCenter(
          find.byKey(
            const Key('detailsLineChart'),
          ),
        );

        final TestGesture gesture = await tester.startGesture(
          firstLocation,
        );

        await tester.pump();

        final Offset secondLocation = firstLocation.translate(100, 0);
        await gesture.moveTo(
          secondLocation,
        );

        await tester.pump();

        cryptoPrice = tester.widget<AnimatedHideTextValue>(
          find.byKey(
            const Key('cryptoPrice'),
          ),
        );

        expect(cryptoPrice.text, currencyFormatter.format(87));

        await gesture.up();
        await tester.pump(
          const Duration(
            seconds: 5,
          ),
        );
      });
      // testWidgets(
      //   'WHEN load LineChart THEN ensure all its properties loaded',
      //   (WidgetTester tester) async {
      //     await tester.pumpWidget(
      //       SetupWidgetTester(
      //         child: ProviderScope(
      //           overrides: overrides,
      //           child: const BodyDetailsScreen(),
      //         ),
      //       ),
      //     );
      //     await tester.pump(
      //       const Duration(seconds: 5),
      //     );

      //     await tester.pump(
      //       const Duration(
      //         seconds: 5,
      //       ),
      //     );
      //   },
      // );
    },
  );
}
