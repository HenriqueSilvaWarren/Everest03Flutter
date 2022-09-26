
import '../../repositories/crypto_coin_repository.dart';

import '../../view_datas/crypto_historic_price_view_data.dart';

abstract class GetCryptoHistoricPriceByIdUsecase {
  final CryptoCoinRepository repository;
  GetCryptoHistoricPriceByIdUsecase(this.repository);

  Future<CryptoHistoricPriceViewData> execute(String id);
}