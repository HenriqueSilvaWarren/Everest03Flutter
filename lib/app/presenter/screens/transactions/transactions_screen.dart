import 'package:flutter/material.dart';

import '../../../../core/utils/custom_bottom_navigation_bar.dart';
import '../portfolio/portfolio_screen.dart';
import 'widgets/body_transactions_screen.dart';

class TransactionsScreen extends StatelessWidget {
  const TransactionsScreen({Key? key}) : super(key: key);

  static String route = '/transactions-screen';

  @override
  Widget build(BuildContext context) {
    int curIndex = 1;
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
