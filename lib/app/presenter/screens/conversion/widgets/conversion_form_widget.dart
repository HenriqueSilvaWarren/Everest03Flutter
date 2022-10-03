import '../utils/get_value_helper_text.dart';
import 'dropdown_button_right.dart';
import '../../../riverpod/datasources/local/portfolio/screen/portfolio_provider.dart';
import '../../../riverpod/view/conversion_controller_text_state_provider.dart';
import '../utils/is_valid_method.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../../domain/view_datas/crypto_coin_view_data.dart';
import '../../../riverpod/view/crypto_drop_down_left_provider.dart';
import '../utils/conversion_formatter.dart';

class ConversionFormWidget extends StatefulHookConsumerWidget {
  const ConversionFormWidget({
    Key? key,
  }) : super(key: key);

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
    controller.text = ref.read(conversionControllerTextStateProvider);
    controller.selection = TextSelection.collapsed(
        offset: ref.read(conversionControllerTextStateProvider).length);
    crypto = ref.watch(cryptoDropdownLeftProvider);

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
                autovalidateMode: AutovalidateMode.always,
                onChanged: (value) {
                  ref.read(conversionControllerTextStateProvider.state).state =
                      value;
                  setState(() {});
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
                  ConversionFormatter(crypto),
                ],
                decoration: InputDecoration(
                  helperText: getValueHelperText(
                    controller: controller,
                    crypto: crypto,
                  ),
                  hintText: '${crypto.symbol.toUpperCase()} 0,00',
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
