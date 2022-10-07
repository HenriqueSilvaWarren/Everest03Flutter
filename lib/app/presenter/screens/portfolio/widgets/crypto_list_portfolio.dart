import 'package:flutter/material.dart';

import '../../../../domain/view_datas/coin_in_portfolio_view_data.dart';
import '../../../../domain/view_datas/list_crypto_view_data.dart';
import 'crypto_list_card.dart';

class CryptoListPortfolio extends StatelessWidget {
  const CryptoListPortfolio({
    Key? key,
    required this.coins,
    required this.allCryptoFromPortfolio,
  }) : super(key: key);

  final List<CoinInPortfolioViewData> coins;
  final ListCryptoViewData allCryptoFromPortfolio;
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
        itemExtent: 73,
        physics: const BouncingScrollPhysics(),
        itemCount: coins.length,
        itemBuilder: (context, index) {
          return CryptoListCard(
            cryptoCoinViewData: allCryptoFromPortfolio.listCrypto[index],
          );
        },
      ),
    );
  }
}
