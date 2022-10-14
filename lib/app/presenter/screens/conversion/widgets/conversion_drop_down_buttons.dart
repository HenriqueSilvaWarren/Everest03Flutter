import 'package:flutter/cupertino.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../../domain/view_datas/crypto_coin_view_data.dart';
import '../../../riverpod/view/get_crypto_state_provider.dart';
import 'dropdown_button_left.dart';
import 'dropdown_button_right.dart';

class ConversionDropDownButtons extends StatefulHookConsumerWidget {
  const ConversionDropDownButtons({Key? key}) : super(key: key);

  @override
  ConsumerState<ConversionDropDownButtons> createState() =>
      _ConversionDropDownButtonsState();
}

class _ConversionDropDownButtonsState
    extends ConsumerState<ConversionDropDownButtons> {
  late CryptoCoinViewData cryptoCoinFromDetails;

  @override
  void initState() {
    super.initState();
    cryptoCoinFromDetails = ref.read(getCryptoStateProvider);
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 19.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: const [
          Expanded(
            flex: 1,
            child: DropdownButtonLeft(),
          ),
          Expanded(
            flex: 2,
            child: Icon(
              CupertinoIcons.arrow_right_arrow_left,
              color: Color.fromRGBO(224, 43, 87, 1),
              size: 18.45,
            ),
          ),
          Expanded(
            flex: 1,
            child: DropdownButtonRight(),
          ),
        ],
      ),
    );
  }
}
