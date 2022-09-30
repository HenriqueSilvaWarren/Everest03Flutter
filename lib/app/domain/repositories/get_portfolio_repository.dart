import '../../infra/responses/get_portfolio_by_id_response.dart';

abstract class GetPortfolioRepository {
  Future<List<GetPortfolioByIdResponse>> getPortfolioById(int id);
}
