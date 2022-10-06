import 'package:card_02_listagem_crypto/l10n/app_localizations.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'app/presenter/screens/splash/splash_screen.dart';
import 'core/route_definitions.dart';
import 'core/utils/generate_route.dart';


void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      localizationsDelegates: CryptoAppStrings.localizationsDelegates,
      supportedLocales: CryptoAppStrings.supportedLocales,
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      home: routeDefinitions[SplashScreen.route]!(context),
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      onGenerateRoute: generateRoute,
    );
  }
}
