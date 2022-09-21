import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../core/utils/hide_values_button.dart';
import '../../../use_cases/models/coin_in_portfolio_model.dart';
import '../../../use_cases/models/crypto_coin_model.dart';
import '../../riverpod/get_price_from_chart.dart';
import '../../riverpod/portfolio.dart';
import 'widgets/body_details_screen.dart';

class DetailsScreen extends StatefulHookConsumerWidget {
  const DetailsScreen({Key? key, required this.cryptoCoinModel})
      : super(key: key);

  static String route = '/details-screen';
  final CryptoCoinModel cryptoCoinModel;
  @override
  ConsumerState<DetailsScreen> createState() => _DetailsScreenState();
}

class _DetailsScreenState extends ConsumerState<DetailsScreen> {
  @override
  Widget build(BuildContext context) {
    String values = ref.watch(getPriceFromChartStateProvider);
    CryptoCoinModel cryptoCoin = widget.cryptoCoinModel;
    List<FlSpot> latestPrices = cryptoCoin.prices['5D']!;
    List<CoinInPortfolioModel> coins = ref.watch(portfolioStateProvider).coins;
    CoinInPortfolioModel coin = coins.firstWhere(
      (coin) {
        return coin.symbol.toLowerCase() == cryptoCoin.symbol.toLowerCase();
      },
    );
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.black),
        title: const Text(
          'Detalhes',
        ),
        actions: const [
          Padding(
            padding: EdgeInsets.only(right: 20),
            child: HideValuesButton(),
          )
        ],
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
          fontSize: 22,
        ),
      ),
      body: BodyDetailsScreen(
          cryptoCoin: cryptoCoin,
          values: values,
          latestPrices: latestPrices,
          widget: widget,
          coin: coin),
    );
  }
}
