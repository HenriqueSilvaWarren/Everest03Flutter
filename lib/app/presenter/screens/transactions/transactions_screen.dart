import 'package:card_02_listagem_crypto/app/presenter/riverpod/datasources/api/coin_gecko/screens/crypto_coin_from_api_provider.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../../core/utils/custom_bottom_navigation_bar.dart';
import '../portfolio/portfolio_screen.dart';
import 'widgets/body_transactions_screen.dart';

class TransactionsScreen extends HookConsumerWidget {
  const TransactionsScreen({Key? key}) : super(key: key);

  static String route = '/transactions-screen';

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    int curIndex = 1;

    ref.watch(cryptoCoinFromApiProvider).whenData((value) => value);
    return Scaffold(
      body: const BodyTransactionsScreen(),
      bottomNavigationBar: CustomBottomNavigationBar(
        curIndex: curIndex,
        onTap: (value) {
          switch (value) {
            case 0:
              Navigator.pushReplacementNamed(context, PortfolioScreen.route);
              break;
            case 1:
              Navigator.pushReplacementNamed(context, TransactionsScreen.route);
              break;
          }
        },
      ),
    );
  }
}
