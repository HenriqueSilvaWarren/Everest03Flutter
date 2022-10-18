import 'dart:io';

import 'package:card_02_listagem_crypto/app/domain/view_datas/coin_in_portfolio_view_data.dart';
import 'package:card_02_listagem_crypto/app/domain/view_datas/crypto_coin_view_data.dart';
import 'package:card_02_listagem_crypto/app/domain/view_datas/list_crypto_view_data.dart';
import 'package:card_02_listagem_crypto/app/domain/view_datas/list_transactions_view_data.dart';
import 'package:card_02_listagem_crypto/app/domain/view_datas/portfolio_view_data.dart';
import 'package:card_02_listagem_crypto/app/domain/view_datas/transactions_view_data.dart';
import 'package:card_02_listagem_crypto/app/presenter/riverpod/datasources/api/coin_gecko/screens/crypto_coin_based_on_portfolio_provider.dart';
import 'package:card_02_listagem_crypto/app/presenter/riverpod/datasources/local/portfolio/screen/portfolio_provider.dart';
import 'package:card_02_listagem_crypto/app/presenter/riverpod/datasources/local/transactions/screen/transactions_provider.dart';
import 'package:card_02_listagem_crypto/app/presenter/screens/portfolio/portfolio_screen.dart';
import 'package:card_02_listagem_crypto/app/presenter/screens/transactions/transactions_screen.dart';
import 'package:card_02_listagem_crypto/app/presenter/screens/transactions/widgets/transactions_dialog.dart';
import 'package:card_02_listagem_crypto/core/utils/generate_route.dart';
import 'package:card_02_listagem_crypto/core/utils/hide_values_button.dart';
import 'package:card_02_listagem_crypto/l10n/app_localizations.dart';
import 'package:decimal/decimal.dart';
import 'package:faker/faker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'helpers/setup_widget_tester.dart';

void main() {
  setUpAll(
    () => HttpOverrides.global = null,
  );
  group(
    'error transactions widgets',
    () {
      testWidgets(
        'WHEN error TransactionScreen return error and StackTrace',
        (WidgetTester tester) async {
          await tester.pumpWidget(
            ProviderScope(
              overrides: [
                transactionsProvider.overrideWithValue(
                  const AsyncValue.error(''),
                )
              ],
              child: const MaterialApp(
                home: Material(
                  child: MediaQuery(
                    data: MediaQueryData(),
                    child: TransactionsScreen(),
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
            const Key('errorTransactions'),
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
    'portfolio widgets',
    () {
      testWidgets(
        'WHEN tap BottomNavigationItem "Movimentações" and "Portfólio" THEN ensure load TransactionsScreen and Portfolio',
        (WidgetTester tester) async {
          await tester.pumpWidget(
            const SetupWidgetTester(
              child: TransactionsScreen(),
            ),
          );
          await tester.pump(const Duration(seconds: 2));
          var warrenButton = find.byKey(
            const Key('warrenInactive'),
          );
          expect(
            warrenButton,
            findsOneWidget,
          );
          var movButton = find.byKey(
            const Key('movActive'),
          );
          expect(
            movButton,
            findsOneWidget,
          );

          await tester.ensureVisible(movButton);
          await tester.tap(movButton);
          await tester.pump(const Duration(seconds: 2));
          expect(
            warrenButton,
            findsOneWidget,
          );
          expect(
            movButton,
            findsOneWidget,
          );

          await tester.ensureVisible(warrenButton);
          await tester.tap(warrenButton);
          await tester.pump(const Duration(seconds: 2));

          await tester.pump(const Duration(seconds: 4));
        },
      );

      testWidgets(
        'WHEN tap ListTile THEN ensure open dialog',
        (WidgetTester tester) async {
          await tester.pumpWidget(
            SetupWidgetTester(
              child: ProviderScope(
                overrides: [
                  transactionsProvider.overrideWithValue(
                    AsyncData(
                      ListTransactionsViewData(
                        listTransactions: [
                          TransactionsViewData(
                            convertedCryptoAmount: '0,4 BTC',
                            receivedCryptoAmount: '5,955155195 ETH',
                            dateOfExchange: DateTime.now(),
                            valueOfTransaction: 'R\$ 54.004,04',
                          )
                        ],
                      ),
                    ),
                  )
                ],
                child: const TransactionsScreen(),
              ),
            ),
          );

          await tester.pump(const Duration(seconds: 4));

          await tester.tap(find.byType(ListTile));

          await tester.pump(const Duration(seconds: 4));

          expect(find.byType(TransactionDialog), findsOneWidget);
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
