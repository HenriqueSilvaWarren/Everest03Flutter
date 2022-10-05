import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../../core/utils/custom_bottom_navigation_bar.dart';
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
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: ref.watch(portfolioProvider).when(
              data: (portfolio) {
                return BodyPortfolioScreen(
                  portfolio: portfolio,
                );
              },
              error: (error, stackTrace) => const SizedBox.shrink(),
              loading: () => const LoadingPortfolioScreen(),
            ),
      ),
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
