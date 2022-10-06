import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../../../infra/repositories/transactions_repository_imp.dart';
import 'datasource_provider.dart';

final transactionsRepositoryProvider = Provider(
  (ref) {
    final database = ref.read(transactionsDatasourceProvider);
    return TransactionsRepositoryImp(database);
  },
);
