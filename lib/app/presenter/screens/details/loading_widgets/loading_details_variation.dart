import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shimmer/shimmer.dart';

import '../../../../../core/utils/animated_hide_text_value.dart';

class LoadingDetailsItemVariation extends StatelessWidget {
  const LoadingDetailsItemVariation({
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
        text: ('0.00%'),
        style: GoogleFonts.sourceSansPro(
          fontSize: 23,
          fontWeight: FontWeight.w700,
        ),
      ),
    );
  }
}
