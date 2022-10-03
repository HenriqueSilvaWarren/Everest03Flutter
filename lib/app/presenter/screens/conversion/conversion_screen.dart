import 'package:flutter/material.dart';

import '../../../../core/utils/custom_app_bar.dart';
import 'widgets/body_conversion_screen.dart';
import 'widgets/conversion_screen_bottom_app_bar.dart';

class ConversionScreen extends StatelessWidget {
  const ConversionScreen({
    Key? key,
  }) : super(key: key);

  static String route = '/conversion-screen';

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      bottomSheet: ConversionScreenBottomAppBar(),
      resizeToAvoidBottomInset: true,
      backgroundColor: Colors.white,
      appBar: CustomAppBar(
        text: 'Converter',
        doesHide: false,
      ),
      body: BodyConversionScreen(),
    );
  }
}
