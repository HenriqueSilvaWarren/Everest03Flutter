import 'package:card_02_listagem_crypto/app/domain/repositories/crypto_coin_repository.dart';
import 'package:card_02_listagem_crypto/app/domain/view_datas/coin_in_portfolio_view_data.dart';
import 'package:card_02_listagem_crypto/app/domain/view_datas/portfolio_view_data.dart';
import 'package:card_02_listagem_crypto/app/infra/data_sources/endpoints/crypto_coin_end_point.dart';
import 'package:card_02_listagem_crypto/app/infra/repositories/crypto_coin_repository_imp.dart';
import 'package:decimal/decimal.dart';
import 'package:dio/dio.dart';
import 'package:faker/faker.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import '../../helpers/coin_gecko_factory.dart';

class CryptoCoinEndPointMock extends Mock implements CryptoCoinEndPoint {}

void main() {
  late CryptoCoinEndPointMock cryptoCoinEndPointMock;
  late CryptoCoinRepository cryptoCoinRepository;
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
  setUp(
    () {
      cryptoCoinEndPointMock = CryptoCoinEndPointMock();
      cryptoCoinRepository = CryptoCoinRepositoryImp(cryptoCoinEndPointMock);
    },
  );
  test(
    "WHEN getCryptoCoinBasedOnPortfolio is requested by CryptoCoinRepository THEN getCryptoCoinBasedOnPortfolio from CryptoCoinEndPoint is called",
    () async {
      when(
        () => cryptoCoinEndPointMock.getCryptoCoinBasedOnPortfolio(
          portfolioViewData,
          'brl',
        ),
      ).thenAnswer(
        (invocation) async => Response(
          data: CoinGeckoFactory.getCryptoCoinBasedOnPortfolio(),
          requestOptions: RequestOptions(
            path: Faker().internet.httpUrl(),
          ),
        ),
      );
      await cryptoCoinRepository.getCryptoCoinBasedOnPortfolio(
        portfolioViewData,
        'brl',
      );
      verify(
        () => cryptoCoinEndPointMock.getCryptoCoinBasedOnPortfolio(
          portfolioViewData,
          'brl',
        ),
      ).called(1);
    },
  );
}
