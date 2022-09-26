import 'package:card_02_listagem_crypto/app/presenter/riverpod/api/coin_gecko/screens/crypto_coin_based_on_portfolio_provider.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../riverpod/view/portfolio.dart';
import 'crypto_list_card.dart';
import 'crypto_list_replacement.dart';
import 'total_currency_card.dart';

class BodyPortfolioScreen extends StatefulHookConsumerWidget {
  const BodyPortfolioScreen({
    Key? key,
  }) : super(key: key);

  @override
  ConsumerState<BodyPortfolioScreen> createState() => _BodyWalletScreenState();
}

class _BodyWalletScreenState extends ConsumerState<BodyPortfolioScreen> {
  // GetCryptoByIdWebService getCryptoByIdWebService = GetCryptoByIdWebService();
  @override
  Widget build(BuildContext context) {
    final allCryptoFromPortfolio =
        ref.watch(cryptoCoinBasedOnPortfolioProvider);
    final coins = ref.read(portfolioStateProvider).coins;
    return SafeArea(
      child: Column(
        children: [
          const TotalCurrencyCard(),
          allCryptoFromPortfolio.when(
            data: (allCryptoFromPortfolio) => SizedBox(
              height: MediaQuery.of(context).size.height * 0.66,
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
            ),
            error: (error, stackTrace) =>  Text('$error'),
            loading: () => SizedBox(
              height: 50,
              child: ListView.builder(
                physics: const BouncingScrollPhysics(),
                itemCount: coins.length,
                itemBuilder: (context, index) {
                  return const CryptoListReplacementCard();
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
