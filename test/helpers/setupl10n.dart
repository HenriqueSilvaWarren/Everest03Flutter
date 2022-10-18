import 'package:card_02_listagem_crypto/l10n/app_localizations.dart';
import 'package:flutter/material.dart';

class Setupl10n extends StatelessWidget {
  const Setupl10n({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Text(CryptoAppStrings.of(context)!.language),
          Text(CryptoAppStrings.of(context)!.currencySymbol),
          Text(CryptoAppStrings.of(context)!.dateFormat),
          Text(CryptoAppStrings.of(context)!.crypto),
          Text(CryptoAppStrings.of(context)!.changeLanguage),
          Text(CryptoAppStrings.of(context)!.amountOfCoin),
          Text(CryptoAppStrings.of(context)!.portfolio),
          Text(CryptoAppStrings.of(context)!.transactions),
          Text(CryptoAppStrings.of(context)!.details),
          Text(CryptoAppStrings.of(context)!.currentPrice),
          Text(CryptoAppStrings.of(context)!.variation24),
          Text(CryptoAppStrings.of(context)!.quantity),
          Text(CryptoAppStrings.of(context)!.value),
          Text(CryptoAppStrings.of(context)!.buttonExchangeCoin),
          Text(CryptoAppStrings.of(context)!.balance),
          Text(CryptoAppStrings.of(context)!.conversionExchangeText),
          Text(CryptoAppStrings.of(context)!.conversionHintText),
          Text(CryptoAppStrings.of(context)!.insertAAmount),
          Text(CryptoAppStrings.of(context)!.insertAAmountAboveZero),
          Text(CryptoAppStrings.of(context)!.insertAAmountAvailable),
          Text(CryptoAppStrings.of(context)!.chooseTwoDifferentCoins),
          Text(CryptoAppStrings.of(context)!.estimatedTotal),
          Text(CryptoAppStrings.of(context)!.valueWasntInformed),
          Text(CryptoAppStrings.of(context)!.review),
          Text(CryptoAppStrings.of(context)!.reviewData),
          Text(CryptoAppStrings.of(context)!.convert),
          Text(CryptoAppStrings.of(context)!.get),
          Text(CryptoAppStrings.of(context)!.exchange),
          Text(CryptoAppStrings.of(context)!.finishExchange),
          Text(CryptoAppStrings.of(context)!.conversion),
          Text(CryptoAppStrings.of(context)!.conversionSuccess),
          Text(CryptoAppStrings.of(context)!.bankDetails),
          Text(CryptoAppStrings.of(context)!.bank),
          Text(CryptoAppStrings.of(context)!.agency),
          Text(CryptoAppStrings.of(context)!.subAccount),
          Text(CryptoAppStrings.of(context)!.account),
          Text(CryptoAppStrings.of(context)!.cd),
          Text(CryptoAppStrings.of(context)!.transactionDetails),
          Text(CryptoAppStrings.of(context)!.exchangedCoin),
          Text(CryptoAppStrings.of(context)!.exchangedQuantity),
          Text(CryptoAppStrings.of(context)!.receivedCoin),
          Text(CryptoAppStrings.of(context)!.receivedQuantity),
          Text(CryptoAppStrings.of(context)!.monetaryValue),
          Text(CryptoAppStrings.of(context)!.transactionDate),
        ],
      ),
    );
  }
}
