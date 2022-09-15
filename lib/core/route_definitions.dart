import 'package:card_02_listagem_crypto/screens/ui/initial/initial_screen.dart';
import 'package:card_02_listagem_crypto/screens/ui/transactions/transactions_screen.dart';

import '../screens/ui/splash/splash_screen.dart';
import '../screens/ui/portfolio/portfolio_screen.dart';

var routeDefinitions = {
  SplashScreen.route: (context) => const SplashScreen(),
  PortfolioScreen.route: (context) => const PortfolioScreen(),
  TransactionsScreen.route: (context) => const TransactionsScreen()
};
