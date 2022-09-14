import 'package:flutter/material.dart';

import 'widgets/body_wallet_screen.dart';
import 'widgets/custom_bottom_navigation_bar.dart';

class PortfolioScreen extends StatefulWidget {
  const PortfolioScreen({super.key});

  static String route = '/wallet-screen';

  @override
  State<PortfolioScreen> createState() => _PortfolioScreenState();
}

class _PortfolioScreenState extends State<PortfolioScreen> {
  int curIndex = 0;

  void _onItemTapped(int value) {
    setState(() {
      curIndex = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: const BodyPortfolioScreen(),
      bottomNavigationBar: CustomBottomNavigationBar(
        curIndex: curIndex,
        onTap: _onItemTapped,
      ),
    );
  }
}

