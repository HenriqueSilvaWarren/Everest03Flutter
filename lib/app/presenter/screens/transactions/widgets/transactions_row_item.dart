import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TransactionRowItem extends StatelessWidget {
  const TransactionRowItem({
    Key? key,
    required this.firstText,
    required this.secondText,
  }) : super(key: key);

  final String firstText;
  final String secondText;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          firstText,
          style: GoogleFonts.sourceSansPro(fontSize: 11),
        ),
        const SizedBox(
          width: 5,
        ),
        Text(
          secondText,
          style: GoogleFonts.sourceSansPro(
            fontSize: 11,
            fontWeight: FontWeight.w600,
          ),
        ),
      ],
    );
  }
}
