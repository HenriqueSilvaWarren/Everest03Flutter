import 'package:flutter/material.dart';

import '../../../../domain/view_datas/crypto_coin_view_data.dart';

class DialogTitleImage extends StatelessWidget {
  const DialogTitleImage({
    Key? key,
    required this.crypto,
  }) : super(key: key);

  final CryptoCoinViewData crypto;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      child: Image.network(
        crypto.image,
        height: 40,
        width: 40,
      ),
    );
  }
}
