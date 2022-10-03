import 'package:card_02_listagem_crypto/app/presenter/screens/exchanged/exchanged_screen.dart';
import 'package:card_02_listagem_crypto/core/utils/screens_item.dart';
import 'package:decimal/decimal.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../core/utils/custom_app_bar.dart';
import 'utils/get_exchange_rate.dart';
import 'widgets/body_review_screen.dart';
import 'widgets/review_text.dart';

class ReviewScreen extends StatelessWidget {
  const ReviewScreen({
    Key? key,
    required this.dataFromConversion,
  }) : super(key: key);

  final Map<String, List<String>> dataFromConversion;
  static String route = '/review-screen';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      appBar: const CustomAppBar(
        text: 'Revisar',
        doesHide: false,
      ),
      body: BodyReviewScreen(dataFromConversion: dataFromConversion),
    );
  }
}
