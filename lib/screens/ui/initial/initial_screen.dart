import 'package:card_02_listagem_crypto/screens/ui/portfolio/widgets/body_portfolio_screen.dart';
import 'package:card_02_listagem_crypto/screens/ui/transactions/transactions_screen.dart';
import 'package:flutter/material.dart';

import '../portfolio/portfolio_screen.dart';
import '../portfolio/widgets/custom_bottom_navigation_bar.dart';

class InitialScreen extends StatefulWidget {
  const InitialScreen({Key? key}) : super(key: key);

  static String route = '/initial-screen';
    
  @override
  State<InitialScreen> createState() => _InitialScreenState();
}

class _InitialScreenState extends State<InitialScreen> {
  int curIndex = 0;

  void _onItemTapped(int value) {
    setState(() {
      curIndex = value;
    });
  }

  final List<Widget> _pageList = [
    const PortfolioScreen(),
    const TransactionsScreen()
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pageList.elementAt(curIndex),
      bottomNavigationBar: CustomBottomNavigationBar(
        curIndex: curIndex,
        onTap: _onItemTapped,
      ),
    );
  }
}
