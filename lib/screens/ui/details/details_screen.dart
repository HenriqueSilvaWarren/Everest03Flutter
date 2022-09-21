import 'package:brasil_fields/brasil_fields.dart';
import 'package:decimal/decimal.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../core/utils/animated_hide_text_value.dart';
import '../../../core/utils/hide_values_button.dart';
import '../../../use_cases/models/coin_in_portfolio_model.dart';
import '../../../use_cases/models/crypto_coin_model.dart';
import '../../riverpod/portfolio.dart';
import 'widgets/custom_line_chart.dart';
import 'widgets/details_item.dart';
import 'widgets/details_screen_card_variation.dart';
import 'widgets/details_top_card_widget.dart';

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
    CryptoCoinModel cryptoCoin = widget.cryptoCoinModel;
    List<FlSpot> latestPrices = cryptoCoin.prices['5D']!;
    CoinInPortfolioModel coin =
        ref.watch(portfolioStateProvider).coins.firstWhere(
              (coin) => coin.symbol.toLowerCase() == cryptoCoin.abbreviation.toLowerCase(),
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
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            DetailsTopCardWidget(cryptoCoin: cryptoCoin),
            CustomLineChart(
              spotsMap: widget.cryptoCoinModel.prices,
            ),
            DetailsItem(
              title: 'Preço Atual:',
              value: UtilBrasilFields.obterReal(
                double.parse(
                  Decimal.parse(
                    latestPrices.last.y.toString(),
                  ).toString(),
                ),
              ),
            ),
            DetailsScreenCardVariation(latestPrices: latestPrices),
            DetailsItem(
              title: "Quantidade",
              value: '${coin.quantity} ${cryptoCoin.abbreviation}',
            ),
            DetailsItem(
              title: "Valor",
              value: UtilBrasilFields.obterReal(
                (Decimal.parse(
                        '${latestPrices.last.y * coin.quantity.toDouble()}')
                    .toDouble()),
              ),
            ),
          ],
        ),
      ),
    );
  }
}




