import 'package:card_02_listagem_crypto/l10n/app_localizations.dart';
import 'package:flutter/material.dart';

import '../../../../core/utils/custom_app_bar.dart';
import 'widgets/body_conversion_screen.dart';
import 'widgets/conversion_screen_bottom_app_bar.dart';

class ConversionScreen extends StatelessWidget {
  const ConversionScreen({
    Key? key,
  }) : super(key: key); // coverage:ignore-line

  static String route = '/conversion-screen';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomSheet: const ConversionScreenBottomAppBar(
        key: Key('conversionBottomBar'),
      ),
      resizeToAvoidBottomInset: true,
      backgroundColor: Colors.white,
      appBar: CustomAppBar(
        text: CryptoAppStrings.of(context)!.convert,
        doesHide: false,
      ),
      body: const BodyConversionScreen(),
    );
  }
}
