import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../usecases/get_portfolio_by_id_use_case_provider.dart';

final portfolioProvider = FutureProvider(
  (ref) => ref.read(getPortfolioByIdUseCaseProvider).getPortfolioById(0),
);