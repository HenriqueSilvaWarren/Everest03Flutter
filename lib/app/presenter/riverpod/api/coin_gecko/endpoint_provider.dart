import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../../infra/data_sources/endpoints/crypto_coin_end_point.dart';
import '../dio_provider.dart';

final cryptoCoinEndPointProvider = Provider(
  (ref) {
    final dio = ref.read(dioProvider);
    return CryptoCoinEndPoint(dio);
  },
);
