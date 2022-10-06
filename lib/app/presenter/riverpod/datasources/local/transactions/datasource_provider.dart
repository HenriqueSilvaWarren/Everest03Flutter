import '../../../../../infra/data_sources/local/transactions_datasource_imp.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final transactionsDatasourceProvider = Provider(
  (ref) => TransactionsDatabase(),
);
