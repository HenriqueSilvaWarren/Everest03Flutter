import '../../view_datas/portfolio_view_data.dart';


abstract class GetPorfolioUseCase {
  Future<PortfolioViewData> getPortfolioById(int id);
}
