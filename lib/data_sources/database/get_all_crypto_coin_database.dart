import '../../core/app_assets.dart';
import '../../use_cases/models/crypto_coin_model.dart';

class GetAllCryptoCoinDatabase {
  List<CryptoCoinModel> getAllCryptoCoin() {
    return [
      CryptoCoinModel(
        symbol: 'BTC',
        name: "Bitcoin",
        imagePath: bitcoinImage,
        prices: {},
      ),
      CryptoCoinModel(
        symbol: 'ETH',
        name: "Ethereum",
        imagePath: ethereumImage,
        prices: {},
      ),
      CryptoCoinModel(
        symbol: 'LTC',
        name: "Litecoin",
        imagePath: litecoinImage,
        prices: {},
      ),
    ];
  }
}
