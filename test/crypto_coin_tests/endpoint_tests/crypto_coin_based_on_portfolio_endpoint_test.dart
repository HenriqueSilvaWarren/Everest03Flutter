import 'package:card_02_listagem_crypto/app/domain/view_datas/coin_in_portfolio_view_data.dart';
import 'package:card_02_listagem_crypto/app/domain/view_datas/portfolio_view_data.dart';
import 'package:card_02_listagem_crypto/app/infra/data_sources/endpoints/crypto_coin_end_point.dart';
import 'package:decimal/decimal.dart';
import 'package:dio/dio.dart';
import 'package:faker/faker.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import '../../helpers/coin_gecko_factory.dart';

class DioMock extends Mock implements Dio {}

void main() {
  late Response<List<Map<String, dynamic>>> success;
  late DioMock dioMock;
  late CryptoCoinEndPoint cryptoCoinEndPoint;

  When mockGetResponse() => when(
        () => dioMock.get(
          any(),
          queryParameters: any(named: 'queryParameters'),
        ),
      );

  mockResponse(List<Map<String, dynamic>> factory, int statusCode) => Response(
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
        CoinGeckoFactory.getCryptoCoinBasedOnPortfolio(),
        200,
      );
    },
  );

  test("WHEN getCryptoCoinBasedOnPortfolio THEN returns 200", () async {
    mockGetResponse().thenAnswer((invocation) async => success);
    final result = await cryptoCoinEndPoint.getCryptoCoinBasedOnPortfolio(
      PortfolioViewData(
        coins: [
          CoinInPortfolioViewData(
            symbol: Faker().lorem.word(),
            name: Faker().lorem.word(),
            quantity: Decimal.parse(
              Faker().randomGenerator.decimal(scale: 100).toString(),
            ),
          )
        ],
      ),
      'brl',
    );
    expect(result.statusCode, equals(200));
    expect(result, success);
  });
}
