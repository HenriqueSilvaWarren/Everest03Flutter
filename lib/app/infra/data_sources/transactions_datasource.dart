

abstract class TransactionsDatasource {
  Future<Map<String, List<Map<String, dynamic>>>> getAllTransactions();
}
