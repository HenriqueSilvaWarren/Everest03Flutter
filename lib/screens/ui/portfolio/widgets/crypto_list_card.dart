import 'package:brasil_fields/brasil_fields.dart';
import 'package:card_02_listagem_crypto/screens/ui/splash/splash_screen.dart';
import '../../../../use_cases/models/crypto_coin_model.dart';
import 'package:decimal/decimal.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'animated_hide_text_value.dart';

class CryptoListCard extends HookConsumerWidget {
  const CryptoListCard({
    Key? key,
    required this.cryptoCoinModel,
  }) : super(key: key);

  final CryptoCoinModel cryptoCoinModel;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ListTile(
      onTap: () => Navigator.pushNamed(context, SplashScreen.route),
      horizontalTitleGap: 8,
      shape: const Border(
        top: BorderSide(
          color: Color.fromARGB(255, 227, 228, 235),
        ),
      ),
      leading: ClipRRect(
        borderRadius: BorderRadius.circular(100),
        child: Image.asset(
          cryptoCoinModel.imagePath,
          height: 48,
        ),
      ),
      title: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            cryptoCoinModel.abbreviation,
            style: GoogleFonts.sourceSansPro(
              fontWeight: FontWeight.w400,
              fontSize: 20,
            ),
          ),
          AnimatedHideTextValue(
            text: UtilBrasilFields.obterReal(
              Decimal.parse("${cryptoCoinModel.value}").toDouble(),
            ),
            style: GoogleFonts.sourceSansPro(
              fontSize: 20,
              fontWeight: FontWeight.w400,
            ),
          )
        ],
      ),
      subtitle: Padding(
        padding: const EdgeInsets.only(top: 4.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              cryptoCoinModel.name,
              style: GoogleFonts.sourceSansPro(
                fontWeight: FontWeight.w400,
                fontSize: 15,
              ),
            ),
            AnimatedHideTextValue(
              text:
                  "${cryptoCoinModel.cryptoAmount} ${cryptoCoinModel.abbreviation}",
              style: GoogleFonts.sourceSansPro(
                fontSize: 15,
                fontWeight: FontWeight.w400,
              ),
            ),
          ],
        ),
      ),
      trailing: Column(
        children: const [
          Padding(
            padding: EdgeInsets.only(
              top: 2,
              bottom: 6,
              left: 9,
              right: 8,
            ),
            child: Icon(
              Icons.chevron_right,
              size: 24,
              color: Color.fromARGB(255, 117, 118, 128),
            ),
          ),
        ],
      ),
    );
  }
}
