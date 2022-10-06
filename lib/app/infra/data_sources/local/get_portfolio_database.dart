import 'package:decimal/decimal.dart';

import '../get_portfolio_datasource.dart';

class GetPortfolioDatabase implements GetPortfolioDatasource {
  @override
  Future<List<Map<String, dynamic>>> getPortfolioById(
      int id) async {
    List<List<Map<String, dynamic>>> list = [
      [
        {
          "symbol": "BTC",
          "name": "Bitcoin",
          "quantity": Decimal.parse("0.65554321"),
        },
        {
          "symbol": "ETH",
          "name": "Ethereum",
          "quantity": Decimal.parse("0.94"),
        },
        {
          "symbol": "LTC",
          "name": "Litecoin",
          "quantity": Decimal.parse("0.82"),
        },
        {
          "symbol": "MATIC",
          "name": "matic-network",
          "quantity": Decimal.parse("0.63"),
        },
        {
          "symbol": "DOGE",
          "name": "Dogecoin",
          "quantity": Decimal.parse("100.25"),
        },
      ],
      [
        {
          "symbol": "BTC",
          "name": "Bitcoin",
          "quantity": Decimal.parse("3.7893"),
        },
        {
          "symbol": "ETH",
          "name": "Ethereum",
          "quantity": Decimal.parse("2.132"),
        },
      ],
    ];

    return list[id];
  }
}
