import '../../../riverpod/view/conversion_data_state_provider.dart';
import '../utils/get_conversion_data.dart';
import '../../review/review_screen.dart';

import '../../../riverpod/datasources/local/portfolio/screen/portfolio_provider.dart';
import '../../../riverpod/view/conversion_controller_text_state_provider.dart';
import '../utils/exchanged_currency.dart';
import 'dropdown_button_right.dart';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../riverpod/view/crypto_drop_down_left_provider.dart';
import '../utils/is_valid_method.dart';

// ignore: must_be_immutable
class ConversionScreenBottomAppBar extends HookConsumerWidget {
  const ConversionScreenBottomAppBar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final controllerText = ref.watch(conversionControllerTextStateProvider);
    final cryptoLeft = ref.watch(cryptoDropdownLeftProvider);
    final cryptoRight = ref.watch(cryptoDropdownRightProvider);
    final isValidBool = isValid(
      ref.watch(portfolioProvider).value!,
      text: controllerText,
      cryptoLeft: cryptoLeft,
      cryptoRight: cryptoRight,
    );
    return BottomAppBar(
      elevation: 0,
      color: Colors.white,
      child: Container(
        decoration: const BoxDecoration(
          border: Border(
            top: BorderSide(
              color: Color.fromRGBO(227, 228, 235, 1),
            ),
          ),
        ),
        padding: const EdgeInsets.symmetric(
          horizontal: 16,
          vertical: 12,
        ),
        height: 80,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 2.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Total Estimado',
                    style: GoogleFonts.sourceSansPro(
                      fontSize: 15,
                      fontWeight: FontWeight.w400,
                      color: const Color.fromRGBO(117, 118, 128, 1),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 4.0),
                    child: Text(
                      exchangedCurrency(
                        controllerText: controllerText,
                        cryptoLeft: cryptoLeft,
                        cryptoRight: cryptoRight,
                      ),
                      style: GoogleFonts.sourceSansPro(
                        fontSize: 19,
                        fontWeight: FontWeight.w700,
                        color: const Color.fromRGBO(47, 47, 51, 1),
                      ),
                    ),
                  )
                ],
              ),
            ),
            FloatingActionButton(
              elevation: 0,
              shape: const CircleBorder(),
              foregroundColor: Colors.white,
              disabledElevation: 0,
              backgroundColor: isValidBool
                  ? const Color.fromRGBO(224, 43, 87, 1)
                  : Colors.grey,
              onPressed: isValidBool
                  ? () {
                      ref.read(conversionDataStateProvider.state).state =
                          getConversionData(
                        controllerText,
                        exchangedCurrency(
                          controllerText: controllerText,
                          cryptoLeft: cryptoLeft,
                          cryptoRight: cryptoRight,
                        ),
                      );
                      Navigator.of(context).pushNamed(
                        ReviewScreen.route,
                      );
                    }
                  : null,
              child: Container(
                height: 50,
                width: 50,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(100),
                ),
                child: const Icon(
                  Icons.arrow_forward,
                  size: 20,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
