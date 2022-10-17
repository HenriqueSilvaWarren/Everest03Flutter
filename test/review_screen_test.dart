import 'dart:io';

import 'package:card_02_listagem_crypto/app/domain/view_datas/crypto_coin_view_data.dart';
import 'package:card_02_listagem_crypto/app/domain/view_datas/list_transactions_view_data.dart';
import 'package:card_02_listagem_crypto/app/presenter/riverpod/datasources/local/transactions/screen/transactions_provider.dart';
import 'package:card_02_listagem_crypto/app/presenter/riverpod/view/conversion_data_state_provider.dart';
import 'package:card_02_listagem_crypto/app/presenter/riverpod/view/crypto_drop_down_left_provider.dart';
import 'package:card_02_listagem_crypto/app/presenter/screens/review/widgets/finish_conversion_button.dart';
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
  Override dropdownLeft = cryptoDropdownLeftProvider.overrideWithValue(
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
  );
  List<Override> overridesExchangeNoReceiving = [
    conversionDataStateProvider.overrideWithValue(
      StateController(
        {
          "convertingCrypto": [
            '0,4',
            'BTC',
          ],
          "receivingCrypto": [
            '5,91551595',
            'ETH',
          ]
        },
      ),
    ),
    transactionsProvider.overrideWithValue(
      AsyncValue.data(
        ListTransactionsViewData(
          listTransactions: [],
        ),
      ),
    ),
  ];
  List<Override> overridesExchangeHasReceiving = [
    conversionDataStateProvider.overrideWithValue(
      StateController(
        {
          "convertingCrypto": [
            '0,4',
            'BTC',
          ],
          "receivingCrypto": [
            '0,4',
            'BTC',
          ]
        },
      ),
    ),
    transactionsProvider.overrideWithValue(
      AsyncValue.data(
        ListTransactionsViewData(
          listTransactions: [],
        ),
      ),
    ),
  ];
  List<Override> overridesExchangedAllConverting = [
    conversionDataStateProvider.overrideWithValue(
      StateController(
        {
          "convertingCrypto": [
            '0,94',
            'BTC',
          ],
          "receivingCrypto": [
            '13,9014624825',
            'ETH',
          ]
        },
      ),
    ),
    transactionsProvider.overrideWithValue(
      AsyncValue.data(
        ListTransactionsViewData(
          listTransactions: [],
        ),
      ),
    ),
  ];
  testWidgets(
    'WHEN load FinishConversionButton THEN ensure click FinishConversionButton with no receiving crypto',
    (tester) async {
      await tester.pumpWidget(
        SetupWidgetTester(
          child: ProviderScope(
            overrides: [
              ...overridesExchangeNoReceiving,
              dropdownLeft,
            ],
            child: const FinishConversionButton(),
          ),
        ),
      );
      await tester.ensureVisible(
        find.byKey(
          const Key('finishConversionButton'),
        ),
      );
      await tester.tap(
        find.byKey(
          const Key('finishConversionButton'),
        ),
      );
      await tester.pump(const Duration(seconds: 4));
    },
  );
  testWidgets(
    'WHEN load FinishConversionButton THEN ensure click FinishConversionButton with receiving crypto',
    (tester) async {
      await tester.pumpWidget(
        SetupWidgetTester(
          child: ProviderScope(
            overrides: [
              ...overridesExchangeHasReceiving,
              dropdownLeft,
            ],
            child: const FinishConversionButton(),
          ),
        ),
      );
      await tester.ensureVisible(
        find.byKey(
          const Key('finishConversionButton'),
        ),
      );
      await tester.tap(
        find.byKey(
          const Key('finishConversionButton'),
        ),
      );
      await tester.pump(const Duration(seconds: 4));
    },
  );
  testWidgets(
    'WHEN load FinishConversionButton THEN ensure click FinishConversionButton exchanged all converted crypto',
    (tester) async {
      await tester.pumpWidget(
        SetupWidgetTester(
          child: ProviderScope(
            overrides: [
              ...overridesExchangedAllConverting,
              dropdownLeft,
            ],
            child: const FinishConversionButton(),
          ),
        ),
      );
      await tester.ensureVisible(
        find.byKey(
          const Key('finishConversionButton'),
        ),
      );
      await tester.tap(
        find.byKey(
          const Key('finishConversionButton'),
        ),
      );
      await tester.pump(const Duration(seconds: 4));
    },
  );
}
