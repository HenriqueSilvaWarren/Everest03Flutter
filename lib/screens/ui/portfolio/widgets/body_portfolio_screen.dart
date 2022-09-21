import 'package:card_02_listagem_crypto/screens/riverpod/get_all_crypto_coins_from_portfolio.dart';
import 'package:card_02_listagem_crypto/use_cases/models/crypto_coin_model.dart';

import '../../../../data_sources/web_services/get_crypto_by_id_web_service.dart';
import '../../../riverpod/portfolio.dart';

import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

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
  GetCryptoByIdWebService getCryptoByIdWebService = GetCryptoByIdWebService();
  @override
  Widget build(BuildContext context) {
    List<CryptoCoinModel> allCryptoFromPortfolio =
        ref.watch(getAllCryptoFromPortfolioProvider);
    return SafeArea(
      child: Column(
        children: [
          const TotalCurrencyCard(),
          Expanded(
            child: Visibility(
              visible: allCryptoFromPortfolio.isNotEmpty,
              replacement: ListView.builder(
                physics: const BouncingScrollPhysics(),
                itemCount: ref.read(portfolioStateProvider).coins.length,
                itemBuilder: (context, index) {
                  return const CryptoListReplacementCard();
                },
              ),
              child: ListView.builder(
                itemExtent: 73,
                physics: const BouncingScrollPhysics(),
                itemCount: allCryptoFromPortfolio.length,
                itemBuilder: (context, index) {
                  return CryptoListCard(
                    cryptoCoinModel: allCryptoFromPortfolio[index],
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
