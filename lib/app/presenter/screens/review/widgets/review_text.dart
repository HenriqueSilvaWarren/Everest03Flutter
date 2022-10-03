import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ReviewText extends StatelessWidget {
  const ReviewText({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 32.0),
      child: Text(
        'Revise os dados da sua conversão',
        style: GoogleFonts.sourceSansPro(
          fontSize: 34,
          fontWeight: FontWeight.w700,
        ),
      ),
    );
  }
}