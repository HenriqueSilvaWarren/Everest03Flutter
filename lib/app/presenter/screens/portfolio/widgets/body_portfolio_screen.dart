import 'loading_portfolio_screen.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../../domain/view_datas/portfolio_view_data.dart';
import '../../../riverpod/datasources/api/coin_gecko/screens/crypto_coin_based_on_portfolio_provider.dart';
import 'crypto_list_card.dart';
import 'total_currency_card.dart';

class BodyPortfolioScreen extends StatefulHookConsumerWidget {
  const BodyPortfolioScreen({Key? key, required this.portfolio})
      : super(key: key);

  final PortfolioViewData portfolio;

  @override
  ConsumerState<BodyPortfolioScreen> createState() =>
      _BodyPortfolioScreenState();
}

class _BodyPortfolioScreenState extends ConsumerState<BodyPortfolioScreen> {
  @override
  Widget build(BuildContext context) {
    final coins = widget.portfolio.coins;
    return ref
        .watch(
          cryptoCoinBasedOnPortfolioProvider,
        )
        .when(
          data: (allCryptoFromPortfolio) {
            return Column(
              children: [
                TotalCurrencyCard(
                  cryptoList: allCryptoFromPortfolio,
                  portfolio: widget.portfolio,
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.66,
                  child: ListView.builder(
                    itemExtent: 73,
                    physics: const BouncingScrollPhysics(),
                    itemCount: coins.length,
                    itemBuilder: (context, index) {
                      return CryptoListCard(
                        cryptoCoinViewData:
                            allCryptoFromPortfolio.listCrypto[index],
                        listCryptosFromPortfolio: allCryptoFromPortfolio,
                      );
                    },
                  ),
                ),
              ],
            );
          },
          error: (error, stackTrace) => Text('$error'),
          loading: () => const LoadingPortfolioScreen(),
        );
  }
}
