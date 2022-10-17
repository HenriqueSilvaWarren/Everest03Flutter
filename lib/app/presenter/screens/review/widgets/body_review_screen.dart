import 'package:card_02_listagem_crypto/l10n/app_localizations.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../../../core/utils/screens_item.dart';
import '../../../riverpod/view/conversion_data_state_provider.dart';
import '../utils/get_exchange_rate.dart';
import 'finish_conversion_button.dart';
import 'review_text.dart';

class BodyReviewScreen extends HookConsumerWidget {
  const BodyReviewScreen({
    Key? key,
  }) : super(key: key); // coverage:ignore-line

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
                      title: CryptoAppStrings.of(context)!.convert,
                      value: dataFromConversion['convertingCrypto']!.join(' '),
                    ),
                    ScreensItem(
                      title: CryptoAppStrings.of(context)!.get,
                      value: dataFromConversion['receivingCrypto']!.join(' '),
                    ),
                    ScreensItem(
                      title: CryptoAppStrings.of(context)!.exchange,
                      value: getExchangeRate(
                        dataFromConversion['convertingCrypto']!,
                        dataFromConversion['receivingCrypto']!,
                        ref,
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
