import 'package:card_02_listagem_crypto/app/domain/view_datas/transactions_view_data.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:intl/intl.dart';

import '../../../riverpod/datasources/local/transactions/screen/transactions_provider.dart';
import '../../../riverpod/view/date_time_formatter_provider.dart';
import 'transactions_dialog.dart';

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
          return ListView.builder(
            itemCount: transactions.listTransactions.length,
            itemBuilder: (context, index) {
              var transaction = transactions.listTransactions[index];
              return TransactionsListTile(transaction: transaction, formatter: formatter);
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
          return const Text('Carregando...');
        },
      ),
    );
  }
}

class TransactionsListTile extends StatelessWidget {
  const TransactionsListTile({
    Key? key,
    required this.transaction,
    required this.formatter,
  }) : super(key: key);

  final TransactionsViewData transaction;
  final DateFormat formatter;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: () {
        showDialog(
          builder: (context) => TransactionDialog(
            transaction: transaction,
          ),
          context: context,
        );
      },
      horizontalTitleGap: 8,
      shape: const Border(
        top: BorderSide(
          color: Color.fromARGB(255, 227, 228, 235),
        ),
      ),
      title: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            transaction.convertedCryptoAmount,
            style: GoogleFonts.sourceSansPro(
              fontWeight: FontWeight.w400,
              fontSize: 19,
              color: const Color.fromRGBO(117, 118, 128, 1),
            ),
          ),
          Text(
            transaction.receivedCryptoAmount,
            style: GoogleFonts.sourceSansPro(
              fontSize: 19,
              fontWeight: FontWeight.w400,
            ),
          )
        ],
      ),
      subtitle: Padding(
        padding: const EdgeInsets.only(top: 4.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              formatter.format(transaction.dateOfExchange),
              style: GoogleFonts.sourceSansPro(
                fontWeight: FontWeight.w400,
                fontSize: 15,
              ),
            ),
            Text(
              transaction.valueOfTransaction,
              style: GoogleFonts.sourceSansPro(
                fontSize: 15,
                fontWeight: FontWeight.w400,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
