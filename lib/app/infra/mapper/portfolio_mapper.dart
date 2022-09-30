import '../../domain/view_datas/coin_in_portfolio_view_data.dart';
import '../../domain/view_datas/portfolio_view_data.dart';
import '../responses/get_portfolio_by_id_response.dart';

extension PortfolioMapper on List<GetPortfolioByIdResponse> {
  PortfolioViewData toViewData() {
    return PortfolioViewData(
      coins: map<CoinInPortfolioViewData>(
        (coin) {
          return CoinInPortfolioViewData(
            symbol: coin.symbol,
            name: coin.name,
            quantity: coin.quantity,
          );
        },
      ).toList(),
    );
  }
}
