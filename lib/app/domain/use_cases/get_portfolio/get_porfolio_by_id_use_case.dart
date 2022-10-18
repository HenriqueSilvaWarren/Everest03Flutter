import '../../view_datas/portfolio_view_data.dart';

abstract class GetPortfolioUseCase {
  Future<PortfolioViewData> execute(int id);
}
