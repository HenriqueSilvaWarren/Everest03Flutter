import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../core/utils/hide_values_button.dart';
import '../../../use_cases/models/coin_in_portfolio_model.dart';
import '../../../use_cases/models/crypto_coin_model.dart';
import '../../riverpod/get_price_from_chart.dart';
import '../../riverpod/portfolio.dart';
import 'widgets/body_details_screen.dart';
import 'widgets/details_app_bar.dart';

class DetailsScreen extends StatefulHookConsumerWidget {
  const DetailsScreen({Key? key}) : super(key: key);

  static String route = '/details-screen';

  @override
  ConsumerState<DetailsScreen> createState() => _DetailsScreenState();
}

class _DetailsScreenState extends ConsumerState<DetailsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const DetailsAppBar(),
      body: BodyDetailsScreen(),
    );
  }
}
