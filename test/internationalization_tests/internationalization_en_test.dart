import 'package:flutter/cupertino.dart';
import 'package:flutter_test/flutter_test.dart';

import '../helpers/internationalization_widget_tester.dart';
import '../helpers/setupl10n.dart';

void main() {
  testWidgets(
    'testing support to en internationalization',
    (tester) async {
      await tester.pumpWidget(
        const InternationalizationWidgetTester(
          locale: Locale('en', 'US'),
          child: Setupl10n(),
        ),
      );

      expect(find.text('en-US'), findsOneWidget);

      expect(find.text('US\$ '), findsOneWidget);

      expect(find.text('MM/dd/yyyy'), findsOneWidget);

      expect(find.text('Crypto'), findsOneWidget);

      expect(find.text('Change Language'), findsOneWidget);

      expect(find.text('Total amount of coins in cash'), findsOneWidget);

      expect(find.text('Portfolio'), findsOneWidget);

      expect(find.text('Transactions'), findsOneWidget);

      expect(find.text('Details'), findsOneWidget);

      expect(find.text('Current Price'), findsOneWidget);

      expect(find.text('24H Variation'), findsOneWidget);

      expect(find.text('Quantity'), findsOneWidget);

      expect(find.text('Value'), findsOneWidget);

      expect(find.text('Exchange Coin'), findsOneWidget);

      expect(find.text('Available Balance'), findsOneWidget);

      expect(find.text('How much would you like to exchange?'), findsOneWidget);

      expect(find.text('0.00'), findsOneWidget);

      expect(
          find.text(
              'Please, enter the amount of the coin you want to exchange'),
          findsOneWidget);

      expect(find.text('Please enter a value above 0'), findsOneWidget);

      expect(
          find.text('Please enter a value below or equal to the amount owned'),
          findsOneWidget);

      expect(find.text('Please, choose two different coins'), findsOneWidget);

      expect(find.text('Estimated Total'), findsOneWidget);

      expect(find.text('Value wasn\'t informed'), findsOneWidget);

      expect(find.text('Review'), findsOneWidget);

      expect(find.text('Review the specifications of your conversion'),
          findsOneWidget);

      expect(find.text('Convert'), findsOneWidget);

      expect(find.text('Get'), findsOneWidget);

      expect(find.text('Exchange'), findsOneWidget);

      expect(find.text('Finish Exchange'), findsOneWidget);

      expect(find.text('Conversion performed'), findsOneWidget);

      expect(find.text('Currency conversion successfully performed!'),
          findsOneWidget);

      expect(find.text('Bank Details'), findsOneWidget);

      expect(find.text('Bank:'), findsOneWidget);

      expect(find.text('Agency:'), findsOneWidget);

      expect(find.text('Sub-account:'), findsOneWidget);

      expect(find.text('Account:'), findsOneWidget);

      expect(find.text('CD:'), findsOneWidget);

      expect(find.text('Transactions Details'), findsOneWidget);

      expect(find.text('Exchanged Coin:'), findsOneWidget);

      expect(find.text('Exchanged Quantity:'), findsOneWidget);

      expect(find.text('Received Coin:'), findsOneWidget);

      expect(find.text('Received Quantity:'), findsOneWidget);

      expect(find.text('Monetary Value:'), findsOneWidget);

      expect(find.text('Transaction Date:'), findsOneWidget);
    },
  );
}
