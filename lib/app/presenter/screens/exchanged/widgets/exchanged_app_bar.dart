import 'package:card_02_listagem_crypto/app/presenter/screens/portfolio/portfolio_screen.dart';
import 'package:card_02_listagem_crypto/app/presenter/screens/transactions/transactions_screen.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../riverpod/datasources/api/coin_gecko/screens/crypto_coin_based_on_portfolio_provider.dart';

class ExchangedAppBar extends HookConsumerWidget
    implements PreferredSizeWidget {
  const ExchangedAppBar({
    Key? key,
  }) : super(key: key); // coverage:ignore-line

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return AppBar(
      iconTheme: const IconThemeData(color: Colors.black),
      backgroundColor: Colors.white,
      elevation: 0,
      leading: IconButton(
        onPressed: () {
          ref.refresh(cryptoCoinBasedOnPortfolioProvider);
          Navigator.of(context).pushNamedAndRemoveUntil(
            TransactionsScreen.route,
            ModalRoute.withName(PortfolioScreen.route)
          );
        },
        icon: const Icon(Icons.close),
      ),
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
