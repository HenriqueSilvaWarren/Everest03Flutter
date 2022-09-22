import 'package:brasil_fields/brasil_fields.dart';
import 'package:card_02_listagem_crypto/screens/riverpod/get_crypto_model_for_details_screen.dart';
import 'package:decimal/decimal.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../../core/utils/animated_hide_text_value.dart';
import '../../../../core/utils/get_real.dart';
import '../../../../use_cases/models/coin_in_portfolio_model.dart';
import '../../../../use_cases/models/crypto_coin_model.dart';
import '../../../riverpod/get_price_from_chart.dart';
import '../../../riverpod/portfolio.dart';
import 'button_convert_currency.dart';
import 'custom_line_chart.dart';
import 'details_item.dart';
import 'details_screen_card_variation.dart';
import 'details_top_card_widget.dart';

class BodyDetailsScreen extends HookConsumerWidget {
  const BodyDetailsScreen({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final CryptoCoinModel cryptoCoin = ref.watch(getCryptoModelForDetailsScreen);

    String values = ref.watch(getPriceFromChartStateProvider);
    
    List<FlSpot> latestPrices = cryptoCoin.prices['5D']!;
    
    List<CoinInPortfolioModel> coins = ref.watch(portfolioStateProvider).coins;
    
    CoinInPortfolioModel coin = coins.firstWhere(
      (coin) {
        return coin.symbol.toLowerCase() == cryptoCoin.symbol.toLowerCase();
      },
    );
    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const DetailsTopCardWidget(),
            AnimatedHideTextValue(
              text: values == "" ? getReal(latestPrices.last.y) : values,
              style: GoogleFonts.sourceSansPro(
                fontSize: 40,
                fontWeight: FontWeight.w700,
              ),
            ),
            const CustomLineChart(),
            DetailsItem(
              title: 'Preço Atual:',
              value: UtilBrasilFields.obterReal(
                Decimal.parse(
                  latestPrices.last.y.toString(),
                ).toDouble(),
              ),
            ),
            const DetailsScreenCardVariation(),
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
