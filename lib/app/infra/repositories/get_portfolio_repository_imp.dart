import '../../domain/repositories/get_portfolio_repository.dart';
import '../data_sources/get_portfolio_datasource.dart';
import '../responses/get_portfolio_by_id_response.dart';

class GetPortfolioRepositoryImp implements GetPortfolioRepository {
  GetPortfolioDatasource datasource;
  GetPortfolioRepositoryImp(this.datasource);

  @override
  Future<List<GetPortfolioByIdResponse>> getPortfolioById(int id) async {
    final result = await datasource.getPortfolioById(id);

    return List<GetPortfolioByIdResponse>.from(
      result.map(
        (item) => GetPortfolioByIdResponse.fromJson(
          item,
        ),
      ),
    );
  }
}
