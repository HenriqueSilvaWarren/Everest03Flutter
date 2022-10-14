import 'dart:io';

import 'package:card_02_listagem_crypto/app/domain/view_datas/crypto_coin_view_data.dart';
import 'package:card_02_listagem_crypto/app/domain/view_datas/list_crypto_view_data.dart';
import 'package:card_02_listagem_crypto/app/presenter/riverpod/datasources/api/coin_gecko/screens/crypto_coin_based_on_portfolio_provider.dart';
import 'package:card_02_listagem_crypto/app/presenter/riverpod/datasources/api/coin_gecko/screens/crypto_coin_from_api_provider.dart';
import 'package:card_02_listagem_crypto/app/presenter/riverpod/view/crypto_drop_down_left_provider.dart';
import 'package:card_02_listagem_crypto/app/presenter/riverpod/view/crypto_drop_down_right_provider.dart';
import 'package:card_02_listagem_crypto/app/presenter/screens/conversion/conversion_screen.dart';
import 'package:decimal/decimal.dart';
import 'package:faker/faker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'helpers/setup_widget_tester.dart';

void main() {
  var bitcoin = CryptoCoinViewData(
    id: 'bitcoin',
    symbol: 'btc',
    name: 'Bitcoin',
    image: Faker().image.image(),
    currentPrice: Decimal.parse('102432'),
    priceChangePercentage24h: Decimal.parse('7.2'),
  );
  var ethereum = CryptoCoinViewData(
    id: 'ethereum',
    symbol: 'eth',
    name: 'Ethereum',
    image: Faker().image.image(),
    currentPrice: Decimal.parse('102432'),
    priceChangePercentage24h: Decimal.parse('7.2'),
  );
  var dogecoin = CryptoCoinViewData(
    id: 'dogecoin',
    symbol: 'doge',
    name: 'Dogecoin',
    image: Faker().image.image(),
    currentPrice: Decimal.parse('102432'),
    priceChangePercentage24h: Decimal.parse('7.2'),
  );
  setUpAll(
    () => HttpOverrides.global = null,
  );
  testWidgets(
    'WHEN load ConversionScreen THEN ensure onChanged from Dropdowns work',
    (WidgetTester tester) async {
      await tester.pumpWidget(
        SetupWidgetTester(
          child: ProviderScope(
            overrides: [
              cryptoCoinBasedOnPortfolioProvider.overrideWithValue(
                AsyncValue.data(
                  ListCryptoViewData(
                    listCrypto: [bitcoin, ethereum],
                  ),
                ),
              ),
              cryptoDropdownLeftProvider.overrideWithValue(
                StateController(
                  bitcoin,
                ),
              ),
              cryptoCoinFromApiProvider.overrideWithValue(
                AsyncValue.data(
                  ListCryptoViewData(
                    listCrypto: [bitcoin, ethereum, dogecoin],
                  ),
                ),
              ),
              cryptoDropdownRightProvider.overrideWithValue(
                StateController(ethereum),
              ),
            ],
            child: const ConversionScreen(),
          ),
        ),
      );

      await tester.tap(
        find.byKey(
          const Key('cryptoDropdownRight'),
        ),
      );
      await tester.pumpAndSettle();
      var rightLocation = tester.getCenter(
        find.byKey(
          const Key('rightDropdownBitcoin'),
        ),
      );
      var rightGesture = await tester.startGesture(
        rightLocation.translate(-20, 0),
      );
      await rightGesture.up();
      await tester.pump(
        const Duration(seconds: 4),
      );

      await tester.tap(
        find.byKey(
          const Key('cryptoDropdownLeft'),
        ),
      );
      await tester.pumpAndSettle();
      var location = tester.getCenter(
        find.byKey(
          const Key('leftDropdownBitcoin'),
        ),
      );
      var gesture = await tester.startGesture(
        location.translate(
          -20,
          0,
        ),
      );
      await gesture.up();
      await tester.pump(
        const Duration(seconds: 4),
      );
    },
  );

  testWidgets(
    'WHEN load ConversionScreen THEN ensure TextFormField can be typed on and helper text is right',
    (WidgetTester tester) async {
      await tester.pumpWidget(
        SetupWidgetTester(
          child: ProviderScope(
            overrides: [
              cryptoCoinBasedOnPortfolioProvider.overrideWithValue(
                AsyncValue.data(
                  ListCryptoViewData(
                    listCrypto: [bitcoin, ethereum],
                  ),
                ),
              ),
              cryptoDropdownLeftProvider.overrideWithValue(
                StateController(
                  bitcoin,
                ),
              ),
              cryptoCoinFromApiProvider.overrideWithValue(
                AsyncValue.data(
                  ListCryptoViewData(
                    listCrypto: [bitcoin, ethereum, dogecoin],
                  ),
                ),
              ),
              cryptoDropdownRightProvider.overrideWithValue(
                StateController(ethereum),
              ),
            ],
            child: const ConversionScreen(),
          ),
        ),
      );

      expect(find.text('Por favor insira algum valor'), findsOneWidget);

      await tester.tap(
        find.byKey(
          const Key('conversionTextField'),
        ),
      );

      await tester.enterText(
        find.byKey(
          const Key('conversionTextField'),
        ),
        ',',
      );
      
      
      // await tester.testTextInput.receiveAction(TextInputAction.done);
      await tester.pumpAndSettle();
    },
  );
}
