import 'database_provider.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../../../infra/repositories/get_portfolio_repository_imp.dart';

final portfolioRepositoryProvider = Provider(
  (ref) {
    final database = ref.read(portfolioDatabaseProvider);
    return GetPortfolioRepositoryImp(database);
  },
);