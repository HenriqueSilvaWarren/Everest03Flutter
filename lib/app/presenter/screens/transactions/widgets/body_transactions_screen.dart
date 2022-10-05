import 'package:card_02_listagem_crypto/app/presenter/riverpod/datasources/local/transactions/screen/transactions_provider.dart';
import 'package:card_02_listagem_crypto/core/utils/animated_hide_text_value.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:intl/intl.dart';

import 'header_transactions_screen.dart';

class BodyTransactionsScreen extends StatefulHookConsumerWidget {
  const BodyTransactionsScreen({
    super.key,
  });

  @override
  ConsumerState<BodyTransactionsScreen> createState() =>
      _BodyTransactionsScreenState();
}

class _BodyTransactionsScreenState
    extends ConsumerState<BodyTransactionsScreen> {
  late DateFormat formatter;
  @override
  void initState() {
    super.initState();
    formatter = DateFormat('dd/MM/yyyy');
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const HeaderTransactionsScreen(),
            Expanded(
              child: ref.watch(transactionsProvider).when(
                data: (transactions) {
                  return ListView.builder(
                    itemCount: transactions.listTransactions.length,
                    itemBuilder: (context, index) {
                      var transaction = transactions.listTransactions[index];
                      return ListTile(
                        onTap: () {},
                        horizontalTitleGap: 8,
                        shape: const Border(
                          top: BorderSide(
                            color: Color.fromARGB(255, 227, 228, 235),
                          ),
                        ),
                        title: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            AnimatedHideTextValue(
                              text: transaction.converted_crypto_amount,
                              style: GoogleFonts.sourceSansPro(
                                fontWeight: FontWeight.w400,
                                fontSize: 19,
                                color: const Color.fromRGBO(117, 118, 128, 1),
                              ),
                            ),
                            AnimatedHideTextValue(
                              text: transaction.received_crypto_amount,
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
                                formatter.format(transaction.date_of_exchange),
                                style: GoogleFonts.sourceSansPro(
                                  fontWeight: FontWeight.w400,
                                  fontSize: 15,
                                ),
                              ),
                              AnimatedHideTextValue(
                                text: transaction.value_of_transaction,
                                style: GoogleFonts.sourceSansPro(
                                  fontSize: 15,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                            ],
                          ),
                        ),
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
                  return const Text('Carregando...');
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
