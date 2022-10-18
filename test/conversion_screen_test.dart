import 'dart:io';

import 'package:card_02_listagem_crypto/app/domain/view_datas/crypto_coin_view_data.dart';
import 'package:card_02_listagem_crypto/app/domain/view_datas/list_crypto_view_data.dart';
import 'package:card_02_listagem_crypto/app/presenter/riverpod/datasources/api/coin_gecko/screens/crypto_coin_based_on_portfolio_provider.dart';
import 'package:card_02_listagem_crypto/app/presenter/riverpod/datasources/api/coin_gecko/screens/crypto_coin_from_api_provider.dart';
import 'package:card_02_listagem_crypto/app/presenter/riverpod/view/crypto_drop_down_left_provider.dart';
import 'package:card_02_listagem_crypto/app/presenter/riverpod/view/crypto_drop_down_right_provider.dart';
import 'package:card_02_listagem_crypto/app/presenter/riverpod/view/locale_state_provider.dart';
import 'package:card_02_listagem_crypto/app/presenter/screens/conversion/conversion_screen.dart';
import 'package:card_02_listagem_crypto/app/presenter/screens/review/review_screen.dart';
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
    currentPrice: Decimal.parse('7254'),
    priceChangePercentage24h: Decimal.parse('7.2'),
  );
  var dogecoin = CryptoCoinViewData(
    id: 'dogecoin',
    symbol: 'doge',
    name: 'Dogecoin',
    image: Faker().image.image(),
    currentPrice: Decimal.parse('0.3'),
    priceChangePercentage24h: Decimal.parse('7.2'),
  );

  List<Override> overrides = [
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
  ];
  setUpAll(
    () => HttpOverrides.global = null,
  );
  testWidgets(
    'WHEN load ConversionScreen THEN ensure onChanged from Dropdowns work',
    (WidgetTester tester) async {
      overrides.add(
        localeStateProvider.overrideWithValue(
          StateController(
            const Locale('pt', 'BR'),
          ),
        ),
      );
      await tester.pumpWidget(
        SetupWidgetTester(
          child: ProviderScope(
            overrides: overrides,
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

      await tester.enterText(
        find.byKey(
          const Key('conversionTextField'),
        ),
        'BTC 0,1',
      );

      await tester.pumpAndSettle();
      expect(
        find.text('Por favor, escolha duas moedas diferentes'),
        findsOneWidget,
      );
    },
  );

  testWidgets(
    'WHEN load ConversionScreen THEN ensure TextFormField can be typed on and helper text is right',
    (WidgetTester tester) async {
      overrides.add(
        localeStateProvider.overrideWithValue(
          StateController(
            const Locale('pt', 'BR'),
          ),
        ),
      );
      await tester.pumpWidget(
        SetupWidgetTester(
          child: ProviderScope(
            overrides: overrides,
            child: const ConversionScreen(),
          ),
        ),
      );

      await tester.tap(
        find.byKey(
          const Key('conversionTextField'),
        ),
      );
      await tester.pumpAndSettle();

      await tester.enterText(
        find.byKey(
          const Key('conversionTextField'),
        ),
        '',
      );
      await tester.pumpAndSettle();
      await tester.enterText(
        find.byKey(
          const Key('conversionTextField'),
        ),
        'BTC ,',
      );
      await tester.pumpAndSettle();

      await tester.enterText(
        find.byKey(
          const Key('conversionTextField'),
        ),
        'BTC .',
      );
      expect(find.text('Por favor insira algum valor'), findsOneWidget);
      await tester.pumpAndSettle();
      await tester.enterText(
        find.byKey(
          const Key('conversionTextField'),
        ),
        'BTC 0,..',
      );
      await tester.pumpAndSettle();
      await tester.enterText(
        find.byKey(
          const Key('conversionTextField'),
        ),
        'BTC 0',
      );
      await tester.pumpAndSettle();
      expect(find.text('Por favor insira um valor acima de 0'), findsOneWidget);

      await tester.enterText(
        find.byKey(
          const Key('conversionTextField'),
        ),
        'BTC 10',
      );
      await tester.pumpAndSettle();
      expect(
        find.text(
          'Por favor insira um valor abaixo ou igual a quantidade possuída',
        ),
        findsOneWidget,
      );
    },
  );
  testWidgets(
    'WHEN load ConversionScreen in english THEN ensure TExtFormField is formatted correctly',
    (WidgetTester tester) async {
      overrides.add(
        localeStateProvider.overrideWithValue(
          StateController(
            const Locale('en', 'US'),
          ),
        ),
      );
      await tester.pumpWidget(
        SetupWidgetTester(
          child: ProviderScope(
            overrides: overrides,
            child: const ConversionScreen(),
          ),
        ),
      );

      await tester.enterText(
        find.byKey(
          const Key('conversionTextField'),
        ),
        'BTC 0,..',
      );
      await tester.pumpAndSettle();
    },
  );
  testWidgets(
    'WHEN load ConversionScreen THEN ensure TextFormField can be submitted',
    (WidgetTester tester) async {
      overrides.add(
        localeStateProvider.overrideWithValue(
          StateController(
            const Locale('pt', 'BR'),
          ),
        ),
      );
      await tester.pumpWidget(
        SetupWidgetTester(
          child: ProviderScope(
            overrides: overrides,
            child: const ConversionScreen(),
          ),
        ),
      );

      await tester.enterText(
        find.byKey(
          const Key('conversionTextField'),
        ),
        'BTC ',
      );
      await tester.pumpAndSettle();
      await tester.testTextInput.receiveAction(TextInputAction.done);
      await tester.pump();
    },
  );
  testWidgets(
    'WHEN load ConversionScreen THEN ensure conversion button is disabled',
    (WidgetTester tester) async {
      overrides.add(
        localeStateProvider.overrideWithValue(
          StateController(
            const Locale('pt', 'BR'),
          ),
        ),
      );

      await tester.pumpWidget(
        SetupWidgetTester(
          child: ProviderScope(
            overrides: overrides,
            child: const ConversionScreen(),
          ),
        ),
      );

      var finderButton = find.byType(FloatingActionButton);

      await tester.tap(finderButton);

      await tester.enterText(
        find.byKey(
          const Key('conversionTextField'),
        ),
        'BTC 0,4',
      );

      await tester.pumpAndSettle();
      await tester.testTextInput.receiveAction(TextInputAction.done);
      await tester.pump();

      await tester.tap(
        find.byKey(
          const Key('cryptoDropdownRight'),
        ),
      );
      await tester.pumpAndSettle();
      var rightLocation = tester.getCenter(
        find.byKey(
          const Key('rightDropdownEthereum'),
        ),
      );
      var rightGesture = await tester.startGesture(
        rightLocation.translate(-20, 0),
      );
      await rightGesture.up();
      await tester.pump();

      await tester.tap(
        find.byType(FloatingActionButton),
      );
      await tester.pumpAndSettle();

      expect(find.byType(ReviewScreen), findsOneWidget);
    },
  );
}
