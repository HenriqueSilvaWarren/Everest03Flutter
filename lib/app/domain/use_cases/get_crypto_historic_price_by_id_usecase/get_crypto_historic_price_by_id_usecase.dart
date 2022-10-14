import '../../view_datas/crypto_historic_price_view_data.dart';

abstract class GetCryptoHistoricPriceByIdUsecase {
  Future<CryptoHistoricPriceViewData> execute(
    String id,
    String currency,
  );
}
