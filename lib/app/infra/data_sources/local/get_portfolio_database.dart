
import '../get_portfolio_datasource.dart';

class GetPortfolioDatabase implements GetPortfolioDatasource {
  @override
  Future<List<Map<String, dynamic>>> getPortfolioById(int id) async {
    List<List<Map<String, dynamic>>> list = [
      [
        {
          "symbol": "BTC",
          "name": "Bitcoin",
          "quantity": 0.63554321,
        },
        {
          "symbol": "ETH",
          "name": "Ethereum",
          "quantity": 1.23457563,
        },
        {
          "symbol": "LTC",
          "name": "Litecoin",
          "quantity": 0.52,
        },
        {
          "symbol": "MATIC",
          "name": "matic-network",
          "quantity": 0.63,
        },
        {
          "symbol": "DOGE",
          "name": "Dogecoin",
          "quantity": 0.25,
        },
        {
          "symbol": "USDC",
          "name": "usd-coin",
          "quantity": 6.04461089,
        },
        {
          "symbol": "BUSD",
          "name": "binance-usd",
          "quantity": 16.37451361,
        },
      ],
      [
        {
          "symbol": "BTC",
          "name": "Bitcoin",
          "quantity": 3.7893,
        },
        {
          "symbol": "ETH",
          "name": "Ethereum",
          "quantity": 2.132,
        },
      ],
    ];

    return list[id];
  }
}
