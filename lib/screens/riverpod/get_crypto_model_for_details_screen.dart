import 'package:card_02_listagem_crypto/use_cases/models/crypto_coin_model.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final getCryptoModelForDetailsScreen = StateProvider(
  (ref) => CryptoCoinModel(
    symbol: '',
    name: '',
    imagePath: '',
    prices: {},
  ),
);
