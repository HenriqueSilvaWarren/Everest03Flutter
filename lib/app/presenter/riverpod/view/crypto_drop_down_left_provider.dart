import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../domain/view_datas/crypto_coin_view_data.dart';

final cryptoDropdownLeftProvider = StateProvider<CryptoCoinViewData?>(
  (ref) => null, 
);
