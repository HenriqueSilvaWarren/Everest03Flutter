import '../../domain/view_datas/crypto_historic_price_view_data.dart';
import '../responses/get_crypto_historic_price_by_id_response.dart';


extension CryptoPriceMapper on GetCryptoHistoricPriceByIdResponse {
  CryptoHistoricPriceViewData toViewData() {
    return CryptoHistoricPriceViewData(cryptoPricesList: prices);
  }
}
