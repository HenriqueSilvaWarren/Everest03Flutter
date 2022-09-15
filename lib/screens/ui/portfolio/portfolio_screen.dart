import 'package:card_02_listagem_crypto/core/route_definitions.dart';
import 'package:card_02_listagem_crypto/screens/ui/transactions/transactions_screen.dart';
import 'package:flutter/material.dart';

import 'widgets/body_portfolio_screen.dart';
import 'widgets/custom_bottom_navigation_bar.dart';

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
              print(routeDefinitions[PortfolioScreen.route]);
              Navigator.pushReplacement(
                context,
                PageRouteBuilder(
                  pageBuilder: (context, animation, secondaryAnimation) =>
                      routeDefinitions[PortfolioScreen.route]!(context),
                ),
              );
              break;
            case 1:
              Navigator.pushReplacement(
                context,
                PageRouteBuilder(
                  pageBuilder: (context, animation, secondaryAnimation) =>
                      routeDefinitions[TransactionsScreen.route]!(context),
                ),
              );
              break;
            default:
              break;
          }
        },
      ),
    );
  }
}
