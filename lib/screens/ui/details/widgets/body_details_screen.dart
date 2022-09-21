import 'package:brasil_fields/brasil_fields.dart';
import 'package:decimal/decimal.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../core/utils/animated_hide_text_value.dart';
import '../../../../core/utils/get_real.dart';
import '../../../../use_cases/models/coin_in_portfolio_model.dart';
import '../../../../use_cases/models/crypto_coin_model.dart';
import 'button_convert_currency.dart';
import 'custom_line_chart.dart';
import 'details_item.dart';
import 'details_screen_card_variation.dart';
import 'details_top_card_widget.dart';

class BodyDetailsScreen extends StatelessWidget {
  const BodyDetailsScreen({
    Key? key,
    required this.cryptoCoin,
    required this.values,
    required this.latestPrices,
    required this.coin,
  }) : super(key: key);

  final CryptoCoinModel cryptoCoin;
  final String values;
  final List<FlSpot> latestPrices;

  final CoinInPortfolioModel coin;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            DetailsTopCardWidget(cryptoCoin: cryptoCoin),
            AnimatedHideTextValue(
              text: values == "" ? getReal(latestPrices.last.y) : values,
              style: GoogleFonts.sourceSansPro(
                fontSize: 40,
                fontWeight: FontWeight.w700,
              ),
            ),
            CustomLineChart(
              spotsMap: cryptoCoin.prices,
            ),
            DetailsItem(
              title: 'Preço Atual:',
              value: UtilBrasilFields.obterReal(
                Decimal.parse(
                  latestPrices.last.y.toString(),
                ).toDouble(),
              ),
            ),
            DetailsScreenCardVariation(latestPrices: latestPrices),
            DetailsItem(
              title: "Quantidade",
              value: '${coin.quantity} ${cryptoCoin.symbol}',
            ),
            DetailsItem(
              title: "Valor",
              value: getReal(
                Decimal.parse(
                        '${latestPrices.last.y * coin.quantity.toDouble()}')
                    .toDouble(),
              ),
            ),
            const ButtonConvertCurrency(),
          ],
        ),
      ),
    );
  }
}
