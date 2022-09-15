import 'package:card_02_listagem_crypto/core/app_assets.dart';
import 'package:card_02_listagem_crypto/screens/ui/portfolio/portfolio_screen.dart';
import 'package:card_02_listagem_crypto/screens/ui/portfolio/widgets/custom_bottom_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';

import '../../../core/route_definitions.dart';

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
              Navigator.pushReplacement(
                context,
                PageRouteBuilder(
                  pageBuilder: (context, animation, secondaryAnimation) =>
                      routeDefinitions[PortfolioScreen.route]!(context),
                ),
              );
              break;
            case 1:
              Navigator.pushReplacement(
                context,
                PageRouteBuilder(
                  pageBuilder: (context, animation, secondaryAnimation) =>
                      routeDefinitions[TransactionsScreen.route]!(context),
                ),
              );
              break;
            default:
              break;
          }
        },
      ),
    );
  }
}
