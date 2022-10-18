import '../../../infra/mapper/portfolio_mapper.dart';
import '../../repositories/get_portfolio_repository.dart';
import '../../view_datas/portfolio_view_data.dart';
import 'get_porfolio_by_id_use_case.dart';

class GetPortfolioUseCaseImp implements GetPortfolioUseCase {
  @override
  GetPortfolioRepository repository;
  GetPortfolioUseCaseImp(this.repository);

  @override
  Future<PortfolioViewData> execute(int id) async {
    final result = await repository.getPortfolioById(id);
    return result.toViewData();
  }
}
