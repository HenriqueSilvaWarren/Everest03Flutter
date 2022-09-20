import 'package:card_02_listagem_crypto/data_sources/database/get_portfolio_database.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final portfolioStateProvider = StateProvider((ref) => GetPortfolioDatabase.getPortfolio());