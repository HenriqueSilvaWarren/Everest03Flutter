import 'package:card_02_listagem_crypto/app/infra/responses/get_crypto_coin_based_on_portfolio_response.dart';
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
    'WHEN call methods from GetCryptoCoinRespone THEN ensure returns accordingly',
    () async {
      var response = GetCryptoCoinResponse(
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
      );
      var result = response.toJson();

      expect(result.isEmpty, false);
    },
  );
}
