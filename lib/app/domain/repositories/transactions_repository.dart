import '../../infra/responses/get_all_transactions_response.dart';

abstract class TransactionsRepository {
  Future<GetAllTransactionsResponse> getAllTransactions();
}
