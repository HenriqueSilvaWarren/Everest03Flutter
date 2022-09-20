import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../core/utils/animated_hide_text_value.dart';
import 'custom_divider.dart';

class DetailsItem extends StatelessWidget {
  const DetailsItem({Key? key, required this.title, required this.value})
      : super(key: key);

  final String title;
  final String value;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const CustomDivider(),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                title,
                style: GoogleFonts.sourceSansPro(
                  fontSize: 20,
                  color: Colors.grey,
                ),
              ),
              AnimatedHideTextValue(
                text: value,
                style: GoogleFonts.sourceSansPro(
                  fontSize: 23,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}