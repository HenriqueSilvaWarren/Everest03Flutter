import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../core/utils/hide_values_button.dart';

class DetailsAppBar extends StatelessWidget implements PreferredSizeWidget{
  const DetailsAppBar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      iconTheme: const IconThemeData(color: Colors.black),
      title: const Text(
        'Detalhes',
      ),
      actions: const [
        Padding(
          padding: EdgeInsets.only(right: 20),
          child: HideValuesButton(),
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
        fontSize: 22,
      ),
    );
  }
  
  @override
  Size get preferredSize => const Size(double.maxFinite, 56);
}
