import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../../core/utils/screens_item.dart';
import '../../exchanged/exchanged_screen.dart';
import '../utils/get_exchange_rate.dart';
import 'finish_conversion_button.dart';
import 'review_text.dart';

class BodyReviewScreen extends StatelessWidget {
  const BodyReviewScreen({
    Key? key,
    required this.dataFromConversion,
  }) : super(key: key);

  final Map<String, List<String>> dataFromConversion;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: CustomScrollView(
        slivers: [
          SliverFillRemaining(
            hasScrollBody: false,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const ReviewText(),
                Column(
                  children: [
                    ScreensItem(
                      title: 'Converter',
                      value: dataFromConversion['convertingCrypto']!.join(' '),
                    ),
                    ScreensItem(
                      title: 'Receber',
                      value: dataFromConversion['receivingCrypto']!.join(' '),
                    ),
                    ScreensItem(
                      title: 'Câmbio',
                      value: getExchangeRate(
                        dataFromConversion['convertingCrypto']!,
                        dataFromConversion['receivingCrypto']!,
                      ),
                    ),
                    const FinishConversionButton(),
                  ],
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
