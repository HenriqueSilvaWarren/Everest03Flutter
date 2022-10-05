import 'package:flutter/material.dart';

import 'header_transactions_screen.dart';
import 'list_view_transactions.dart';

class BodyTransactionsScreen extends StatelessWidget {
  const BodyTransactionsScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: const [
            HeaderTransactionsScreen(),
            ListViewTransactions(),
          ],
        ),
      ),
    );
  }
}
