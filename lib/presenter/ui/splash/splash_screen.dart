import 'package:card_02_listagem_crypto/presenter/ui/wallet/wallet_screen.dart';
import 'package:flutter/material.dart';


class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 3)).then(
      (value) {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) {
              return const WalletScreen();
            },
          ),
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
