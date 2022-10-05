import 'package:card_02_listagem_crypto/app/domain/view_datas/coin_in_portfolio_view_data.dart';
import 'package:card_02_listagem_crypto/app/domain/view_datas/crypto_coin_view_data.dart';
import 'package:card_02_listagem_crypto/app/domain/view_datas/list_crypto_view_data.dart';
import 'package:card_02_listagem_crypto/app/domain/view_datas/portfolio_view_data.dart';
import 'package:card_02_listagem_crypto/app/presenter/riverpod/datasources/api/coin_gecko/screens/crypto_coin_from_api_provider.dart';
import 'package:card_02_listagem_crypto/app/presenter/riverpod/datasources/local/portfolio/screen/portfolio_provider.dart';
import 'package:card_02_listagem_crypto/app/presenter/riverpod/view/conversion_data_state_provider.dart';
import 'package:decimal/decimal.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class FinishConversionButton extends StatefulHookConsumerWidget {
  const FinishConversionButton({
    Key? key,
  }) : super(key: key);

  @override
  ConsumerState<FinishConversionButton> createState() =>
      _FinishConversionButtonState();
}

class _FinishConversionButtonState
    extends ConsumerState<FinishConversionButton> {
  void exchangeCoins(
    WidgetRef ref,
  ) {
    Map<String, List<String>> dataFromConversion =
        ref.watch(conversionDataStateProvider)!;
    PortfolioViewData portfolio = ref.watch(portfolioProvider).value!;
    ListCryptoViewData listCryptoViewData =
        ref.watch(cryptoCoinFromApiProvider).value!;

    List<String> convCrypto = dataFromConversion['convertingCrypto']!;
    CoinInPortfolioViewData convCryptoInPortfolio = portfolio.coins.firstWhere(
      (coin) => coin.symbol.toUpperCase() == convCrypto[1].toUpperCase(),
    );
    Decimal convCryptoQuantity = Decimal.parse(
      convCrypto[0].replaceAll(',', '.'),
    );
    if (convCryptoInPortfolio.quantity - convCryptoQuantity == Decimal.zero) {
      portfolio.coins.remove(convCryptoInPortfolio);
    } else {
      convCryptoInPortfolio.quantity -= convCryptoQuantity;
    }

    List<String> recCrypto = dataFromConversion['receivingCrypto']!;
    CryptoCoinViewData recCryptoFromApi = listCryptoViewData.listCrypto.firstWhere((crypto) => crypto.symbol.toUpperCase() == recCrypto[1].toUpperCase());
    if(portfolio.coins.contains())
  }

  @override
  Widget build(BuildContext context) {
    var dataFromConversion = ref.watch(conversionDataStateProvider)!;
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 24.0),
      child: InkWell(
        onTap: () {
          for (CoinInPortfolioViewData coin
              in ref.watch(portfolioProvider).value!.coins) {
            print("${coin.name} : ${coin.quantity}");
          }

          exchangeCoins(ref);
          print('--------------------------------------');
          for (CoinInPortfolioViewData coin
              in ref.watch(portfolioProvider).value!.coins) {
            print("${coin.name} : ${coin.quantity}");
          }

          // Navigator.of(context).pushNamed(
          //   ExchangedScreen.route,
          // );
        },
        child: Container(
          alignment: Alignment.center,
          width: MediaQuery.of(context).size.width,
          height: 56,
          decoration: BoxDecoration(
            color: const Color.fromRGBO(224, 43, 87, 1),
            borderRadius: BorderRadius.circular(8),
          ),
          child: Text(
            'Concluir conversão',
            style: GoogleFonts.sourceSansPro(
              fontSize: 17,
              fontWeight: FontWeight.w700,
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }
}
