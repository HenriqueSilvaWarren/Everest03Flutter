import 'package:card_02_listagem_crypto/app/presenter/screens/conversion/conversion_screen.dart';
import 'package:card_02_listagem_crypto/app/presenter/screens/details/details_screen.dart';
import 'package:card_02_listagem_crypto/core/converters/decimal_converter.dart';
import 'package:card_02_listagem_crypto/core/converters/list_decimal_converter.dart';
import 'package:card_02_listagem_crypto/core/route_definitions.dart';
import 'package:decimal/decimal.dart';
import 'package:flutter/material.dart';

class SetupCore extends StatelessWidget {
  const SetupCore({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var decimalConverter = const DecimalConverter();

    decimalConverter.fromJson(1);
    decimalConverter.toJson(Decimal.one);

    var listViewConverter = const ListDecimalConverter();

    listViewConverter.fromJson([]);
    listViewConverter.toJson([]);

    routeDefinitions[DetailsScreen.route];
    routeDefinitions[ConversionScreen.route];
    
    return SizedBox.shrink();
  }
}
