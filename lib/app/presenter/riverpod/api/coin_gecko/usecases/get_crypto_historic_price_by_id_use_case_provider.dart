import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../../../domain/use_cases/get_crypto_historic_price_by_id_usecase/get_crypto_historic_price_by_id_usecase_imp.dart';
import '../repository_provider.dart';

final getCryptoHistoricPriceByIdUseCaseProvider = Provider(
  (ref) {
    final repository = ref.read(cryptoCoinRepositoryProvider);
    return GetCryptoHistoricPriceByIdUsecaseImp(repository);
  },
);
