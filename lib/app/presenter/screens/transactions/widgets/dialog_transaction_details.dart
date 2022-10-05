import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:intl/intl.dart';

import '../../../../domain/view_datas/crypto_coin_view_data.dart';
import '../../../../domain/view_datas/transactions_view_data.dart';
import '../../../riverpod/view/date_time_formatter_provider.dart';
import 'dialog_named_section.dart';
import 'dialog_transaction_details_row.dart';

class DialogTransactionDetails extends HookConsumerWidget {
  const DialogTransactionDetails({
    Key? key,
    required this.leftCrypto,
    required this.transaction,
    required this.rightCrypto,
  }) : super(key: key);

  final CryptoCoinViewData leftCrypto;
  final TransactionsViewData transaction;
  final CryptoCoinViewData rightCrypto;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    DateFormat formatter = ref.watch(dateTimeFormatterProvider('dd/MM/yyyy'));
    return DialogNamedSection(
      title: 'Detalhes da Transação',
      child: Column(
        children: [
          DialogTransactionDetailsRow(
            firstText: 'Moeda Convertida:',
            secondText: '${leftCrypto.name}',
          ),
          DialogTransactionDetailsRow(
            firstText: 'Quantidade Convertida:',
            secondText: transaction.convertedCryptoAmount.split(' ')[0],
          ),
          DialogTransactionDetailsRow(
            firstText: 'Moeda Recebida:',
            secondText: '${rightCrypto.name}',
          ),
          DialogTransactionDetailsRow(
            firstText: 'Quantidade Recebida:',
            secondText: transaction.receivedCryptoAmount.split(' ')[0],
          ),
          DialogTransactionDetailsRow(
            firstText: 'Valor Monetário:',
            secondText: transaction.valueOfTransaction,
          ),
          DialogTransactionDetailsRow(
            firstText: 'Data da Transação',
            secondText: formatter.format(transaction.dateOfExchange),
          ),
        ],
      ),
    );
  }
}
