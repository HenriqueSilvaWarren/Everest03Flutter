import 'package:decimal/decimal.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'custom_divider.dart';

class DetailsScreenCardVariation extends StatelessWidget {
  const DetailsScreenCardVariation({
    Key? key,
    required this.latestPrices,
  }) : super(key: key);

  final List<FlSpot> latestPrices;

  @override
  Widget build(BuildContext context) {
    Decimal variation = Decimal.parse(
        (((latestPrices.last.y / latestPrices[latestPrices.length - 2].y) - 1) *
                100)
            .toString());
    return Column(
      children: [
        const CustomDivider(),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Variação 24H',
                style: GoogleFonts.sourceSansPro(
                  fontSize: 20,
                  color: Colors.grey,
                ),
              ),
              Text(
                '${variation > Decimal.zero ? '+' : ''}${variation.toStringAsFixed(2)}%',
                style: GoogleFonts.sourceSansPro(
                  fontSize: 23,
                  fontWeight: FontWeight.w700,
                  color: variation > Decimal.zero
                      ? const Color.fromARGB(255, 62, 205, 26)
                      : const Color.fromRGBO(205, 26, 26, 1),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
