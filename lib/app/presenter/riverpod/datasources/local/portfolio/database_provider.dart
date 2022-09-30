import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../../../infra/data_sources/local/get_portfolio_database.dart';

final portfolioDatabaseProvider = Provider(
  (ref) => GetPortfolioDatabase(),
);
