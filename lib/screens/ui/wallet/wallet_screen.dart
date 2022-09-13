import 'package:flutter/material.dart';

import 'widgets/body_wallet_screen.dart';
import 'widgets/custom_bottom_navigation_bar.dart';

class WalletScreen extends StatefulWidget {
  const WalletScreen({super.key});

  static String route = '/wallet-screen';

  @override
  State<WalletScreen> createState() => _WalletScreenState();
}

class _WalletScreenState extends State<WalletScreen> {
  int curIndex = 0;

  void _onItemTapped(int value) {
    setState(() {
      curIndex = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: const BodyWalletScreen(),
      bottomNavigationBar: CustomBottomNavigationBar(
        curIndex: curIndex,
        onTap: _onItemTapped,
      ),
    );
  }
}

