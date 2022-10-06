import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../domain/view_datas/crypto_coin_view_data.dart';
import 'get_crypto_state_provider.dart';

final cryptoDropdownLeftProvider = StateProvider<CryptoCoinViewData>(
  (ref) => ref.read(getCryptoStateProvider),
);
