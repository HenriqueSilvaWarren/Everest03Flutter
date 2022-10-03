import 'package:card_02_listagem_crypto/app/presenter/screens/conversion/widgets/conversion_screen_bottom_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../../../core/utils/screens_item.dart';

import '../utils/get_exchange_rate.dart';
import 'finish_conversion_button.dart';
import 'review_text.dart';

class BodyReviewScreen extends HookConsumerWidget {
  const BodyReviewScreen({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final dataFromConversion = ref.watch(conversionDataStateProvider)!;
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
