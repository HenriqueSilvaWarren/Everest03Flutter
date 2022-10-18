import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:intl/intl.dart';

import '../../../../../core/utils/get_value_helper_text.dart';
import '../../../../../l10n/app_localizations.dart';
import '../../../../domain/view_datas/crypto_coin_view_data.dart';
import '../../../riverpod/datasources/local/portfolio/screen/portfolio_provider.dart';
import '../../../riverpod/view/conversion_controller_text_state_provider.dart';
import '../../../riverpod/view/crypto_drop_down_left_provider.dart';
import '../../../riverpod/view/crypto_drop_down_right_provider.dart';
import '../utils/conversion_formatter.dart';
import '../utils/is_valid_method.dart';

class ConversionFormWidget extends StatefulHookConsumerWidget {
  const ConversionFormWidget({
    Key? key,
  }) : super(key: key); // coverage:ignore-line

  @override
  ConsumerState<ConversionFormWidget> createState() {
    return _ConversionFormWidgetState();
  }
}

class _ConversionFormWidgetState extends ConsumerState<ConversionFormWidget> {
  TextEditingController controller = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  late CryptoCoinViewData crypto;

  @override
  Widget build(BuildContext context) {
    controller.text = ref.watch(conversionControllerTextStateProvider);
    controller.selection = TextSelection.collapsed(
      offset: ref.read(conversionControllerTextStateProvider).length,
    );
    crypto = ref.watch(cryptoDropdownLeftProvider)!;

    final currencyFormatter = NumberFormat.currency(
      locale: CryptoAppStrings.of(context)!.language,
      symbol: CryptoAppStrings.of(context)!.currencySymbol,
    );

    return Padding(
      padding: const EdgeInsets.only(
        left: 23.5,
        right: 23.5,
        top: 16,
      ),
      child: FormField(
        key: _formKey,
        builder: (field) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextFormField(
                key: const Key('conversionTextField'),
                autovalidateMode: AutovalidateMode.always,
                onChanged: (value) {
                  ref.read(conversionControllerTextStateProvider.state).state =
                      value;
                },
                onTap: () {
                  if (controller.text.isEmpty) {
                    controller.text = '${crypto.symbol.toUpperCase()} ';
                  }
                },
                validator: (value) {
                  return isValid(
                    ref.watch(portfolioProvider).value!,
                    text: value,
                    cryptoLeft: crypto,
                    cryptoRight: ref.watch(cryptoDropdownRightProvider),
                    isCalledFromTextField: true,
                    context: context,
                  );
                },
                onFieldSubmitted: (value) {
                  if (value.length == crypto.symbol.length + 1) {
                    controller.clear();
                    ref
                        .read(conversionControllerTextStateProvider.state)
                        .state = '';
                  }
                  setState(() {});
                },
                controller: controller,
                keyboardType: const TextInputType.numberWithOptions(
                  decimal: true,
                ),
                inputFormatters: [
                  ConversionFormatter(crypto, ref),
                ],
                decoration: InputDecoration(
                  helperText: currencyFormatter.format(
                    getValueHelperText(
                      controllerText: controller.text,
                      crypto: crypto,
                    ),
                  ),
                  hintText:
                      '${crypto.symbol.toUpperCase()} ${CryptoAppStrings.of(context)!.conversionHintText}',
                ),
                style: const TextStyle(),
              ),
              const SizedBox(
                height: 8,
              ),
            ],
          );
        },
      ),
    );
  }
}
