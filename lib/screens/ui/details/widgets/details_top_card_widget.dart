import 'package:card_02_listagem_crypto/screens/riverpod/get_crypto_model_for_details_screen.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../../use_cases/models/crypto_coin_model.dart';

class DetailsTopCardWidget extends HookConsumerWidget {
  const DetailsTopCardWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final CryptoCoinModel cryptoCoin =
        ref.watch(getCryptoModelForDetailsScreen);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              cryptoCoin.name,
              style: GoogleFonts.sourceSansPro(
                  fontWeight: FontWeight.w700, fontSize: 32),
            ),
            ClipRRect(
              borderRadius: BorderRadius.circular(100),
              child: Image.network(
                cryptoCoin.imagePath,
                height: 48,
              ),
            ),
          ],
        ),
        Text(
          cryptoCoin.symbol,
          style: GoogleFonts.sourceSansPro(color: Colors.grey, fontSize: 18),
        ),
      ],
    );
  }
}
