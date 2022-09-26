import 'package:brasil_fields/brasil_fields.dart';
import 'package:card_02_listagem_crypto/app/domain/view_datas/crypto_historic_price_view_data.dart';
import 'package:card_02_listagem_crypto/app/presenter/riverpod/api/coin_gecko/screens/crypto_coin_based_on_portfolio_provider.dart';
import 'package:card_02_listagem_crypto/app/presenter/riverpod/api/coin_gecko/screens/crypto_historic_price_by_id_provider.dart';
import 'package:decimal/decimal.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../../../core/utils/animated_hide_text_value.dart';
import '../../../../../core/utils/get_real.dart';

import '../../../../domain/use_cases/models/coin_in_portfolio_model.dart';

import '../../../../domain/view_datas/crypto_coin_view_data.dart';
import '../../../riverpod/view/crypto_prices_list_provider.dart';
import '../../../riverpod/view/get_crypto_id_state_provider.dart';
import '../../../riverpod/view/get_price_from_chart.dart';
import '../../../riverpod/view/portfolio.dart';
import 'button_convert_currency.dart';
import 'custom_line_chart.dart';
import 'details_item.dart';
import 'details_item_variation.dart';
import 'details_top_card_widget.dart';

class BodyDetailsScreen extends HookConsumerWidget {
  const BodyDetailsScreen({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final AsyncValue<CryptoCoinViewData> cryptoCoin = ref
        .watch(cryptoCoinBasedOnPortfolioProvider)
        .whenData(
          (value) => value.listCrypto.firstWhere(
            (element) =>
                element.id == ref.read(getCryptoIdStateProvider.state).state,
          ),
        );

    final AsyncValue<CryptoHistoricPriceViewData> cryptoPrices = ref.watch(
      cryptoHistoricPriceByIdProvider(
          ref.read(getCryptoIdStateProvider.state).state),
    );

    String values = ref.watch(getPriceFromChartStateProvider);

    List<CoinInPortfolioModel> coins = ref.watch(portfolioStateProvider).coins;

    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      child: cryptoCoin.when(
        data: (cryptoCoin) {
          CoinInPortfolioModel coin = coins.firstWhere(
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
                      ? getReal(cryptoCoin.currentPrice.toDouble())
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
                  loading: () => const Text('Carregando'),
                ),
                DetailsItem(
                  title: 'Preço Atual:',
                  value: UtilBrasilFields.obterReal(
                    Decimal.parse(
                      cryptoCoin.currentPrice.toString(),
                    ).toDouble(),
                  ),
                ),
                cryptoPrices.when(
                  data: (data) {
                    return DetailsItemVariation(cryptoPricesList: data.cryptoPricesList,);
                  },
                  error: (error, stackTrace) => const Text('Deu erro'),
                  loading: () => const Text('Carregando'),
                ),
                DetailsItem(
                  title: "Quantidade",
                  value: '${coin.quantity} ${cryptoCoin.symbol}',
                ),
                DetailsItem(
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
        error: (error, stackTrace) => Text('$error'),
        loading: () => const Text('Carregando...'),
      ),
    );
  }
}
