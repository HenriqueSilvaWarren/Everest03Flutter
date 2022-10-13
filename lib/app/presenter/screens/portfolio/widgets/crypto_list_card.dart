import 'package:card_02_listagem_crypto/l10n/app_localizations.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:intl/intl.dart';

import '../../../../../core/utils/animated_hide_text_value.dart';
import '../../../../domain/view_datas/coin_in_portfolio_view_data.dart';
import '../../../../domain/view_datas/crypto_coin_view_data.dart';
import '../../../riverpod/datasources/local/portfolio/screen/portfolio_provider.dart';
import '../../../riverpod/view/get_crypto_state_provider.dart';
import '../../../riverpod/view/get_price_from_chart.dart';
import '../../details/details_screen.dart';

class CryptoListCard extends HookConsumerWidget {
  const CryptoListCard({
    Key? key,
    required this.cryptoCoinViewData,
  }) : super(key: key);

  final CryptoCoinViewData cryptoCoinViewData;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final currencyFormatter = NumberFormat.currency(
      locale: CryptoAppStrings.of(context)!.language,
      symbol: CryptoAppStrings.of(context)!.currencySymbol,
    );
    final portfolio = ref.watch(portfolioProvider).value!;
    CoinInPortfolioViewData coin = portfolio.coins.firstWhere(
      (coin) =>
          coin.symbol.toLowerCase() == cryptoCoinViewData.symbol.toLowerCase(),
    );
    return Column(
      children: [
        const Divider(
          color: Color.fromARGB(255, 227, 228, 235),
          height: 1,
          thickness: 1,
        ),
        ListTile(
          onTap: () {
            ref.read(getPriceFromChartStateProvider.state).state = "";
            ref.read(getCryptoStateProvider.state).state = cryptoCoinViewData;
            Navigator.pushNamed(
              context,
              DetailsScreen.route,
            );
          },
          horizontalTitleGap: 8,
          leading: Container(
            height: 48,
            width: 48,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(100),
              image: DecorationImage(
                image: NetworkImage(
                  cryptoCoinViewData.image,
                ),
                fit: BoxFit.cover,
              ),
            ),
          ),
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                cryptoCoinViewData.symbol.toUpperCase(),
                style: GoogleFonts.sourceSansPro(
                  fontWeight: FontWeight.w400,
                  fontSize: 20,
                ),
              ),
              AnimatedHideTextValue(
                text: currencyFormatter.format(
                  (cryptoCoinViewData.currentPrice * coin.quantity).toDouble(),
                ),
                style: GoogleFonts.sourceSansPro(
                  fontSize: 20,
                  fontWeight: FontWeight.w400,
                ),
              )
            ],
          ),
          subtitle: Padding(
            padding: const EdgeInsets.only(top: 4.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  cryptoCoinViewData.name,
                  style: GoogleFonts.sourceSansPro(
                    fontWeight: FontWeight.w400,
                    fontSize: 15,
                  ),
                ),
                AnimatedHideTextValue(
                  text:
                      "${coin.quantity.toStringAsFixed(2)} ${cryptoCoinViewData.symbol.toUpperCase()}",
                  style: GoogleFonts.sourceSansPro(
                    fontSize: 15,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ],
            ),
          ),
          trailing: Column(
            children: const [
              Padding(
                padding: EdgeInsets.only(
                  top: 2,
                  bottom: 6,
                  left: 9,
                  right: 8,
                ),
                child: Icon(
                  Icons.chevron_right,
                  size: 24,
                  color: Color.fromARGB(255, 117, 118, 128),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
