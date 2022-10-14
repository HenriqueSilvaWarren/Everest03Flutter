import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../../domain/view_datas/crypto_coin_view_data.dart';
import '../../../riverpod/datasources/api/coin_gecko/screens/crypto_coin_from_api_provider.dart';
import '../../../riverpod/view/crypto_drop_down_right_provider.dart';

class DropdownButtonRight extends HookConsumerWidget {
  const DropdownButtonRight({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    List<CryptoCoinViewData> listCoins = [];

    for (CryptoCoinViewData crypto
        in ref.watch(cryptoCoinFromApiProvider).value!.listCrypto) {
      listCoins.add(crypto);
    }

    return SizedBox(
      height: 32,
      width: 92,
      child: DropdownButtonFormField(
        elevation: 0,
        dropdownColor: Colors.transparent,
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
        value: ref.watch(cryptoDropdownRightProvider),
        borderRadius: BorderRadius.circular(20),
        itemHeight: 48,
        hint: const Text('Selecione'),
        items: listCoins.map(
          (CryptoCoinViewData cryptoCoin) {
            return DropdownMenuItem(
              value: cryptoCoin,
              child: Container(
                margin: const EdgeInsets.only(left: 5, bottom: 3),
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
            );
          },
        ).toList(),
        onChanged: (value) {
          ref.read(cryptoDropdownRightProvider.state).state = value!;
        },
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
          contentPadding: const EdgeInsets.symmetric(horizontal: 8),
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
