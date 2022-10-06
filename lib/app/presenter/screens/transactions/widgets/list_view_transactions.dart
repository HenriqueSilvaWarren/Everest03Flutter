import 'package:card_02_listagem_crypto/app/presenter/screens/portfolio/loading_widgets/loading_crypto_list.dart';
import 'package:card_02_listagem_crypto/app/presenter/screens/transactions/loading_widgets/loading_transaction_list.dart';

import '../../../../domain/view_datas/transactions_view_data.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:intl/intl.dart';

import '../../../riverpod/datasources/local/transactions/screen/transactions_provider.dart';
import '../../../riverpod/view/date_time_formatter_provider.dart';
import 'transactions_dialog.dart';
import 'transactions_list_tile.dart';

class ListViewTransactions extends StatefulHookConsumerWidget {
  const ListViewTransactions({
    Key? key,
  }) : super(key: key);
  @override
  ConsumerState<ListViewTransactions> createState() =>
      _ListViewTransactionsState();
}

class _ListViewTransactionsState extends ConsumerState<ListViewTransactions> {
  @override
  Widget build(BuildContext context) {
    final DateFormat formatter = ref.watch(
      dateTimeFormatterProvider('dd/MM/yyyy'),
    );
    return Expanded(
      child: ref.watch(transactionsProvider).when(
        data: (transactions) {
          //  return const LoadingTransactionList();
          return ListView.builder(
            itemCount: transactions.listTransactions.length,
            itemBuilder: (context, index) {
              var transaction = transactions.listTransactions[index];
              return TransactionsListTile(
                transaction: transaction,
                formatter: formatter,
              );
            },
          );
        },
        error: (error, stackTrace) {
          return Column(
            children: [
              Text('$error'),
              Text('$stackTrace'),
            ],
          );
        },
        loading: () {
          return const LoadingTransactionList();
        },
      ),
    );
  }
}
