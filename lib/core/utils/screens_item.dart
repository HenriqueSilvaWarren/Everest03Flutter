import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'animated_hide_text_value.dart';


class ScreensItem extends StatelessWidget {
  const ScreensItem({Key? key, required this.title, required this.value})
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
          fontSize: 19,
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
