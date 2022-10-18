import 'package:card_02_listagem_crypto/app/infra/data_sources/endpoints/crypto_coin_end_point.dart';
import 'package:dio/dio.dart';
import 'package:faker/faker.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import '../../helpers/coin_gecko_factory.dart';

class DioMock extends Mock implements Dio {}

void main() {
  late Response<Map<String, List<List<double>>>> success;
  late DioMock dioMock;
  late CryptoCoinEndPoint cryptoCoinEndPoint;

  When mockGetResponse() => when(
        () => dioMock.get(
          any(),
          queryParameters: any(named: 'queryParameters'),
        ),
      );

  mockResponse(Map<String, List<List<double>>> factory, int statusCode) =>
      Response(
        data: factory,
        statusCode: statusCode,
        requestOptions: RequestOptions(
          path: Faker().internet.httpUrl(),
        ),
      );

  setUp(() {
    dioMock = DioMock();
    cryptoCoinEndPoint = CryptoCoinEndPoint(dioMock);
  });

  setUp(
    () {
      success = mockResponse(
        CoinGeckoFactory.getCryptoHistoricPriceById(),
        200,
      );
    },
  );

  test("WHEN getCryptoHistoryicPriceById THEN returns 200", () async {
    mockGetResponse().thenAnswer((invocation) async => success);
    final result = await cryptoCoinEndPoint.getCryptoHistoricPriceById(
      Faker().lorem.word(),
      Faker().lorem.word(),
    );
    expect(result.statusCode, equals(200));
    expect(result, success);
  });
}
