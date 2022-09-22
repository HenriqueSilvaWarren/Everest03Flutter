import 'package:card_02_listagem_crypto/screens/riverpod/get_crypto_model_for_details_screen.dart';
import 'package:decimal/decimal.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:intl/intl.dart';

import '../../../../core/utils/animated_hide_text_value.dart';

class DetailsScreenCardVariation extends StatefulHookConsumerWidget {
  const DetailsScreenCardVariation({
    Key? key,
  }) : super(key: key);

  @override
  ConsumerState<DetailsScreenCardVariation> createState() => _DetailsScreenCardVariationState();
}

class _DetailsScreenCardVariationState extends ConsumerState<DetailsScreenCardVariation> {
  late List<FlSpot> latestPrices;
  
  @override
  void initState() {
    super.initState();
    latestPrices = ref.read(getCryptoModelForDetailsScreen).prices['5D']!;
  }
  @override
  Widget build(BuildContext context) {
    final formatter =
        NumberFormat.decimalPercentPattern(locale: 'pt_BR', decimalDigits: 2);
    Decimal variation = Decimal.parse(
      ((latestPrices[latestPrices.length - 1].y /
                      latestPrices[latestPrices.length - 2].y) -
                  1)
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
