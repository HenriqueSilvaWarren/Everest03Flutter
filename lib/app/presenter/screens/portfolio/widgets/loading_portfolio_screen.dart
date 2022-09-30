import 'package:flutter/material.dart';

import 'loading_crypto_list.dart';
import 'loading_portfolio_top_card.dart';

class LoadingPortfolioScreen extends StatelessWidget {
  const LoadingPortfolioScreen({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: const [
        LoadingPortfolioTopCard(),
        LoadingCryptoList(),
      ],
    );
  }
}
