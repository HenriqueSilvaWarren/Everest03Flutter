import '../transactions_datasource.dart';

class TransactionsDatabase implements TransactionsDatasource {
  @override
  Future<Map<String, List<Map<String, dynamic>>>> getAllTransactions() async {
    List<Map<String, dynamic>> list = [
      {
        "convertedCryptoAmount": "0,02 BTC",
        "receivedCryptoAmount": "0,29457563 ETH",
        "dateOfExchange": "2022-10-04",
        "valueOfTransaction": "R\$ 2.043,10",
      },
      {
        "convertedCryptoAmount": "100 DOGE",
        "receivedCryptoAmount": "6,04461089 USDC",
        "dateOfExchange": "2022-10-04",
        "valueOfTransaction": "R\$ 31,07",
      },
      {
        "convertedCryptoAmount": "0,3 LTC",
        "receivedCryptoAmount": "16,37451361 BUSD",
        "dateOfExchange": "2022-10-04",
        "valueOfTransaction": "R\$ 84,17",
      },
    ];
    return {"list_transactions": list};
  }
}
