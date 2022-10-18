import 'package:card_02_listagem_crypto/app/domain/repositories/crypto_coin_repository.dart';
import 'package:card_02_listagem_crypto/app/domain/use_cases/get_crypto_coin_based_on_portfolio_usecase/get_crypto_coin_based_on_portfolio_usecase.dart';
import 'package:card_02_listagem_crypto/app/domain/use_cases/get_crypto_coin_based_on_portfolio_usecase/get_crypto_coin_based_on_portfolio_usecase_imp.dart';
import 'package:card_02_listagem_crypto/app/domain/view_datas/coin_in_portfolio_view_data.dart';
import 'package:card_02_listagem_crypto/app/domain/view_datas/portfolio_view_data.dart';
import 'package:card_02_listagem_crypto/app/infra/responses/get_crypto_coin_based_on_portfolio_response.dart';
import 'package:decimal/decimal.dart';
import 'package:faker/faker.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class CryptoCoinRepositoryMock extends Mock implements CryptoCoinRepository {}

void main() {
  late CryptoCoinRepositoryMock cryptoCoinRepositoryMock;
  late GetCryptoCoinBasedOnPortfolioUsecase
      getCryptoCoinBasedOnPortfolioUsecase;

  setUp(
    () {
      cryptoCoinRepositoryMock = CryptoCoinRepositoryMock();
      getCryptoCoinBasedOnPortfolioUsecase =
          GetCryptoCoinBasedOnPortfolioUsecaseImp(cryptoCoinRepositoryMock);
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
    "WHEN getCryptoCoinBasedOnPortfolio is requested by CryptoCoinUseCase THEN getCryptoCoinBasedOnPortfolio from CryptoCoinRepository is called",
    () async {
      when(
        () => cryptoCoinRepositoryMock.getCryptoCoinBasedOnPortfolio(
          portfolioViewData,
          'brl',
        ),
      ).thenAnswer(
        (invocation) async => [
          GetCryptoCoinResponse(
            current_price: Decimal.parse(
              faker.randomGenerator.decimal(scale: 100).toString(),
            ),
            id: faker.lorem.word(),
            image: faker.image.image(),
            name: faker.lorem.word(),
            price_change_percentage_24h: Decimal.parse(
              faker.randomGenerator.decimal(scale: 1).toString(),
            ),
            symbol: faker.lorem.word(),
          ),
        ],
      );
      await getCryptoCoinBasedOnPortfolioUsecase.execute(
        portfolioViewData,
        'brl',
      );
    },
  );
}
