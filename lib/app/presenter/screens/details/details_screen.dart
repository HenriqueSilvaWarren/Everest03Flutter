import 'package:flutter/material.dart';

import 'widgets/body_details_screen.dart';
import '../../../../core/utils/custom_app_bar.dart';

class DetailsScreen extends StatelessWidget {
  const DetailsScreen({Key? key}) : super(key: key);

  static String route = '/details-screen';

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Colors.white,
      appBar: CustomAppBar(
        text: 'Detalhes',
        doesHide: true,
      ),
      body: BodyDetailsScreen(),
    );
  }
}
