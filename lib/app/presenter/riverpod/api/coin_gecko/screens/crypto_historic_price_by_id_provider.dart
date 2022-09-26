import 'package:card_02_listagem_crypto/app/presenter/riverpod/api/coin_gecko/usecases/get_crypto_historic_price_by_id_use_case_provider.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../../../domain/view_datas/crypto_historic_price_view_data.dart';

final cryptoHistoricPriceByIdProvider =
    FutureProvider.family<CryptoHistoricPriceViewData, String>(
  (ref, id) async {
    return ref.read(getCryptoHistoricPriceByIdUseCaseProvider).execute(id);
  },
);
