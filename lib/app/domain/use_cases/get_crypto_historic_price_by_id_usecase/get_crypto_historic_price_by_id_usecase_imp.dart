import '../../../infra/mapper/crypto_price_mapper.dart';
import '../../repositories/crypto_coin_repository.dart';
import '../../view_datas/crypto_historic_price_view_data.dart';
import 'get_crypto_historic_price_by_id_usecase.dart';

class GetCryptoHistoricPriceByIdUsecaseImp
    implements GetCryptoHistoricPriceByIdUsecase {

  final CryptoCoinRepository repository;
  GetCryptoHistoricPriceByIdUsecaseImp(this.repository);

  @override
  Future<CryptoHistoricPriceViewData> execute(String id, String currency) async {
    final response = await repository.getCryptoHistoricPriceById(id, currency);

    return response.toViewData();
  }
}
