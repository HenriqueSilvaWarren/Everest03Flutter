import 'package:card_02_listagem_crypto/app/presenter/screens/portfolio/portfolio_screen.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ExchangedAppBar extends StatelessWidget implements PreferredSizeWidget {
  const ExchangedAppBar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      iconTheme: const IconThemeData(color: Colors.black),
      leading: IconButton(
        onPressed: () {
          Navigator.popUntil(
            context,
            ModalRoute.withName(PortfolioScreen.route),
          );
        },
        icon: const Icon(
          Icons.close,
        ),
      ),
      backgroundColor: Colors.white,
      elevation: 0,
      shape: Border(
        bottom: BorderSide(
          color: Colors.grey.shade300,
        ),
      ),
      titleTextStyle: GoogleFonts.sourceSansPro(
        color: Colors.black,
        fontWeight: FontWeight.w700,
        fontSize: 20,
      ),
    );
  }

  @override
  Size get preferredSize => const Size(double.maxFinite, 56);
}
