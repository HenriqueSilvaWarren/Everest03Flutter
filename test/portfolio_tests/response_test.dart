import 'package:card_02_listagem_crypto/app/infra/responses/get_portfolio_by_id_response.dart';
import 'package:decimal/decimal.dart';
import 'package:faker/faker.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  late Faker faker;

  setUp(
    () {
      faker = Faker();
    },
  );
  test(
    'WHEN call methods from GetPortfolioByIdResponse THEN ensure returns accordingly',
    () async {
      var response = GetPortfolioByIdResponse(
        symbol: faker.lorem.word(),
        name: faker.lorem.word(),
        quantity: Decimal.one,
      );
      var result = response.toJson();

      expect(result.isEmpty, false);
    },
  );
}
