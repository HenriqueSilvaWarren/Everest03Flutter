import 'package:decimal/decimal.dart';

import '../../core/app_assets.dart';
import '../../use_cases/models/crypto_coin_model.dart';

class GetAllCryptoCoinDatabase {
  List<CryptoCoinModel> getAllCryptoCoin() {
    return [
      CryptoCoinModel(
        abbreviation: 'BTC',
        name: "Bitcoin",
        imagePath: bitcoinImage,
        value: Decimal.fromInt(6557),
        cryptoAmount: Decimal.parse("0.65"),
      ),
      CryptoCoinModel(
        abbreviation: 'ETH',
        name: "Ethereum",
        imagePath: ethereumImage,
        value: Decimal.fromInt(7996),
        cryptoAmount: Decimal.parse("0.94"),
      ),
      CryptoCoinModel(
        abbreviation: 'LTC',
        name: "Litecoin",
        imagePath: litecoinImage,
        value: Decimal.fromInt(245),
        cryptoAmount: Decimal.parse("0.82"),
      ),
    ];
  }
}
