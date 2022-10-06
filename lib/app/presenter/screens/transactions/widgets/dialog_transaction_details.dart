import 'package:card_02_listagem_crypto/l10n/app_localizations.dart';
import 'package:flutter/material.dart';
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
      title: CryptoAppStrings.of(context)!.transactionDetails,
      child: Column(
        children: [
          DialogTransactionDetailsRow(
            firstText: CryptoAppStrings.of(context)!.exchangedCoin,
            secondText: leftCrypto.name,
          ),
          DialogTransactionDetailsRow(
            firstText: CryptoAppStrings.of(context)!.exchangedQuantity,
            secondText: transaction.convertedCryptoAmount.split(' ')[0],
          ),
          DialogTransactionDetailsRow(
            firstText: CryptoAppStrings.of(context)!.receivedCoin,
            secondText: rightCrypto.name,
          ),
          DialogTransactionDetailsRow(
            firstText: CryptoAppStrings.of(context)!.receivedQuantity,
            secondText: transaction.receivedCryptoAmount.split(' ')[0],
          ),
          DialogTransactionDetailsRow(
            firstText: CryptoAppStrings.of(context)!.monetaryValue,
            secondText: transaction.valueOfTransaction,
          ),
          DialogTransactionDetailsRow(
            firstText: CryptoAppStrings.of(context)!.transactionDate,
            secondText: formatter.format(transaction.dateOfExchange),
          ),
        ],
      ),
    );
  }
}

class AppLocalizations {}
