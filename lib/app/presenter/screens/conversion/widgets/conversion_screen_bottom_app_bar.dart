import '../../../riverpod/datasources/local/portfolio/screen/portfolio_provider.dart';
import 'dropdown_button_right.dart';
import 'package:decimal/decimal.dart';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../../domain/view_datas/crypto_coin_view_data.dart';
import '../../../riverpod/view/crypto_drop_down_left_provider.dart';
import '../utils/is_valid_method.dart';
import 'conversion_form_widget.dart';

// ignore: must_be_immutable
class ConversionScreenBottomAppBar extends HookConsumerWidget {
  ConversionScreenBottomAppBar({
    Key? key,
  }) : super(key: key);

  late CryptoCoinViewData cryptoLeft;
  late CryptoCoinViewData cryptoRight;
  late String controllerText;
  late bool isValidBool;
  String exchangedCurrency() {
    // if (cryptoRight) {
    //   return 'Moeda não selecionada';
    // }
    if (controllerText.isEmpty ||
        controllerText == '${cryptoLeft.symbol.toUpperCase()} ') {
      return 'Valor não informado';
    }
    String quantity = controllerText.split(' ')[1];
    quantity = quantity.replaceAll(',', '.');
    Decimal decimalQuantity = Decimal.parse(quantity);
    Decimal decimalValue = decimalQuantity * cryptoLeft.currentPrice;
    Decimal actualAmount = (decimalValue / cryptoRight.currentPrice).toDecimal(
      scaleOnInfinitePrecision: 8,
      toBigInt: (p0) => p0.toBigInt(),
    );
    String symbol = cryptoRight.symbol.toUpperCase();
    return '$actualAmount $symbol';
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    controllerText = ref.watch(conversionControllerTextStateProvider);
    cryptoLeft = ref.watch(cryptoDropdownLeftProvider);
    cryptoRight = ref.watch(cryptoDropdownRightProvider);
    isValidBool = isValid(
      ref.watch(portfolioProvider).value!,
      text: controllerText,
      cryptoLeft: cryptoLeft,
      cryptoRight: cryptoRight
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
                      exchangedCurrency(),
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
            MaterialButton(
              shape: const CircleBorder(),
              color: const Color.fromRGBO(224, 43, 87, 1),
              disabledColor: const Color.fromRGBO(201, 202, 212, 1),
              onPressed: isValidBool ? () {} : null,
              child: Container(
                height: 50,
                width: 50,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(100),
                ),
                child: const Icon(
                  Icons.arrow_forward,
                  color: Colors.white,
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
