import 'package:card_02_listagem_crypto/screens/ui/portfolio/portfolio_screen.dart';
import 'package:card_02_listagem_crypto/screens/ui/transactions/transactions_screen.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'core/route_definitions.dart';
import 'screens/ui/splash/splash_screen.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      initialRoute: SplashScreen.route,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      onGenerateRoute: (settings) {
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
      },
    );
  }
}
