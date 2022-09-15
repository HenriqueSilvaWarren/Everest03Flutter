import 'package:card_02_listagem_crypto/core/app_assets.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';

class TransactionsScreen extends StatelessWidget {
  const TransactionsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
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
    );
  }
}
