import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ButtonConvertCurrency extends StatelessWidget {
  const ButtonConvertCurrency({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 20.0),
      child: MaterialButton(
        elevation: 0,
        highlightElevation: 0,
        color: const Color.fromRGBO(238, 46, 93, 1),
        padding: EdgeInsets.zero,
        onPressed: () {},
        child: Container(
          alignment: Alignment.center,
          width: MediaQuery.of(context).size.width,
          height: 56,
          decoration: BoxDecoration(borderRadius: BorderRadius.circular(8)),
          child: Text(
            "Converter moeda",
            style: GoogleFonts.sourceSansPro(
              fontSize: 20,
              fontWeight: FontWeight.w700,
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }
}
