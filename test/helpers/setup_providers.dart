import 'package:card_02_listagem_crypto/app/presenter/riverpod/datasources/api/coin_gecko/screens/crypto_historic_price_by_id_provider.dart';
import 'package:card_02_listagem_crypto/app/presenter/riverpod/datasources/api/coin_gecko/usecases/get_crypto_historic_price_by_id_use_case_provider.dart';
import 'package:card_02_listagem_crypto/app/presenter/riverpod/datasources/local/portfolio/database_provider.dart';
import 'package:card_02_listagem_crypto/app/presenter/riverpod/datasources/local/portfolio/repository_provider.dart';
import 'package:card_02_listagem_crypto/app/presenter/riverpod/datasources/local/portfolio/screen/portfolio_provider.dart';
import 'package:card_02_listagem_crypto/app/presenter/riverpod/datasources/local/portfolio/usecases/get_portfolio_by_id_use_case_provider.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class SetupProviders extends ConsumerWidget {
  const SetupProviders({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.watch(portfolioDatabaseProvider);
    ref.watch(portfolioRepositoryProvider);
    ref.watch(portfolioProvider);
    ref.watch(getPortfolioByIdUseCaseProvider);
    ref.watch(cryptoHistoricPriceByIdProvider('bitcoin'));
    ref.watch(getCryptoHistoricPriceByIdUseCaseProvider);
    return const SizedBox.shrink();
  }
}
