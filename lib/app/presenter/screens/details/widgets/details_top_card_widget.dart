import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../riverpod/datasources/api/coin_gecko/screens/crypto_coin_based_on_portfolio_provider.dart';
import '../../../riverpod/datasources/local/portfolio/screen/portfolio_provider.dart';
import '../../../riverpod/view/get_crypto_state_provider.dart';

class DetailsTopCardWidget extends HookConsumerWidget {
  const DetailsTopCardWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final cryptoCoin = ref.read(getCryptoStateProvider);

    return ref.read(portfolioProvider).when(
      data: (portfolio) {
        return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Text(
                    cryptoCoin.name,
                    style: GoogleFonts.sourceSansPro(
                        fontWeight: FontWeight.w700, fontSize: 32),
                  ),
                  IconButton(
                    icon: const Icon(Icons.refresh),
                    onPressed: () {
                      ref.refresh(
                        cryptoCoinBasedOnPortfolioProvider,
                      );
                    },
                  ),
                ],
              ),
              ClipRRect(
                borderRadius: BorderRadius.circular(100),
                child: Image.network(
                  cryptoCoin.image,
                  height: 48,
                ),
              ),
            ],
          ),
          Text(
            cryptoCoin.symbol.toUpperCase(),
            style: GoogleFonts.sourceSansPro(color: Colors.grey, fontSize: 18),
          ),
        ]);
      },
      error: (error, stackTrace) {
        return const SizedBox.shrink();
      },
      loading: () {
        return const SizedBox.shrink();
      },
    );
  }
}
