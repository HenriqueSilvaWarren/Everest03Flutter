import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../domain/view_datas/crypto_coin_view_data.dart';
import '../datasources/api/coin_gecko/screens/crypto_coin_from_api_provider.dart';

final cryptoDropdownRightProvider = StateProvider<CryptoCoinViewData>(
  (ref) {
    return ref.watch(cryptoCoinFromApiProvider).value!.listCrypto.first;
  },
);
