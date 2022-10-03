import 'package:flutter/material.dart';

import 'loading_crypto_list_card.dart';

class LoadingCryptoList extends StatelessWidget {
  const LoadingCryptoList({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.66,
      child: ListView.builder(
        physics: const BouncingScrollPhysics(),
        itemCount: 6,
        itemBuilder: (context, index) {
          return const LoadingCryptoListCard();
        },
      ),
    );
  }
}
