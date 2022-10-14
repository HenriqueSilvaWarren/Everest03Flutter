import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../../core/utils/custom_bottom_navigation_bar.dart';
import '../../riverpod/datasources/api/coin_gecko/screens/crypto_coin_from_api_provider.dart';
import '../../riverpod/datasources/local/portfolio/screen/portfolio_provider.dart';
import '../transactions/transactions_screen.dart';
import 'loading_widgets/loading_portfolio_screen.dart';
import 'widgets/body_portfolio_screen.dart';

class PortfolioScreen extends HookConsumerWidget {
  const PortfolioScreen({super.key});

  static String route = '/portfolio-screen';

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    int curIndex = 0;
    ref.watch(cryptoCoinFromApiProvider).whenData((value) => value);

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: ref.watch(portfolioProvider).when(
              data: (portfolio) {
                return BodyPortfolioScreen(
                  key: const Key('bodyPortfolioScreen'),
                  portfolio: portfolio,
                );
              },
              error: (error, stackTrace) => const SizedBox.shrink(
                key: Key('errorPortfolio'),
              ),
              loading: () => const LoadingPortfolioScreen(
                key: Key('loadingPortfolioScreen'),
              ),
            ),
      ),
      bottomNavigationBar: CustomBottomNavigationBar(
        key: const Key('bottomNavigationPortfolio'),
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
