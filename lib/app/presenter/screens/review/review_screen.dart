import 'package:flutter/material.dart';

import '../../../../core/utils/custom_app_bar.dart';
import 'widgets/body_review_screen.dart';

class ReviewScreen extends StatelessWidget {
  const ReviewScreen({
    Key? key,
  }) : super(key: key);

  static String route = '/review-screen';

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: CustomAppBar(
        text: 'Revisar',
        doesHide: false,
      ),
      body: BodyReviewScreen(),
    );
  }
}
