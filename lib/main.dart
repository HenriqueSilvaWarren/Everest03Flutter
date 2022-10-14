import 'app/presenter/riverpod/view/locale_state_provider.dart';
import 'l10n/app_localizations.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'app/presenter/screens/splash/splash_screen.dart';
import 'core/route_definitions.dart';
import 'core/utils/generate_route.dart';


void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends HookConsumerWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {

    return MaterialApp(
      localizationsDelegates: CryptoAppStrings.localizationsDelegates,
      supportedLocales: CryptoAppStrings.supportedLocales,
      locale: ref.watch(localeStateProvider),
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
