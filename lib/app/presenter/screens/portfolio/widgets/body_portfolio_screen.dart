import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../riverpod/datasources/api/coin_gecko/screens/crypto_coin_based_on_portfolio_provider.dart';
import '../../../riverpod/datasources/local/portfolio/screen/portfolio_provider.dart';
import 'crypto_list_card.dart';
import 'loading_crypto_list.dart';
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
    return SafeArea(
      child: Column(
        children: [
          const TotalCurrencyCard(),
          ref.watch(portfolioProvider).when(
                data: (portfolio) {
                  final allCryptoFromPortfolio = ref.watch(
                    cryptoCoinBasedOnPortfolioProvider(portfolio),
                  );
                  final coins = portfolio.coins;

                  return allCryptoFromPortfolio.when(
                    data: (allCryptoFromPortfolio) => SizedBox(
                      height: MediaQuery.of(context).size.height * 0.66,
                      child: ListView.builder(
                        itemExtent: 73,
                        physics: const BouncingScrollPhysics(),
                        itemCount: coins.length,
                        itemBuilder: (context, index) {
                          return CryptoListCard(
                            cryptoCoinViewData:
                                allCryptoFromPortfolio.listCrypto[index],
                          );
                        },
                      ),
                    ),
                    error: (error, stackTrace) => Text('$error'),
                    loading: () => const LoadingCryptoList(),
                  );
                },
                error: (error, stackTrace) => const Text(''),
                loading: () => const LoadingCryptoList(),
              ),
        ],
      ),
    );
  }
}
