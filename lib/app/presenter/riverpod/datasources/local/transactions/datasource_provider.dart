import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../../../infra/data_sources/local/transactions_datasource_imp.dart';

final transactionsDatasourceProvider = Provider(
  (ref) => TransactionsDatabase(),
);
