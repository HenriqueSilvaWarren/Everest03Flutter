import 'package:brasil_fields/brasil_fields.dart';
import 'package:decimal/decimal.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../../../core/utils/animated_hide_text_value.dart';
import '../../../../../core/utils/get_real.dart';
import '../../../../domain/view_datas/coin_in_portfolio_view_data.dart';
import '../../../../domain/view_datas/crypto_coin_view_data.dart';
import '../../../../domain/view_datas/crypto_historic_price_view_data.dart';
import '../../../riverpod/datasources/api/coin_gecko/screens/crypto_historic_price_by_id_provider.dart';
import '../../../riverpod/datasources/local/portfolio/screen/portfolio_provider.dart';
import '../../../riverpod/view/get_crypto_state_provider.dart';
import '../../../riverpod/view/get_price_from_chart.dart';
import '../loading_widgets/loading_chart.dart';
import '../loading_widgets/loading_details_variation.dart';
import 'button_convert_currency.dart';
import 'custom_line_chart.dart';
import '../../../../../core/utils/screens_item.dart';
import 'details_item_variation.dart';
import 'details_top_card_widget.dart';

class BodyDetailsScreen extends HookConsumerWidget {
  const BodyDetailsScreen({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final AsyncValue<CryptoHistoricPriceViewData> cryptoPrices = ref.watch(
      cryptoHistoricPriceByIdProvider(
        ref.read(getCryptoStateProvider).id,
      ),
    );

    String values = ref.watch(getPriceFromChartStateProvider);

    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      child: ref.read(portfolioProvider).when(
        data: (portfolio) {
          final CryptoCoinViewData cryptoCoin =
              ref.read(getCryptoStateProvider);

          List<CoinInPortfolioViewData> coins = portfolio.coins;

          CoinInPortfolioViewData coin = coins.firstWhere(
            (coin) {
              return coin.symbol.toLowerCase() ==
                  cryptoCoin.symbol.toLowerCase();
            },
          );

          return Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const DetailsTopCardWidget(),
                AnimatedHideTextValue(
                  text: values == ""
                      ? getReal(
                          cryptoCoin.currentPrice.toDouble(),
                        )
                      : values,
                  style: GoogleFonts.sourceSansPro(
                    fontSize: 40,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                cryptoPrices.when(
                  data: (data) {
                    return CustomLineChart(
                      cryptoPricesList: data.cryptoPricesList,
                    );
                  },
                  error: (error, stackTrace) => const Text('Deu erro'),
                  loading: () => const LoadingChart(),
                ),
                ScreensItem(
                  title: 'Preço Atual:',
                  value: UtilBrasilFields.obterReal(
                    Decimal.parse(
                      cryptoCoin.currentPrice.toString(),
                    ).toDouble(),
                  ),
                ),
                cryptoPrices.when(
                  data: (data) {
                    return DetailsItemVariation(
                      cryptoPricesList: data.cryptoPricesList,
                    );
                  },
                  error: (error, stackTrace) => const Text('Deu erro'),
                  loading: () => ListTile(
                    title: Text(
                      'Variação 24H',
                      style: GoogleFonts.sourceSansPro(
                        fontSize: 19,
                        color: Colors.grey,
                      ),
                    ),
                    trailing: const LoadingDetailsItemVariation(),
                    contentPadding: EdgeInsets.zero,
                    shape: const Border(
                      top: BorderSide(
                        color: Color.fromRGBO(227, 228, 235, 1),
                      ),
                    ),
                  ),
                ),
                ScreensItem(
                  title: "Quantidade",
                  value: '${coin.quantity} ${cryptoCoin.symbol.toUpperCase()}',
                ),
                ScreensItem(
                  title: "Valor",
                  value: getReal(
                    (cryptoCoin.currentPrice * coin.quantity).toDouble(),
                  ),
                ),
                const ButtonConvertCurrency(),
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
      ),
    );
  }
}
