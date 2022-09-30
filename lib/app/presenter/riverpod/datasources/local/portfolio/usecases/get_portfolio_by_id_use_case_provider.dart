import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../../../../domain/use_cases/get_portfolio/get_portfolio_by_id_use_case_imp.dart';
import '../repository_provider.dart';

final getPortfolioByIdUseCaseProvider = Provider(
  (ref) {
    final repository = ref.read(portfolioRepositoryProvider);
    return GetPortfolioUseCaseImp(repository);
  },
);
