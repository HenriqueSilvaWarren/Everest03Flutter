import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../../../l10n/app_localizations.dart';
import '../../../riverpod/datasources/api/coin_gecko/screens/crypto_coin_based_on_portfolio_provider.dart';
import '../../../riverpod/view/get_currency_state_provider.dart';
import '../../../riverpod/view/locale_state_provider.dart';

class ChangeLanguageButton extends ConsumerWidget {
  const ChangeLanguageButton({
    Key? key,
  }) : super(key: key); // coverage:ignore-line

  @override
  Widget build(BuildContext context, WidgetRef ref) {

    return InkWell(
      onTap: () {
        switch (CryptoAppStrings.of(context)!.language) {
          case 'pt-BR':
            ref.read(localeStateProvider.state).state =
                const Locale('en', 'US');
            ref.read(getCurrencyStateProvider.state).state = 'usd';
            break;
          default:
            ref.read(localeStateProvider.state).state =
                const Locale('pt', 'BR');
            ref.read(getCurrencyStateProvider.state).state = 'brl';
            break;
        }
        ref.refresh(cryptoCoinBasedOnPortfolioProvider);
      },
    );
  }
}
