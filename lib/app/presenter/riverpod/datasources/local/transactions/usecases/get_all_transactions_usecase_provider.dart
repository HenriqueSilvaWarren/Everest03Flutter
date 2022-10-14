import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../../../../domain/use_cases/get_all_transactions_use_case/get_all_transactions_use_case_imp.dart';
import '../repository_provider.dart';

final getAllTransactionsUseCaseProvider = Provider(
  (ref) {
    final repository = ref.read(transactionsRepositoryProvider);
    return GetAllTransactionsUseCaseImp(repository);
  },
);
