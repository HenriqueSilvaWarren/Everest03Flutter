import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'hide_values_button.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar({
    Key? key,
    required this.doesHide,
    required this.text,
  }) : super(key: key);

  final String text;
  final bool doesHide;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      iconTheme: const IconThemeData(color: Colors.black),
      title: Text(
        text,
      ),
      actions: [
        Visibility(
          visible: doesHide,
          replacement: const SizedBox.shrink(),
          child: const Padding(
            padding: EdgeInsets.only(right: 20),
            child: HideValuesButton(),
          ),
        )
      ],
      backgroundColor: Colors.white,
      elevation: 0,
      shape: Border(
        bottom: BorderSide(
          color: Colors.grey.shade300,
        ),
      ),
      titleTextStyle: GoogleFonts.sourceSansPro(
        color: Colors.black,
        fontWeight: FontWeight.w700,
        fontSize: 20,
      ),
    );
  }

  @override
  Size get preferredSize => const Size(double.maxFinite, 56);
}
