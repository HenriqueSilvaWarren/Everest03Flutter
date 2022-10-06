import 'dialog_transaction_details_row.dart';
import 'package:flutter/material.dart';

import 'dialog_named_section.dart';
import 'transactions_row_item.dart';

class BankDetails extends StatelessWidget {
  const BankDetails({
    Key? key,
    required this.bankDetails,
  }) : super(key: key);

  final Map<String, String> bankDetails;

  @override
  Widget build(BuildContext context) {
    return DialogNamedSection(
      title: 'Dados Bancários',
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          DialogTransactionDetailsRow(
            firstText: 'Banco:',
            secondText: bankDetails['bank']!,
          ),
          DialogTransactionDetailsRow(
            firstText: 'Agência:',
            secondText: bankDetails['agency']!,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              TransactionRowItem(
                firstText: 'Sub-conta:',
                secondText: bankDetails['subAccount']!,
              ),
              TransactionRowItem(
                firstText: 'Conta:',
                secondText: bankDetails['account']!,
              ),
              TransactionRowItem(
                firstText: 'DV:',
                secondText: bankDetails['dv']!,
              ),
            ],
          )
        ],
      ),
    );
  }
}
