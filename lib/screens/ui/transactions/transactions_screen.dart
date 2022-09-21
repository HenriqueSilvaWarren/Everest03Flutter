import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';

import '../../../core/app_assets.dart';
import '../../../core/utils/custom_bottom_navigation_bar.dart';
import '../portfolio/portfolio_screen.dart';


class TransactionsScreen extends StatelessWidget {
  const TransactionsScreen({Key? key}) : super(key: key);

  static String route = '/transactions-screen';

  @override
  Widget build(BuildContext context) {
    int curIndex = 1;
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Página não implementada ainda",
              textAlign: TextAlign.center,
              style: GoogleFonts.sourceCodePro(
                fontSize: 32,
                fontWeight: FontWeight.w700,
              ),
            ),
            Lottie.asset(
              notFoundAnimation,
            ),
          ],
        ),
      ),
      bottomNavigationBar: CustomBottomNavigationBar(
        curIndex: curIndex,
        onTap: (value) {
          switch (value) {
            case 0:
              Navigator.pushReplacementNamed(context, PortfolioScreen.route);
              break;
            case 1:
              Navigator.pushReplacementNamed(
                context,
                TransactionsScreen.route
              );
              break;
          }
        },
      ),
    );
  }
}
