import 'package:flutter/material.dart';

import '../../../core/utils/custom_bottom_navigation_bar.dart';
import '../transactions/transactions_screen.dart';
import 'widgets/body_portfolio_screen.dart';

class PortfolioScreen extends StatelessWidget {
  const PortfolioScreen({super.key});

  static String route = '/portfolio-screen';

  @override
  Widget build(BuildContext context) {
    int curIndex = 0;
    return Scaffold(
      body: const BodyPortfolioScreen(),
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
