import '../../../riverpod/datasources/api/coin_gecko/screens/crypto_coin_based_on_portfolio_provider.dart';
import '../../../riverpod/datasources/api/coin_gecko/screens/crypto_coin_from_api_provider.dart';
import '../../../riverpod/view/conversion_controller_text_state_provider.dart';
import 'conversion_form_widget.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../../domain/view_datas/crypto_coin_view_data.dart';
import '../../../riverpod/view/crypto_drop_down_left_provider.dart';
import '../../../riverpod/view/get_crypto_state_provider.dart';
import 'dropdown_button_right.dart';

class DropdownButtonLeft extends StatefulHookConsumerWidget {
  const DropdownButtonLeft({Key? key}) : super(key: key);

  @override
  ConsumerState<DropdownButtonLeft> createState() => _DropdownButtonLeftState();
}

class _DropdownButtonLeftState extends ConsumerState<DropdownButtonLeft> {
  late CryptoCoinViewData cryptoCoinFromDetails;
  @override
  void initState() {
    super.initState();
    cryptoCoinFromDetails = ref.read(getCryptoStateProvider);
  }

  @override
  Widget build(BuildContext context) {
    List<CryptoCoinViewData> listCoins = [];

    for (CryptoCoinViewData crypto
        in ref.watch(cryptoCoinBasedOnPortfolioProvider).value!.listCrypto) {
      listCoins.add(crypto);
    }
    return SizedBox(
      height: 32,
      width: 92,
      child: DropdownButtonFormField(
        itemHeight: 48,
        selectedItemBuilder: (context) => listCoins
            .map(
              (cryptoCoin) => Row(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(100),
                    child: Image.network(
                      cryptoCoin.image,
                      width: 20,
                    ),
                  ),
                  const SizedBox(
                    width: 4,
                  ),
                  Text(
                    cryptoCoin.symbol.toUpperCase(),
                    overflow: TextOverflow.clip,
                    maxLines: 1,
                  ),
                ],
              ),
            )
            .toList(),
        elevation: 0,
        dropdownColor: Colors.transparent,
        borderRadius: BorderRadius.circular(20),
        items: listCoins
            .map(
              (CryptoCoinViewData cryptoCoin) => DropdownMenuItem(
                value: cryptoCoin,
                child: Container(
                  width: 92,
                  height: 32,
                  padding: const EdgeInsets.symmetric(horizontal: 8),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20),
                    boxShadow: const [
                      BoxShadow(
                        offset: Offset(3, 3),
                        spreadRadius: -1,
                        blurRadius: 5,
                        color: Color.fromARGB(255, 204, 204, 204),
                      )
                    ],
                  ),
                  child: Row(
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(100),
                        child: Image.network(
                          cryptoCoin.image,
                          width: 20,
                        ),
                      ),
                      const SizedBox(
                        width: 4,
                      ),
                      Text(
                        cryptoCoin.symbol.toUpperCase(),
                        overflow: TextOverflow.clip,
                        maxLines: 1,
                      ),
                    ],
                  ),
                ),
              ),
            )
            .toList(),
        onChanged: (value) {
          setState(() {
            ref.read(cryptoDropdownLeftProvider.state).state = value!;
            ref.read(cryptoDropdownRightProvider.state).state = ref
                .watch(cryptoCoinFromApiProvider)
                .value!
                .listCrypto
                .firstWhere(
                  (coin) => coin.id != ref.watch(cryptoDropdownLeftProvider).id,
                );
            ref.read(conversionControllerTextStateProvider.state).state = '';
          });
        },
        value: ref.watch(cryptoDropdownLeftProvider),
        style: GoogleFonts.sourceSansPro(
          fontSize: 14,
          color: Colors.black,
        ),
        icon: const Expanded(
          child: Icon(
            Icons.expand_more,
            color: Color.fromRGBO(117, 118, 128, 1),
            size: 17,
          ),
        ),
        decoration: InputDecoration(
          isCollapsed: true,
          isDense: true,
          contentPadding:
              const EdgeInsets.symmetric(horizontal: 8, vertical: 6),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(32),
            borderSide: const BorderSide(
              color: Color.fromRGBO(227, 228, 235, 1),
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(32),
            borderSide: const BorderSide(
              color: Color.fromRGBO(224, 43, 87, 1),
              width: 1.5,
            ),
          ),
        ),
      ),
    );
  }
}
