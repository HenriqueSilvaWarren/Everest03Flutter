
import '../../view_datas/list_transactions_view_data.dart';

abstract class GetAllTransactionsUseCase {
  Future<ListTransactionsViewData> execute();
}