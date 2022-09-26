import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../../infra/repositories/crypto_coin_repository_imp.dart';
import 'endpoint_provider.dart';

final cryptoCoinRepositoryProvider = Provider(
  (ref) {
    final datasource = ref.read(cryptoCoinEndPointProvider);
    return CryptoCoinRepositoryImp(datasource);
  },
);
