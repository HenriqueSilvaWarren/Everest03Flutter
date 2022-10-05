import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:shimmer/shimmer.dart';

import '../../../../domain/view_datas/list_crypto_view_data.dart';
import '../../../riverpod/datasources/api/coin_gecko/screens/crypto_coin_from_api_provider.dart';
import '../../../riverpod/view/conversion_controller_text_state_provider.dart';
import '../../../riverpod/view/crypto_drop_down_left_provider.dart';
import '../../../riverpod/view/get_crypto_state_provider.dart';
import '../../conversion/conversion_screen.dart';
import '../../conversion/widgets/dropdown_button_right.dart';

final cryptoListFromApiProvider = StateProvider(
  (ref) => ListCryptoViewData(listCrypto: []),
);

class ButtonConvertCurrency extends HookConsumerWidget {
  const ButtonConvertCurrency({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ref.watch(cryptoCoinFromApiProvider).when(
          data: (listCryptoViewData) => Padding(
            padding: const EdgeInsets.only(top: 20.0),
            child: MaterialButton(
              elevation: 0,
              highlightElevation: 0,
              color: const Color.fromRGBO(238, 46, 93, 1),
              padding: EdgeInsets.zero,
              onPressed: () {
                ref.read(cryptoDropdownLeftProvider.state).state =
                    ref.read(getCryptoStateProvider);
                ref.read(cryptoDropdownRightProvider.state).state = ref
                    .watch(cryptoCoinFromApiProvider)
                    .value!
                    .listCrypto
                    .firstWhere(
                      (coin) =>
                          coin.id != ref.watch(cryptoDropdownLeftProvider).id,
                    );
                ref.read(conversionControllerTextStateProvider.state).state =
                    '';
                Navigator.of(context).pushNamed(
                  ConversionScreen.route,
                );
              },
              child: Container(
                alignment: Alignment.center,
                width: MediaQuery.of(context).size.width,
                height: 56,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Text(
                  "Converter moeda",
                  style: GoogleFonts.sourceSansPro(
                    fontSize: 20,
                    fontWeight: FontWeight.w700,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ),
          error: (error, stackTrace) => Text('$error'),
          loading: () => Padding(
            padding: const EdgeInsets.only(top: 20.0),
            child: Shimmer.fromColors(
              baseColor: Colors.grey.shade300,
              highlightColor: Colors.grey.shade200,
              child: Container(
                alignment: Alignment.center,
                height: 56,
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  color: const Color.fromRGBO(238, 46, 93, 1),
                ),
                child: Text(
                  "Converter Moeda",
                  style: GoogleFonts.sourceSansPro(
                    fontSize: 20,
                    fontWeight: FontWeight.w700,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ),
        );
  }
}
