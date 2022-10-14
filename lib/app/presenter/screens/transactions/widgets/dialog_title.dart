import 'package:flutter/material.dart';

import '../../../../domain/view_datas/crypto_coin_view_data.dart';
import 'dialog_title_image.dart';

class DialogTitle extends StatelessWidget {
  const DialogTitle({
    Key? key,
    required this.leftCrypto,
    required this.rightCrypto,
  }) : super(key: key);

  final CryptoCoinViewData leftCrypto;
  final CryptoCoinViewData rightCrypto;

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      clipBehavior: Clip.none,
      fit: StackFit.passthrough,
      children: [
        Positioned(
          bottom: 0,
          child: Container(
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5),
              color: Colors.white,
              boxShadow: const [
                BoxShadow(
                  offset: Offset(0, 6),
                  spreadRadius: -5,
                  blurRadius: 9,
                  color: Color.fromRGBO(93, 93, 93, 1),
                )
              ],
            ),
            child: Row(
              children: [
                DialogTitleImage(crypto: leftCrypto),
                const SizedBox(
                  width: 60,
                  child: Icon(
                    Icons.currency_exchange,
                    color: Color.fromRGBO(224, 43, 87, 1),
                  ),
                ),
                DialogTitleImage(crypto: rightCrypto),
              ],
            ),
          ),
        ),
        const SizedBox.shrink()
      ],
    );
  }
}

