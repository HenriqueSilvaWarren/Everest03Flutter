import 'package:card_02_listagem_crypto/app/domain/repositories/get_portfolio_repository.dart';

import '../../repositories/crypto_coin_repository.dart';
import '../../view_datas/portfolio_view_data.dart';

abstract class GetPortfolioUseCase {
  final GetPortfolioRepository repository;
  GetPortfolioUseCase({required this.repository});

  Future<PortfolioViewData> execute(int id);
}
