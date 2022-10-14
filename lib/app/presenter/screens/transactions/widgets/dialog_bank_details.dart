import '../../../../../l10n/app_localizations.dart';
import 'dialog_transaction_details_row.dart';
import 'package:flutter/material.dart';

import 'dialog_named_section.dart';
import 'transactions_row_item.dart';

class DialogBankDetails extends StatelessWidget {
  const DialogBankDetails({
    Key? key,
    required this.bankDetails,
  }) : super(key: key);

  final Map<String, String> bankDetails;

  @override
  Widget build(BuildContext context) {
    return DialogNamedSection(
      title: CryptoAppStrings.of(context)!.bankDetails,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          DialogTransactionDetailsRow(
            firstText: CryptoAppStrings.of(context)!.bank,
            secondText: bankDetails['bank']!,
          ),
          DialogTransactionDetailsRow(
            firstText: CryptoAppStrings.of(context)!.agency,
            secondText: bankDetails['agency']!,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              TransactionRowItem(
                firstText: CryptoAppStrings.of(context)!.subAccount,
                secondText: bankDetails['subAccount']!,
              ),
              TransactionRowItem(
                firstText: CryptoAppStrings.of(context)!.account,
                secondText: bankDetails['account']!,
              ),
              TransactionRowItem(
                firstText: CryptoAppStrings.of(context)!.cd,
                secondText: bankDetails['dv']!,
              ),
            ],
          )
        ],
      ),
    );
  }
}
