import 'package:flutter/material.dart';

import '../../../../core/utils/custom_app_bar.dart';
import 'widgets/body_conversion_screen.dart';
import 'widgets/conversion_screen_bottom_app_bar.dart';

class ConversionScreen extends StatelessWidget {
  const ConversionScreen({
    Key? key,
    // required this.listCryptoViewData,
  }) : super(key: key);
  static String route = '/conversion-screen';
  // final ListCryptoViewData listCryptoViewData;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: const CustomAppBar(
        text: 'Converter',
        doesHide: false,
      ),
      body: const BodyConversionScreen(),
      bottomNavigationBar: ConversionScreenBottomAppBar(),
    );
  }
}
