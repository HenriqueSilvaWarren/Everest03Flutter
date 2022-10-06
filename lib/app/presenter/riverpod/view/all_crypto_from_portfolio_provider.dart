import '../../../domain/view_datas/list_crypto_view_data.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final allCryptoFromPortfolioProvider = StateProvider(
  (ref) {
    return ListCryptoViewData(listCrypto: []);
  },
);
