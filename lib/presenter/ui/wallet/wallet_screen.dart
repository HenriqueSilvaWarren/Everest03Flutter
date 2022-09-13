import 'package:brasil_fields/brasil_fields.dart';
import 'package:card_02_listagem_crypto/shared/app_assets.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'widgets/body_wallet_screen.dart';
import 'widgets/custom_bottom_navigation_bar.dart';

class WalletScreen extends StatefulWidget {
  const WalletScreen({super.key});

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
      bottomNavigationBar: CustomBottomNavigationBar(
        curIndex: curIndex,
        onTap: _onItemTapped,
      ),
      body: const BodyWalletScreen(),
    );
  }
}

