import '../../../../domain/view_datas/list_crypto_view_data.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../../../core/utils/animated_hide_text_value.dart';
import '../../../../../core/utils/get_real.dart';
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
    required this.listCryptosFromPortfolio,
  }) : super(key: key);

  final ListCryptoViewData listCryptosFromPortfolio;
  final CryptoCoinViewData cryptoCoinViewData;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ref.read(portfolioProvider).when(
      data: (portfolio) {
        CoinInPortfolioViewData coin = portfolio.coins.firstWhere(
          (coin) =>
              coin.symbol.toLowerCase() ==
              cryptoCoinViewData.symbol.toLowerCase(),
        );
        return ListTile(
          onTap: () {
            ref.read(getPriceFromChartStateProvider.state).state = "";
            ref.read(getCryptoStateProvider.state).state = cryptoCoinViewData;
            Navigator.pushNamed(
              context,
              DetailsScreen.route,
            );
          },
          horizontalTitleGap: 8,
          shape: const Border(
            top: BorderSide(
              color: Color.fromARGB(255, 227, 228, 235),
            ),
          ),
          leading: ClipRRect(
            borderRadius: BorderRadius.circular(100),
            child: Image.network(
              cryptoCoinViewData.image,
              height: 48,
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
                text: getReal(
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
        );
      },
      error: (error, stackTrace) {
        return const SizedBox.shrink();
      },
      loading: () {
        return const SizedBox.shrink();
      },
    );
  }
}
