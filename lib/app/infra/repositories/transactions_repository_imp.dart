import '../../domain/repositories/transactions_repository.dart';
import '../data_sources/transactions_datasource.dart';
import '../responses/get_all_transactions_response.dart';

class TransactionsRepositoryImp implements TransactionsRepository {
  final TransactionsDatasource datasource;
  TransactionsRepositoryImp(this.datasource);

  @override
  Future<GetAllTransactionsResponse> getAllTransactions() async {
    final result = await datasource.getAllTransactions();

    return GetAllTransactionsResponse.fromJson(result);
  }
}
