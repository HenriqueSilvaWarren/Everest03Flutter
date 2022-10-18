import 'package:card_02_listagem_crypto/app/domain/repositories/crypto_coin_repository.dart';
import 'package:card_02_listagem_crypto/app/domain/use_cases/get_crypto_coin_based_on_portfolio_usecase/get_crypto_coin_based_on_portfolio_usecase.dart';
import 'package:card_02_listagem_crypto/app/domain/use_cases/get_crypto_coin_based_on_portfolio_usecase/get_crypto_coin_based_on_portfolio_usecase_imp.dart';
import 'package:card_02_listagem_crypto/app/domain/use_cases/get_crypto_historic_price_by_id_usecase/get_crypto_historic_price_by_id_usecase.dart';
import 'package:card_02_listagem_crypto/app/domain/use_cases/get_crypto_historic_price_by_id_usecase/get_crypto_historic_price_by_id_usecase_imp.dart';
import 'package:card_02_listagem_crypto/app/domain/view_datas/coin_in_portfolio_view_data.dart';
import 'package:card_02_listagem_crypto/app/domain/view_datas/portfolio_view_data.dart';
import 'package:card_02_listagem_crypto/app/infra/responses/get_crypto_coin_based_on_portfolio_response.dart';
import 'package:card_02_listagem_crypto/app/infra/responses/get_crypto_historic_price_by_id_response.dart';
import 'package:decimal/decimal.dart';
import 'package:faker/faker.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class CryptoCoinRepositoryMock extends Mock implements CryptoCoinRepository {}

void main() {
  late CryptoCoinRepositoryMock cryptoCoinRepositoryMock;
  late GetCryptoHistoricPriceByIdUsecase getCryptoHistoricPriceByIdUsecase;

  setUp(
    () {
      cryptoCoinRepositoryMock = CryptoCoinRepositoryMock();
      getCryptoHistoricPriceByIdUsecase =
          GetCryptoHistoricPriceByIdUsecaseImp(cryptoCoinRepositoryMock);
    },
  );
  var portfolioViewData = PortfolioViewData(
    coins: [
      CoinInPortfolioViewData(
        symbol: Faker().lorem.word(),
        name: Faker().lorem.word(),
        quantity: Decimal.parse(
          Faker().randomGenerator.decimal(scale: 100).toString(),
        ),
      )
    ],
  );
  test(
    "WHEN getCryptoHistoricPriceByIdUsecase is requested by GetCryptoHistoricPriceByIdUsecase THEN getCryptoHistoricPriceById from CryptoCoinRepository is called",
    () async {
      when(
        () => cryptoCoinRepositoryMock.getCryptoHistoricPriceById(
          'bitcoin',
          'brl',
        ),
      ).thenAnswer(
        (invocation) async => GetCryptoHistoricPriceByIdResponse(
          prices: [Decimal.ten],
        ),
      );
      await getCryptoHistoricPriceByIdUsecase.execute(
        'bitcoin',
        'brl',
      );
    },
  );
}
