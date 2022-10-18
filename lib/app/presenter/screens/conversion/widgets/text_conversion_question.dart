import '../../../../../l10n/app_localizations.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TextConversionQuestion extends StatelessWidget {
  const TextConversionQuestion({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        left: 16.0,
        bottom: 16.0,
        right: 18.0,
        top: 8.0,
      ),
      child: Text(
        CryptoAppStrings.of(context)!.conversionExchangeText,
        style: GoogleFonts.sourceSansPro(
          fontSize: 34,
          fontWeight: FontWeight.w700,
        ),
      ),
    );
  }
}

