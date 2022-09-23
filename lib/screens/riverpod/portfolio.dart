import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../data_sources/database/get_portfolio_database.dart';

final portfolioStateProvider = StateProvider((ref) => GetPortfolioDatabase.getPortfolio());