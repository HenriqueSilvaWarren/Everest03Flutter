
import 'package:card_02_listagem_crypto/l10n/app_localizations.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../riverpod/datasources/local/portfolio/screen/portfolio_provider.dart';
import '../../../riverpod/view/crypto_drop_down_left_provider.dart';
import '../../../riverpod/view/locale_state_provider.dart';

class HeaderConversionScreen extends HookConsumerWidget {
  const HeaderConversionScreen({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final cryptoFromLeftDropdown = ref.watch(cryptoDropdownLeftProvider);
    return Container(
      height: 49,
      width: MediaQuery.of(context).size.width,
      decoration: const BoxDecoration(
        color: Color.fromRGBO(245, 246, 250, 1),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              CryptoAppStrings.of(context)!.balance,
              style: GoogleFonts.sourceSansPro(
                fontSize: 15,
                fontWeight: FontWeight.w400,
                color: const Color.fromRGBO(117, 118, 128, 1),
              ),
            ),
            ref.watch(portfolioProvider).when(
              data: (portfolio) {
                final quantity = portfolio.coins
                    .firstWhere(
                      (coin) =>
                          coin.symbol.toUpperCase() ==
                          cryptoFromLeftDropdown.symbol.toUpperCase(),
                    )
                    .quantity;
                return Text(
                  '${ref.watch(localeStateProvider) == const Locale('en','US') ? quantity : quantity.toString().replaceAll('.', ',')} ${cryptoFromLeftDropdown.symbol.toUpperCase()} ',
                  style: GoogleFonts.sourceSansPro(
                    fontSize: 15,
                    fontWeight: FontWeight.w400,
                  ),
                );
              },
              error: (error, stackTrace) {
                return const SizedBox.shrink();
              },
              loading: () {
                return const SizedBox.shrink();
              },
            ),
          ],
        ),
      ),
    );
  }
}
