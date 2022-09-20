import '../../core/app_assets.dart';
import '../../use_cases/models/crypto_coin_model.dart';

class GetAllCryptoCoinDatabase {
  List<CryptoCoinModel> getAllCryptoCoin() {
    return [
      CryptoCoinModel(
        abbreviation: 'BTC',
        name: "Bitcoin",
        imagePath: bitcoinImage,
        prices: {},
      ),
      CryptoCoinModel(
        abbreviation: 'ETH',
        name: "Ethereum",
        imagePath: ethereumImage,
        prices: {},
      ),
      CryptoCoinModel(
        abbreviation: 'LTC',
        name: "Litecoin",
        imagePath: litecoinImage,
        prices: {},
      ),
    ];
  }
}
