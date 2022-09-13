import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../../shared/app_assets.dart';
import 'crypto_list_card.dart';
import 'total_currency_card.dart';

class BodyWalletScreen extends StatefulHookConsumerWidget {
  const BodyWalletScreen({
    Key? key,
  }) : super(key: key);

  @override
  ConsumerState<BodyWalletScreen> createState() => _BodyWalletScreenState();
}

class _BodyWalletScreenState extends ConsumerState<BodyWalletScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        children: [
          const TotalCurrencyCard(),
          Expanded(
            child: ListView(
              physics: const BouncingScrollPhysics(),
              children: [
                CryptoListCard(
                  shortName: "BTC",
                  longName: "Bitcoin",
                  imagePath: bitcoinImage,
                  totalCurrencyOfCrypto: 6557,
                  totalAmountOfCrypto: 0.65,
                ),
                CryptoListCard(
                  shortName: "ETH",
                  longName: "Ethereum",
                  imagePath: ethereumImage,
                  totalCurrencyOfCrypto: 7996,
                  totalAmountOfCrypto: 0.94,
                ),
                CryptoListCard(
                  shortName: "LTC",
                  longName: "Litcoin",
                  imagePath: litecoinImage,
                  totalCurrencyOfCrypto: 245,
                  totalAmountOfCrypto: 0.82,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

