import 'package:decimal/decimal.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../domain/view_datas/crypto_coin_view_data.dart';

final cryptoDropdownRightProvider = StateProvider<CryptoCoinViewData>(
  (ref) {
    return CryptoCoinViewData(
      id: '',
      symbol: '',
      name: '',
      image: '',
      currentPrice: Decimal.zero,
      priceChangePercentage24h: Decimal.zero,
    );
  },
);
