import '../responses/get_portfolio_by_id_response.dart';

import '../../domain/repositories/get_portfolio_repository.dart';
import '../data_sources/get_portfolio_datasource.dart';

class GetPortfolioRepositoryImp implements GetPortfolioRepository {
  GetPortfolioDatasource database;
  GetPortfolioRepositoryImp(this.database);

  @override
  Future<List<GetPortfolioByIdResponse>> getPortfolioById(int id) async {
    final result = await database.getPortfolioById(id);

    return List<GetPortfolioByIdResponse>.from(
      result.map(
        (item) => GetPortfolioByIdResponse.fromJson(
          item,
        ),
      ),
    );
  }
}
