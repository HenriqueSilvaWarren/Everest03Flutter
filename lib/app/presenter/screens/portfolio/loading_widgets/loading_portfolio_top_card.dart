import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:shimmer/shimmer.dart';

import '../../../../../core/utils/animated_hide_text_value.dart';
import '../../../../../core/utils/hide_values_button.dart';

import '../../../../../l10n/app_localizations.dart';

class LoadingPortfolioTopCard extends StatelessWidget {
  const LoadingPortfolioTopCard({
    Key? key
  }) : super(key: key); // coverage:ignore-line

  @override
  Widget build(BuildContext context) {
    final currencyFormatter = NumberFormat.currency(
      locale: CryptoAppStrings.of(context)!.language,
      symbol: CryptoAppStrings.of(context)!.currencySymbol,
    );
    return Container(
      margin: const EdgeInsets.only(
        top: 10,
        left: 15,
        right: 15,
        bottom: 30,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(bottom: 8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  key: const Key('cryptoLoadingPortfolioText'),
                  CryptoAppStrings.of(context)!.crypto,
                  style: GoogleFonts.montserrat(
                    fontSize: 32,
                    color: const Color.fromARGB(255, 224, 43, 87),
                    fontWeight: FontWeight.w700,
                  ),
                ),
                const HideValuesButton(),
              ],
            ),
          ),
          Shimmer.fromColors(
            baseColor: Colors.grey.shade300,
            highlightColor: Colors.grey.shade200,
            child: AnimatedHideTextValue(
              text: currencyFormatter.format(0),
              style: GoogleFonts.montserrat(
                fontSize: 32,
                fontWeight: FontWeight.w700,
              ),
            ),
          ),
          Text(
            CryptoAppStrings.of(context)!.amountOfCoin,
            style: GoogleFonts.sourceSansPro(
                fontSize: 17,
                fontWeight: FontWeight.w400,
                color: const Color.fromARGB(255, 117, 118, 128)),
          )
        ],
      ),
    );
  }
}
