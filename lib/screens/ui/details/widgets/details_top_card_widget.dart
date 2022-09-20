import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../use_cases/models/crypto_coin_model.dart';

class DetailsTopCardWidget extends StatelessWidget {
  const DetailsTopCardWidget({
    Key? key,
    required this.cryptoCoin,
  }) : super(key: key);

  final CryptoCoinModel cryptoCoin;

  @override
  Widget build(BuildContext context) {
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
          cryptoCoin.abbreviation,
          style:
              GoogleFonts.sourceSansPro(color: Colors.grey, fontSize: 18),
        ),
      ],
    );
  }
}
