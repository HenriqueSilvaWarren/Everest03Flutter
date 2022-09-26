import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shimmer/shimmer.dart';

import 'animated_hide_text_value.dart';
import 'get_real.dart';

class LoadingMonetaryValue extends StatelessWidget {
  const LoadingMonetaryValue({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Shimmer(
      gradient: LinearGradient(
        colors: [
          Colors.grey.shade300,
          Colors.grey.shade200,
        ],
      ),
      child: AnimatedHideTextValue(
        text: getReal(0),
        style: GoogleFonts.montserrat(
          fontSize: 32,
          fontWeight: FontWeight.w700,
        ),
      ),
    );
  }
}
