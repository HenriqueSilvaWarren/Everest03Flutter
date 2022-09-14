import 'package:card_02_listagem_crypto/data_sources/database/get_all_crypto_coin_database.dart';
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
  final getAllCryptoCoinDatabase = GetAllCryptoCoinDatabase();
  @override
  Widget build(BuildContext context) {
    final cryptoCoinList = getAllCryptoCoinDatabase.getAllCryptoCoin();
    return SafeArea(
      child: Column(
        children: [
          const TotalCurrencyCard(),
          Expanded(
            child: ListView.builder(
              physics: const BouncingScrollPhysics(),
              itemCount: cryptoCoinList.length,
              itemBuilder: (context, index) {
                return CryptoListCard(
                  cryptoCoinModel: cryptoCoinList[index],
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
