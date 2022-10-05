import 'package:card_02_listagem_crypto/app/domain/view_datas/crypto_coin_view_data.dart';
import 'package:card_02_listagem_crypto/app/presenter/riverpod/view/date_time_formatter_provider.dart';
import 'package:card_02_listagem_crypto/app/presenter/screens/transactions/widgets/dialog_named_section.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:intl/intl.dart';

import '../../../../domain/view_datas/transactions_view_data.dart';
import '../../../riverpod/datasources/api/coin_gecko/screens/crypto_coin_from_api_provider.dart';
import '../../../riverpod/view/bank_details_provider.dart';
import 'bank_details.dart';
import 'dialog_title.dart';
import 'dialog_transaction_details.dart';

class TransactionDialog extends HookConsumerWidget {
  const TransactionDialog({
    Key? key,
    this.duration = const Duration(seconds: 1),
    required this.transaction,
    this.curve = Curves.linear,
  }) : super(key: key);

  final Duration duration;
  final TransactionsViewData transaction;
  final Curve curve;

  double shake(double value) =>
      20 + 20 * (0.5 - (0.5 - curve.transform(value)).abs());

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final leftCrypto =
        ref.read(cryptoCoinFromApiProvider).value!.listCrypto.firstWhere(
              (coin) =>
                  coin.symbol.toUpperCase() ==
                  transaction.convertedCryptoAmount.split(' ')[1],
            );

    final rightCrypto = ref
        .read(cryptoCoinFromApiProvider)
        .whenData((value) => value)
        .value!
        .listCrypto
        .firstWhere(
          (coin) =>
              coin.symbol.toUpperCase() ==
              transaction.receivedCryptoAmount.split(' ')[1],
        );
    final bankDetails = ref.watch(bankDetailsProvider);
    return AlertDialog(
      title: DialogTitle(leftCrypto: leftCrypto, rightCrypto: rightCrypto),
      content: SizedBox(
        height: MediaQuery.of(context).size.height * 0.38,
        width: MediaQuery.of(context).size.width * 0.36,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            BankDetails(bankDetails: bankDetails),
            const SizedBox(
              height: 10,
            ),
            DialogTransactionDetails(
              leftCrypto: leftCrypto,
              transaction: transaction,
              rightCrypto: rightCrypto,
            ),
          ],
        ),
      ),
    );
  }
}
