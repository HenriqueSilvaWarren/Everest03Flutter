import 'package:faker/faker.dart';

Faker faker = Faker();

class CoinGeckoFactory {
  static List<Map<String, dynamic>> getCryptoCoinBasedOnPortfolio() => [
        {
          "id": faker.lorem.word(),
          "symbol": faker.lorem.word(),
          "name": faker.lorem.word(),
          "image": faker.image.toString(),
          "current_price": faker.randomGenerator.decimal(scale: 100000),
          "price_change_percentage_24h": faker.randomGenerator.decimal(
            scale: 7,
          ),
        },
      ];

  static Map<String, List<List<double>>> getCryptoHistoricPriceById() => {
        'prices': [
          [
            faker.randomGenerator.decimal(scale: 100000000),
            faker.randomGenerator.decimal(scale: 100000),
          ],
          [
            faker.randomGenerator.decimal(scale: 100000000),
            faker.randomGenerator.decimal(scale: 100000),
          ],
          [
            faker.randomGenerator.decimal(scale: 100000000),
            faker.randomGenerator.decimal(scale: 100000),
          ],
        ],
        faker.lorem.word(): [
          [
            faker.randomGenerator.decimal(scale: 100000000),
            faker.randomGenerator.decimal(scale: 100000),
          ],
          [
            faker.randomGenerator.decimal(scale: 100000000),
            faker.randomGenerator.decimal(scale: 100000),
          ],
          [
            faker.randomGenerator.decimal(scale: 100000000),
            faker.randomGenerator.decimal(scale: 100000),
          ],
        ],
      };
}
