import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../riverpod/datasources/api/coin_gecko/screens/crypto_coin_based_on_portfolio_provider.dart';
import '../../../riverpod/view/get_crypto_state_provider.dart';

class DetailsTopCardWidget extends HookConsumerWidget {
  const DetailsTopCardWidget({
    Key? key,
  }) : super(key: key); // coverage:ignore-line

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final cryptoCoin = ref.read(getCryptoStateProvider);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Text(
                  cryptoCoin!.name,
                  style: GoogleFonts.sourceSansPro(
                      fontWeight: FontWeight.w700, fontSize: 32),
                ),
                IconButton(
                  key: const Key('refreshButton'),
                  icon: const Icon(Icons.refresh),
                  onPressed: () async {
                    ref.refresh(
                      cryptoCoinBasedOnPortfolioProvider,
                    );
                    // ref.read(getCryptoStateProvider.state).state = ref
                    //     .watch(cryptoCoinBasedOnPortfolioProvider)
                    //     .value!
                    //     .listCrypto
                    //     .firstWhere(
                    //       (element) => cryptoCoin.id == element.id,
                    //     );
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
      ],
    );
  }
}
