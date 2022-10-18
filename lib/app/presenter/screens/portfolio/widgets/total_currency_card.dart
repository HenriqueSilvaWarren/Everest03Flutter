<<<<<<< HEAD
import 'package:card_02_listagem_crypto/core/app_assets.dart';
=======
import '../../../riverpod/datasources/api/coin_gecko/screens/crypto_coin_based_on_portfolio_provider.dart';
import '../../../riverpod/view/get_currency_state_provider.dart';
import '../../../../../core/app_assets.dart';
>>>>>>> f66103ec2549608871c26fc9c9f7d80b4e46d90a
import 'package:intl/intl.dart';

import '../../../../../l10n/app_localizations.dart';
import '../../../../domain/view_datas/list_crypto_view_data.dart';
import '../../../../domain/view_datas/portfolio_view_data.dart';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../../../core/utils/animated_hide_text_value.dart';
import '../../../../../core/utils/hide_values_button.dart';
import 'change_language_button.dart';

class TotalCurrencyCard extends HookConsumerWidget {
  const TotalCurrencyCard({
    Key? key,
    required this.cryptoList,
    required this.portfolio,
  }) : super(key: key);

  final ListCryptoViewData cryptoList;
  final PortfolioViewData portfolio;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
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
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              AnimatedHideTextValue(
                key: const Key('hideTotalCurrencyValue'),
                text: currencyFormatter.format(
                  cryptoList.listCrypto.fold<double>(
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
              Tooltip(
                message: CryptoAppStrings.of(context)!.changeLanguage,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(5),
                  child: Stack(
                    children: [
                      Container(
                        height: 40,
                        width: 60,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                              image: AssetImage(
                                localeImage[
                                    CryptoAppStrings.of(context)!.language]!,
                              ),
                              fit: BoxFit.cover,
                              scale: 0.5),
                        ),
                      ),
                      const Positioned.fill(
                        child: Material(
                          color: Colors.transparent,
                          child: ChangeLanguageButton(
                            key: Key('changeLanguageButton'),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
          Text(
            CryptoAppStrings.of(context)!.amountOfCoin,
            style: GoogleFonts.sourceSansPro(
              fontSize: 17,
              fontWeight: FontWeight.w400,
              color: const Color.fromARGB(255, 117, 118, 128),
            ),
          )
        ],
      ),
    );
  }
}
