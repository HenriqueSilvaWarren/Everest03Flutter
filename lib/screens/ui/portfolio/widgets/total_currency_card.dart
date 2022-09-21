import 'package:brasil_fields/brasil_fields.dart';
import 'package:card_02_listagem_crypto/screens/riverpod/get_all_crypto_coins_from_portfolio.dart';
import 'package:card_02_listagem_crypto/screens/riverpod/portfolio.dart';
import 'package:card_02_listagem_crypto/use_cases/models/coin_in_portfolio_model.dart';
import 'package:card_02_listagem_crypto/use_cases/models/crypto_coin_model.dart';
import 'package:card_02_listagem_crypto/use_cases/models/portfolio_model.dart';
import 'package:decimal/decimal.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../../core/utils/animated_hide_text_value.dart';
import '../../../../core/utils/hide_values_button.dart';

class TotalCurrencyCard extends HookConsumerWidget {
  const TotalCurrencyCard({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    List<CryptoCoinModel> cryptoList =
        ref.watch(getAllCryptoFromPortfolioProvider);
    PortfolioModel portfolio = ref.watch(portfolioStateProvider);

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
                  "Cripto",
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
          AnimatedHideTextValue(
            text: UtilBrasilFields.obterReal(
              cryptoList.fold(
                  0,
                  (previousValue, element) =>
                      previousValue +
                      element.prices['5D']!.last.y *
                          portfolio.coins
                              .firstWhere(
                                (coin) => coin.symbol == element.abbreviation,
                              )
                              .quantity
                              .toDouble()),
            ),
            style: GoogleFonts.montserrat(
              fontSize: 32,
              fontWeight: FontWeight.w700,
            ),
          ),
          Text(
            "Valor total de moedas",
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
