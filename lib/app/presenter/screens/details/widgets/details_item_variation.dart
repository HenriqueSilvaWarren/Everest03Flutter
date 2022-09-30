import 'package:decimal/decimal.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:intl/intl.dart';

import '../../../../../core/utils/animated_hide_text_value.dart';

class DetailsItemVariation extends StatefulHookConsumerWidget {
  const DetailsItemVariation({
    Key? key,
    required this.cryptoPricesList,
  }) : super(key: key);

  final List<Decimal> cryptoPricesList;

  @override
  ConsumerState<DetailsItemVariation> createState() =>
      _DetailsItemVariationState();
}

class _DetailsItemVariationState extends ConsumerState<DetailsItemVariation> {
  late List<Decimal> latestPrices;

  @override
  void initState() {
    super.initState();
    latestPrices = widget.cryptoPricesList;
  }

  @override
  Widget build(BuildContext context) {
    final formatter =
        NumberFormat.decimalPercentPattern(locale: 'pt_BR', decimalDigits: 2);
    Decimal variation = Decimal.parse(
      ((latestPrices[latestPrices.length - 1] /
                      latestPrices[latestPrices.length - 2])
                  .toDouble() -
              Decimal.one.toDouble())
          .toString(),
    );
    return ListTile(
      title: Text(
        'Variação 24H',
        style: GoogleFonts.sourceSansPro(
          fontSize: 19,
          color: Colors.grey,
        ),
      ),
      trailing: AnimatedHideTextValue(
        text:
            ('${variation > Decimal.zero ? '+' : ''}${formatter.format(variation.toDouble())}'),
        style: GoogleFonts.sourceSansPro(
          fontSize: 23,
          fontWeight: FontWeight.w700,
          color: variation >= Decimal.zero
              ? const Color.fromARGB(255, 62, 205, 26)
              : const Color.fromRGBO(205, 26, 26, 1),
        ),
      ),
      contentPadding: EdgeInsets.zero,
      shape: const Border(
        top: BorderSide(
          color: Color.fromRGBO(227, 228, 235, 1),
        ),
      ),
    );
  }
}
