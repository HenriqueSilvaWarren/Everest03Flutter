import '../../../../../core/utils/loading_monetary_value.dart';
import '../../../riverpod/datasources/local/portfolio/screen/portfolio_provider.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../../../core/utils/animated_hide_text_value.dart';
import '../../../../../core/utils/get_real.dart';
import '../../../../../core/utils/hide_values_button.dart';
import '../../../riverpod/datasources/api/coin_gecko/screens/crypto_coin_based_on_portfolio_provider.dart';

class TotalCurrencyCard extends HookConsumerWidget {
  const TotalCurrencyCard({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
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
          ref.watch(portfolioProvider).when(
            data: (portfolio) {
              final cryptoList =
                  ref.watch(cryptoCoinBasedOnPortfolioProvider(portfolio));
              return cryptoList.when(
                data: (cryptoList) => AnimatedHideTextValue(
                  text: getReal(
                    cryptoList.listCrypto.fold(
                      0,
                      (prevPrice, model) {
                        return prevPrice +
                            model.currentPrice.toDouble() *
                                portfolio.coins
                                    .firstWhere(
                                      (coin) =>
                                          coin.symbol.toLowerCase() ==
                                          model.symbol.toLowerCase(),
                                    )
                                    .quantity
                                    .toDouble();
                      },
                    ),
                  ),
                  style: GoogleFonts.montserrat(
                    fontSize: 32,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                error: (error, stackTrace) => const Text(''),
                loading: () => const LoadingMonetaryValue(),
              );
            },
            error: (error, stackTrace) {
              return const SizedBox.shrink();
            },
            loading: () {
              return const LoadingMonetaryValue();
            },
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
