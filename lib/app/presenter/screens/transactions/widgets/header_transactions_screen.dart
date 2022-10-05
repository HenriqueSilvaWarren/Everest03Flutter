import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class HeaderTransactionsScreen extends StatelessWidget {
  const HeaderTransactionsScreen({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 24.0),
      child: Text(
        'Movimentações',
        style: GoogleFonts.sourceSansPro(
          fontSize: 32,
          fontWeight: FontWeight.w700,
        ),
      ),
    );
  }
}
