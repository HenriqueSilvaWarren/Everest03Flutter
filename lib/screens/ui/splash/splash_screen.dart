
import 'package:flutter/material.dart';

import '../wallet/wallet_screen.dart';


class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  static String route = '/';

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 3)).then(
      (value) {
        Navigator.pushReplacementNamed(
          context,
          WalletScreen.route
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Image.asset(
          "assets/images/warren.png",
          height: 100,
        ),
      ),
    );
  }
}
