import 'package:card_02_listagem_crypto/l10n/app_localizations.dart';
import 'package:flutter/material.dart';

import '../../../../core/utils/custom_app_bar.dart';
import 'widgets/body_details_screen.dart';

class DetailsScreen extends StatelessWidget {
  const DetailsScreen({Key? key}) : super(key: key);

  static String route = '/details-screen';

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor: Colors.white,
      appBar: CustomAppBar(
        text: CryptoAppStrings.of(context)!.details,
        doesHide: true,
      ),
      body: const BodyDetailsScreen(),
    );
  }
}
