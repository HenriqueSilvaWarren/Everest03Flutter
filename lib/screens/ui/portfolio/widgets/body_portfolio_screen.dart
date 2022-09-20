import 'package:card_02_listagem_crypto/data_sources/web_services/get_crypto_by_id_web_service.dart';
import 'package:card_02_listagem_crypto/screens/riverpod/portfolio.dart';
import 'package:card_02_listagem_crypto/use_cases/coin_in_portfolio_model.dart';
import 'package:card_02_listagem_crypto/use_cases/models/portfolio_model.dart';

import '../../../../data_sources/database/get_all_crypto_coin_database.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'crypto_list_card.dart';
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
    PortfolioModel portfolio = ref.watch(portfolioStateProvider);
    return SafeArea(
      child: Column(
        children: [
          const TotalCurrencyCard(),
          Expanded(
            child: ListView.builder(
              physics: const BouncingScrollPhysics(),
              itemCount: portfolio.coins.length,
              itemBuilder: (context, index) {
                final cryptoCoin = getCryptoByIdWebService.getCryptoById(
                  portfolio.coins[index].name.toLowerCase(),
                );
                return CryptoListCard(
                  futureCryptoCoinModel: cryptoCoin,
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
