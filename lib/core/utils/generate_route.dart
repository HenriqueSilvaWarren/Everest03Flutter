import 'package:flutter/material.dart';

import '../../screens/ui/details/details_screen.dart';
import '../../screens/ui/portfolio/portfolio_screen.dart';
import '../../screens/ui/transactions/transactions_screen.dart';
import '../../use_cases/models/crypto_coin_model.dart';
import '../route_definitions.dart';

Route<dynamic>? generateRoute(RouteSettings settings) {
  if (settings.name == PortfolioScreen.route ||
      settings.name == TransactionsScreen.route) {
    return PageRouteBuilder(
      transitionDuration: Duration.zero,
      settings: settings,
      pageBuilder: (context, animation, secondaryAnimation) {
        return routeDefinitions[settings.name]!(context);
      },
    );
  }
  if (settings.name == DetailsScreen.route) {
    
    return PageRouteBuilder(
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        animation = CurvedAnimation(
          curve: Curves.easeOut,
          parent: animation,
        );
        return SlideTransition(
          position: Tween<Offset>(
            begin: const Offset(1, 0),
            end: Offset.zero,
          ).animate(animation),
          child: child,
        );
      },
      transitionDuration: const Duration(milliseconds: 500),
      settings: settings,
      pageBuilder: (context, animation, secondaryAnimation) {
        return const DetailsScreen();
      },
    );
  }
  return null;
}
