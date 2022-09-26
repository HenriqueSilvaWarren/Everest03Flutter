import '../usecases/get_crypto_historic_price_by_id_use_case_provider.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../../../../domain/view_datas/crypto_historic_price_view_data.dart';

final cryptoHistoricPriceByIdProvider =
    FutureProvider.family<CryptoHistoricPriceViewData, String>(
  (ref, id) async {
    return ref.read(getCryptoHistoricPriceByIdUseCaseProvider).execute(id);
  },
);
