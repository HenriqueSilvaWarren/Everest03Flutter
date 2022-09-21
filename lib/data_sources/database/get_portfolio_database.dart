import '../../use_cases/models/coin_in_portfolio_model.dart';
import '../../use_cases/models/portfolio_model.dart';
import 'package:decimal/decimal.dart';

class GetPortfolioDatabase {
  static PortfolioModel getPortfolio() {
    return PortfolioModel(
      coins: [
        CoinInPortfolioModel(
          symbol: "BTC",
          name: "Bitcoin",
          quantity: Decimal.parse("0.65554321"),
        ),
        CoinInPortfolioModel(
          symbol: "ETH",
          name: "Ethereum",
          quantity: Decimal.parse("0.94"),
        ),
        CoinInPortfolioModel(
          symbol: "LTC",
          name: "Litecoin",
          quantity: Decimal.parse("0.82"),
        ),
        CoinInPortfolioModel(
          symbol: "MATIC",
          name: "matic-network",
          quantity: Decimal.parse("0.82"),
        ),
        CoinInPortfolioModel(
          symbol: "DOGE",
          name: "Dogecoin",
          quantity: Decimal.parse("100.25"),
        )
      ],
    );
  }
}
