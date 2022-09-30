import '../loading_widgets/loading_portfolio_screen.dart';
import 'crypto_list_portfolio.dart';

import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../../domain/view_datas/portfolio_view_data.dart';
import '../../../riverpod/datasources/api/coin_gecko/screens/crypto_coin_based_on_portfolio_provider.dart';
import 'total_currency_card.dart';

class BodyPortfolioScreen extends HookConsumerWidget {
  const BodyPortfolioScreen({
    Key? key,
    required this.portfolio,
  }) : super(key: key);
  final PortfolioViewData portfolio;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final coins = portfolio.coins;
    return ref
        .watch(
          cryptoCoinBasedOnPortfolioProvider,
        )
        .when(
          data: (allCryptoFromPortfolio) {
            return Column(
              children: [
                TotalCurrencyCard(
                  cryptoList: allCryptoFromPortfolio,
                  portfolio: portfolio,
                ),
                CryptoListPortfolio(
                  coins: coins,
                  allCryptoFromPortfolio: allCryptoFromPortfolio,
                ),
              ],
            );
          },
          error: (error, stackTrace) => Text('$error'),
          loading: () => const LoadingPortfolioScreen(),
        );
  }
}
