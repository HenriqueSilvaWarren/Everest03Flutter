import 'package:card_02_listagem_crypto/app/domain/repositories/crypto_coin_repository.dart';
import 'package:card_02_listagem_crypto/app/infra/data_sources/endpoints/crypto_coin_end_point.dart';
import 'package:card_02_listagem_crypto/app/infra/repositories/crypto_coin_repository_imp.dart';
import 'package:dio/dio.dart';
import 'package:faker/faker.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import '../../helpers/coin_gecko_factory.dart';

class CryptoCoinEndPointMock extends Mock implements CryptoCoinEndPoint {}

void main() {
  late CryptoCoinEndPointMock cryptoCoinEndPointMock;
  late CryptoCoinRepository cryptoCoinRepository;
  setUp(
    () {
      cryptoCoinEndPointMock = CryptoCoinEndPointMock();
      cryptoCoinRepository = CryptoCoinRepositoryImp(cryptoCoinEndPointMock);
    },
  );
  test(
    "WHEN getCryptoHistoricPriceById is requested by CryptoCoinRepository THEN getCryptoHistoricPriceById from CryptoCoinEndPoint is called",
    () async {
      when(
        () => cryptoCoinEndPointMock.getCryptoHistoricPriceById(
          'bitcoin',
          'brl',
        ),
      ).thenAnswer(
        (invocation) async => Response(
          data: CoinGeckoFactory.getCryptoHistoricPriceById(),
          requestOptions: RequestOptions(
            path: Faker().internet.httpUrl(),
          ),
        ),
      );
      await cryptoCoinRepository.getCryptoHistoricPriceById(
        'bitcoin',
        'brl',
      );
      verify(
        () => cryptoCoinEndPointMock.getCryptoHistoricPriceById(
          'bitcoin',
          'brl',
        ),
      ).called(1);
    },
  );
}
