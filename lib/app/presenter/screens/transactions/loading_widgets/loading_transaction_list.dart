import '../../../riverpod/datasources/api/coin_gecko/screens/crypto_coin_from_api_provider.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'loading_transaction_list_tile.dart';

class LoadingTransactionList extends HookConsumerWidget {
  const LoadingTransactionList({
    Key? key,
  }) : super(key: key); // coverage:ignore-line

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.watch(cryptoCoinFromApiProvider).whenData((value) => value);
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.66,
      child: ListView.builder(
        physics: const BouncingScrollPhysics(),
        itemCount: 6,
        itemBuilder: (context, index) {
          return const LoadingTransactionListTile();
        },
      ),
    );
  }
}
