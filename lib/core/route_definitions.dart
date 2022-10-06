import '../app/presenter/screens/conversion/conversion_screen.dart';
import '../app/presenter/screens/details/details_screen.dart';
import '../app/presenter/screens/exchanged/exchanged_screen.dart';
import '../app/presenter/screens/portfolio/portfolio_screen.dart';
import '../app/presenter/screens/review/review_screen.dart';
import '../app/presenter/screens/splash/splash_screen.dart';
import '../app/presenter/screens/transactions/transactions_screen.dart';

var routeDefinitions = {
  SplashScreen.route: (context) => const SplashScreen(),
  PortfolioScreen.route: (context) => const PortfolioScreen(),
  TransactionsScreen.route: (context) => const TransactionsScreen(),
  DetailsScreen.route: (context) => const DetailsScreen(),
  ConversionScreen.route: (context) => const ConversionScreen(),
  ExchangedScreen.route: (context) => const ExchangedScreen(),
  ReviewScreen.route: (context) => const ReviewScreen(),
};
