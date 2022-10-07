import 'package:card_02_listagem_crypto/app/presenter/riverpod/view/get_currency_state_provider.dart';
import 'package:card_02_listagem_crypto/app/presenter/riverpod/view/locale_state_provider.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../../../../domain/view_datas/crypto_historic_price_view_data.dart';
import '../usecases/get_crypto_historic_price_by_id_use_case_provider.dart';

final cryptoHistoricPriceByIdProvider =
    FutureProvider.family<CryptoHistoricPriceViewData, String>(
  (ref, id) async {
    return ref.read(getCryptoHistoricPriceByIdUseCaseProvider).execute(
          id,
          ref.watch(getCurrencyStateProvider),
        );
  },
);
