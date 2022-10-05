import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../usecases/get_all_transactions_usecase_provider.dart';

final transactionsProvider = FutureProvider(
  (ref) => ref.read(getAllTransactionsUseCaseProvider).execute(),
);
