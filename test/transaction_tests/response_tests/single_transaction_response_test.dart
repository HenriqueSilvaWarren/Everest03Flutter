import 'package:card_02_listagem_crypto/app/infra/responses/single_transaction_response.dart';
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
    'WHEN call methods from SingleTransactionResponse THEN ensure returns accordingly',
    () async {
      var response = SingleTransactionResponse(
        converted_crypto_amount: faker.lorem.word(),
        received_crypto_amount: faker.lorem.word(),
        date_of_exchange: faker.date.dateTime(),
        value_of_transaction: faker.randomGenerator.integer(100).toString(),
      );
      var result = response.toJson();

      expect(result.isEmpty, false);
    },
  );
}
