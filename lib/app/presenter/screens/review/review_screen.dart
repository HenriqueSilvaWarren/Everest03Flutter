import '../../riverpod/datasources/local/transactions/screen/transactions_provider.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../../core/utils/custom_app_bar.dart';
import 'widgets/body_review_screen.dart';

class ReviewScreen extends HookConsumerWidget {
  const ReviewScreen({
    Key? key,
  }) : super(key: key);

  static String route = '/review-screen';

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.watch(transactionsProvider).whenData((value) => value);
    return const Scaffold(
      appBar: CustomAppBar(
        text: 'Revisar',
        doesHide: false,
      ),
      body: BodyReviewScreen(),
    );
  }
}
