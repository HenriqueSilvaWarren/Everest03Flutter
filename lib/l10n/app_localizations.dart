import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

import 'app_localizations_en.dart';
import 'app_localizations_pt.dart';

/// Callers can lookup localized strings with an instance of CryptoAppStrings
/// returned by `CryptoAppStrings.of(context)`.
///
/// Applications need to include `CryptoAppStrings.delegate()` in their app's
/// `localizationDelegates` list, and the locales they support in the app's
/// `supportedLocales` list. For example:
///
/// ```dart
/// import 'l10n/app_localizations.dart';
///
/// return MaterialApp(
///   localizationsDelegates: CryptoAppStrings.localizationsDelegates,
///   supportedLocales: CryptoAppStrings.supportedLocales,
///   home: MyApplicationHome(),
/// );
/// ```
///
/// ## Update pubspec.yaml
///
/// Please make sure to update your pubspec.yaml to include the following
/// packages:
///
/// ```yaml
/// dependencies:
///   # Internationalization support.
///   flutter_localizations:
///     sdk: flutter
///   intl: any # Use the pinned version from flutter_localizations
///
///   # Rest of dependencies
/// ```
///
/// ## iOS Applications
///
/// iOS applications define key application metadata, including supported
/// locales, in an Info.plist file that is built into the application bundle.
/// To configure the locales supported by your app, you’ll need to edit this
/// file.
///
/// First, open your project’s ios/Runner.xcworkspace Xcode workspace file.
/// Then, in the Project Navigator, open the Info.plist file under the Runner
/// project’s Runner folder.
///
/// Next, select the Information Property List item, select Add Item from the
/// Editor menu, then select Localizations from the pop-up menu.
///
/// Select and expand the newly-created Localizations item then, for each
/// locale your application supports, add a new item and select the locale
/// you wish to add from the pop-up menu in the Value field. This list should
/// be consistent with the languages listed in the CryptoAppStrings.supportedLocales
/// property.
abstract class CryptoAppStrings {
  CryptoAppStrings(String locale) : localeName = intl.Intl.canonicalizedLocale(locale.toString());

  final String localeName;

  static CryptoAppStrings? of(BuildContext context) {
    return Localizations.of<CryptoAppStrings>(context, CryptoAppStrings);
  }

  static const LocalizationsDelegate<CryptoAppStrings> delegate = _CryptoAppStringsDelegate();

  /// A list of this localizations delegate along with the default localizations
  /// delegates.
  ///
  /// Returns a list of localizations delegates containing this delegate along with
  /// GlobalMaterialLocalizations.delegate, GlobalCupertinoLocalizations.delegate,
  /// and GlobalWidgetsLocalizations.delegate.
  ///
  /// Additional delegates can be added by appending to this list in
  /// MaterialApp. This list does not have to be used at all if a custom list
  /// of delegates is preferred or required.
  static const List<LocalizationsDelegate<dynamic>> localizationsDelegates = <LocalizationsDelegate<dynamic>>[
    delegate,
    GlobalMaterialLocalizations.delegate,
    GlobalCupertinoLocalizations.delegate,
    GlobalWidgetsLocalizations.delegate,
  ];

  /// A list of this localizations delegate's supported locales.
  static const List<Locale> supportedLocales = <Locale>[
    Locale('en'),
    Locale('pt')
  ];

  /// No description provided for @language.
  ///
  /// In en, this message translates to:
  /// **'en-US'**
  String get language;

  /// No description provided for @currency.
  ///
  /// In en, this message translates to:
  /// **'usd'**
  String get currency;

  /// No description provided for @currencySymbol.
  ///
  /// In en, this message translates to:
  /// **'US\$ '**
  String get currencySymbol;

  /// No description provided for @dateFormat.
  ///
  /// In en, this message translates to:
  /// **'MM/dd/yyyy'**
  String get dateFormat;

  /// No description provided for @crypto.
  ///
  /// In en, this message translates to:
  /// **'Crypto'**
  String get crypto;

  /// No description provided for @changeLanguage.
  ///
  /// In en, this message translates to:
  /// **'Change Language'**
  String get changeLanguage;

  /// No description provided for @amountOfCoin.
  ///
  /// In en, this message translates to:
  /// **'Total amount of coins in cash'**
  String get amountOfCoin;

  /// No description provided for @portfolio.
  ///
  /// In en, this message translates to:
  /// **'Portfolio'**
  String get portfolio;

  /// No description provided for @transactions.
  ///
  /// In en, this message translates to:
  /// **'Transactions'**
  String get transactions;

  /// No description provided for @details.
  ///
  /// In en, this message translates to:
  /// **'Details'**
  String get details;

  /// No description provided for @currentPrice.
  ///
  /// In en, this message translates to:
  /// **'Current Price'**
  String get currentPrice;

  /// No description provided for @variation24.
  ///
  /// In en, this message translates to:
  /// **'24H Variation'**
  String get variation24;

  /// No description provided for @quantity.
  ///
  /// In en, this message translates to:
  /// **'Quantity'**
  String get quantity;

  /// No description provided for @value.
  ///
  /// In en, this message translates to:
  /// **'Value'**
  String get value;

  /// No description provided for @buttonExchangeCoin.
  ///
  /// In en, this message translates to:
  /// **'Exchange Coin'**
  String get buttonExchangeCoin;

  /// No description provided for @balance.
  ///
  /// In en, this message translates to:
  /// **'Available Balance'**
  String get balance;

  /// No description provided for @conversionExchangeText.
  ///
  /// In en, this message translates to:
  /// **'How much would you like to exchange?'**
  String get conversionExchangeText;

  /// No description provided for @conversionHintText.
  ///
  /// In en, this message translates to:
  /// **'0.00'**
  String get conversionHintText;

  /// No description provided for @insertAAmount.
  ///
  /// In en, this message translates to:
  /// **'Please, enter the amount of the coin you want to exchange'**
  String get insertAAmount;

  /// No description provided for @insertAAmountAboveZero.
  ///
  /// In en, this message translates to:
  /// **'Please enter a value above 0'**
  String get insertAAmountAboveZero;

  /// No description provided for @insertAAmountAvailable.
  ///
  /// In en, this message translates to:
  /// **'Please enter a value below or equal to the amount owned'**
  String get insertAAmountAvailable;

  /// No description provided for @chooseTwoDifferentCoins.
  ///
  /// In en, this message translates to:
  /// **'Please, choose two different coins'**
  String get chooseTwoDifferentCoins;

  /// No description provided for @estimatedTotal.
  ///
  /// In en, this message translates to:
  /// **'Estimated Total'**
  String get estimatedTotal;

  /// No description provided for @valueWasntInformed.
  ///
  /// In en, this message translates to:
  /// **'Value wasn\'t informed'**
  String get valueWasntInformed;

  /// No description provided for @review.
  ///
  /// In en, this message translates to:
  /// **'Review'**
  String get review;

  /// No description provided for @reviewData.
  ///
  /// In en, this message translates to:
  /// **'Review the specifications of your conversion'**
  String get reviewData;

  /// No description provided for @convert.
  ///
  /// In en, this message translates to:
  /// **'Convert'**
  String get convert;

  /// No description provided for @get.
  ///
  /// In en, this message translates to:
  /// **'Get'**
  String get get;

  /// No description provided for @exchange.
  ///
  /// In en, this message translates to:
  /// **'Exchange'**
  String get exchange;

  /// No description provided for @finishExchange.
  ///
  /// In en, this message translates to:
  /// **'Finish Exchange'**
  String get finishExchange;

  /// No description provided for @conversion.
  ///
  /// In en, this message translates to:
  /// **'Conversion performed'**
  String get conversion;

  /// No description provided for @conversionSuccess.
  ///
  /// In en, this message translates to:
  /// **'Currency conversion successfully performed!'**
  String get conversionSuccess;

  /// No description provided for @bankDetails.
  ///
  /// In en, this message translates to:
  /// **'Bank Details'**
  String get bankDetails;

  /// No description provided for @bank.
  ///
  /// In en, this message translates to:
  /// **'Bank:'**
  String get bank;

  /// No description provided for @agency.
  ///
  /// In en, this message translates to:
  /// **'Agency:'**
  String get agency;

  /// No description provided for @subAccount.
  ///
  /// In en, this message translates to:
  /// **'Sub-account:'**
  String get subAccount;

  /// No description provided for @account.
  ///
  /// In en, this message translates to:
  /// **'Account:'**
  String get account;

  /// No description provided for @cd.
  ///
  /// In en, this message translates to:
  /// **'CD:'**
  String get cd;

  /// No description provided for @transactionDetails.
  ///
  /// In en, this message translates to:
  /// **'Transactions Details'**
  String get transactionDetails;

  /// No description provided for @exchangedCoin.
  ///
  /// In en, this message translates to:
  /// **'Exchanged Coin:'**
  String get exchangedCoin;

  /// No description provided for @exchangedQuantity.
  ///
  /// In en, this message translates to:
  /// **'Exchanged Quantity:'**
  String get exchangedQuantity;

  /// No description provided for @receivedCoin.
  ///
  /// In en, this message translates to:
  /// **'Received Coin:'**
  String get receivedCoin;

  /// No description provided for @receivedQuantity.
  ///
  /// In en, this message translates to:
  /// **'Received Quantity:'**
  String get receivedQuantity;

  /// No description provided for @monetaryValue.
  ///
  /// In en, this message translates to:
  /// **'Monetary Value:'**
  String get monetaryValue;

  /// No description provided for @transactionDate.
  ///
  /// In en, this message translates to:
  /// **'Transaction Date:'**
  String get transactionDate;
}

class _CryptoAppStringsDelegate extends LocalizationsDelegate<CryptoAppStrings> {
  const _CryptoAppStringsDelegate();

  @override
  Future<CryptoAppStrings> load(Locale locale) {
    return SynchronousFuture<CryptoAppStrings>(lookupCryptoAppStrings(locale));
  }

  @override
  bool isSupported(Locale locale) => <String>['en', 'pt'].contains(locale.languageCode);

  @override
  bool shouldReload(_CryptoAppStringsDelegate old) => false;
}

CryptoAppStrings lookupCryptoAppStrings(Locale locale) {


  // Lookup logic when only language code is specified.
  switch (locale.languageCode) {
    case 'en': return CryptoAppStringsEn();
    case 'pt': return CryptoAppStringsPt();
  }

  throw FlutterError(
    'CryptoAppStrings.delegate failed to load unsupported locale "$locale". This is likely '
    'an issue with the localizations generation tool. Please file an issue '
    'on GitHub with a reproducible sample app and the gen-l10n configuration '
    'that was used.'
  );
}
