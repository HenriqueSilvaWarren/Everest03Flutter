import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';


import '../../../../domain/view_datas/crypto_coin_view_data.dart';
import '../../../riverpod/api/coin_gecko/screens/crypto_coin_based_on_portfolio_provider.dart';
import '../../../riverpod/view/get_crypto_id_state_provider.dart';

class DetailsTopCardWidget extends HookConsumerWidget {
  const DetailsTopCardWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
   final AsyncValue<CryptoCoinViewData> cryptoCoin = ref
        .read(cryptoCoinBasedOnPortfolioProvider)
        .whenData(
          (value) => value.listCrypto.firstWhere(
            (element) =>
                element.id == ref.read(getCryptoIdStateProvider.state).state,
          ),
        );
    return cryptoCoin.when(data: (cryptoCoin) => Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              cryptoCoin.name,
              style: GoogleFonts.sourceSansPro(
                  fontWeight: FontWeight.w700, fontSize: 32),
            ),
            ClipRRect(
              borderRadius: BorderRadius.circular(100),
              child: Image.network(
                cryptoCoin.image,
                height: 48,
              ),
            ),
          ],
        ),
        Text(
          cryptoCoin.symbol,
          style: GoogleFonts.sourceSansPro(color: Colors.grey, fontSize: 18),
        ),
      ],
    ), error: (error, stackTrace) => const Text('Deu Erro'), loading: () => const Text('Carregando...'),);
  }
}
