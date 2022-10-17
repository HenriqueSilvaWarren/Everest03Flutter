import 'package:card_02_listagem_crypto/l10n/app_localizations.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'conversion_animation.dart';

class BodyExchangedScreen extends StatefulWidget {
  const BodyExchangedScreen({
    Key? key,
  }) : super(key: key); // coverage:ignore-line

  @override
  State<BodyExchangedScreen> createState() => _BodyExchangedScreenState();
}

class _BodyExchangedScreenState extends State<BodyExchangedScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      duration: const Duration(seconds: 5),
      vsync: this,
    )..repeat();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ConversionAnimation(controller: _animationController),
          Text(
            CryptoAppStrings.of(context)!.conversion,
            style: GoogleFonts.sourceSansPro(
              fontSize: 34,
              fontWeight: FontWeight.w700,
            ),
          ),
          Text(
            CryptoAppStrings.of(context)!.conversionSuccess,
            style: GoogleFonts.sourceSansPro(
                fontSize: 17,
                fontWeight: FontWeight.w400,
                color: const Color.fromRGBO(117, 118, 128, 1)),
          ),
        ],
      ),
    );
  }
}
