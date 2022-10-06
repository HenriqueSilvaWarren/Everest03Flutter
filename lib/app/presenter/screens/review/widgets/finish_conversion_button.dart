import 'package:card_02_listagem_crypto/l10n/app_localizations.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../exchanged/exchanged_screen.dart';
import '../../portfolio/portfolio_screen.dart';
import '../utils/exchange_coins.dart';

class FinishConversionButton extends StatefulHookConsumerWidget {
  const FinishConversionButton({
    Key? key,
  }) : super(key: key);

  @override
  ConsumerState<FinishConversionButton> createState() =>
      _FinishConversionButtonState();
}

class _FinishConversionButtonState
    extends ConsumerState<FinishConversionButton> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 24.0),
      child: InkWell(
        onTap: () {
          buttonExchangeCoins(ref);
          Navigator.of(context).pushNamedAndRemoveUntil(
            ExchangedScreen.route,
            ModalRoute.withName(PortfolioScreen.route),
          );
        },
        child: Container(
          alignment: Alignment.center,
          width: MediaQuery.of(context).size.width,
          height: 56,
          decoration: BoxDecoration(
            color: const Color.fromRGBO(224, 43, 87, 1),
            borderRadius: BorderRadius.circular(8),
          ),
          child: Text(
            CryptoAppStrings.of(context)!.finishExchange,
            style: GoogleFonts.sourceSansPro(
              fontSize: 17,
              fontWeight: FontWeight.w700,
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }
}
