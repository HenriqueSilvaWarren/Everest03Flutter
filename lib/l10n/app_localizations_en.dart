import 'app_localizations.dart';

/// The translations for English (`en`).
class CryptoAppStringsEn extends CryptoAppStrings {
  CryptoAppStringsEn([String locale = 'en']) : super(locale);

  @override
  String get language => 'en-US';

  @override
  String get currency => 'usd';

  @override
  String get currencySymbol => 'US\$ ';

  @override
  String get dateFormat => 'MM/dd/yyyy';

  @override
  String get crypto => 'Crypto';

  @override
  String get changeLanguage => 'Change Language';

  @override
  String get amountOfCoin => 'Total amount of coins in cash';

  @override
  String get portfolio => 'Portfolio';

  @override
  String get transactions => 'Transactions';

  @override
  String get details => 'Details';

  @override
  String get currentPrice => 'Current Price';

  @override
  String get variation24 => '24H Variation';

  @override
  String get quantity => 'Quantity';

  @override
  String get value => 'Value';

  @override
  String get buttonExchangeCoin => 'Exchange Coin';

  @override
  String get balance => 'Available Balance';

  @override
  String get conversionExchangeText => 'How much would you like to exchange?';

  @override
  String get conversionHintText => '0.00';

  @override
  String get insertAAmount => 'Please, enter the amount of the coin you want to exchange';

  @override
  String get insertAAmountAboveZero => 'Please enter a value above 0';

  @override
  String get insertAAmountAvailable => 'Please enter a value below or equal to the amount owned';

  @override
  String get chooseTwoDifferentCoins => 'Please, choose two different coins';

  @override
  String get estimatedTotal => 'Estimated Total';

  @override
  String get valueWasntInformed => 'Value wasn\'t informed';

  @override
  String get review => 'Review';

  @override
  String get reviewData => 'Review the specifications of your conversion';

  @override
  String get convert => 'Convert';

  @override
  String get get => 'Get';

  @override
  String get exchange => 'Exchange';

  @override
  String get finishExchange => 'Finish Exchange';

  @override
  String get conversion => 'Conversion performed';

  @override
  String get conversionSuccess => 'Currency conversion successfully performed!';

  @override
  String get bankDetails => 'Bank Details';

  @override
  String get bank => 'Bank:';

  @override
  String get agency => 'Agency:';

  @override
  String get subAccount => 'Sub-account:';

  @override
  String get account => 'Account:';

  @override
  String get cd => 'CD:';

  @override
  String get transactionDetails => 'Transactions Details';

  @override
  String get exchangedCoin => 'Exchanged Coin:';

  @override
  String get exchangedQuantity => 'Exchanged Quantity:';

  @override
  String get receivedCoin => 'Received Coin:';

  @override
  String get receivedQuantity => 'Received Quantity:';

  @override
  String get monetaryValue => 'Monetary Value:';

  @override
  String get transactionDate => 'Transaction Date:';
}
