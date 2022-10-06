import 'package:card_02_listagem_crypto/app/presenter/screens/exchanged/exchanged_screen.dart';
import 'package:card_02_listagem_crypto/app/presenter/screens/review/review_screen.dart';

import '../../app/presenter/screens/conversion/conversion_screen.dart';
import 'package:flutter/material.dart';

import '../../app/presenter/screens/details/details_screen.dart';
import '../../app/presenter/screens/portfolio/portfolio_screen.dart';
import '../../app/presenter/screens/transactions/transactions_screen.dart';
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
  if (settings.name == DetailsScreen.route ||
      settings.name == ConversionScreen.route ||
      settings.name == ExchangedScreen.route ||
      settings.name == ReviewScreen.route) {
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
        return routeDefinitions[settings.name]!(context);
      },
    );
  }

  return null;
}
