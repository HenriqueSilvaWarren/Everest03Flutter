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
    return ListTile(
      title: Text(
        title,
        style: GoogleFonts.sourceSansPro(
          fontSize: 19,
          color: Colors.grey,
        ),
      ),
      trailing: AnimatedHideTextValue(
        text: value,
        style: GoogleFonts.sourceSansPro(
          fontSize: 23,
        ),
      ),
      contentPadding: EdgeInsets.zero,
      shape: const Border(
        top: BorderSide(
          color: Color.fromRGBO(227, 228, 235, 1),
        ),
      ),
    );

    Column(
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
