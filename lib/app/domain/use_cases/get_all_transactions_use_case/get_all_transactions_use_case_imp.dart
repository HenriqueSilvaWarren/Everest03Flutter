
import '../../repositories/transactions_repository.dart';
import '../../view_datas/list_transactions_view_data.dart';

import 'get_all_transactions_use_case.dart';

class GetAllTransactionsUseCaseImp implements GetAllTransactionsUseCase {
  final TransactionsRepository repository;
  GetAllTransactionsUseCaseImp(this.repository);
  @override
  Future<ListTransactionsViewData> execute() async {
    var response = await repository.getAllTransactions();

    return response.toViewData();
  }
}
