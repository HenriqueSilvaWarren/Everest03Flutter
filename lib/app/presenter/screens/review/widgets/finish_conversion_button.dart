import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../exchanged/exchanged_screen.dart';

class FinishConversionButton extends StatelessWidget {
  const FinishConversionButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 24.0),
      child: InkWell(
        onTap: () {
          Navigator.of(context).pushNamed(
            ExchangedScreen.route,
          );
        },
        child: Container(
          alignment: Alignment.center,
          width: MediaQuery.of(context).size.width,
          height: 56,
          decoration: BoxDecoration(
            color: const Color.fromRGBO(224, 43, 87, 1),
            borderRadius: BorderRadius.circular(8),
          ),
          child: Text(
            'Concluir conversão',
            style: GoogleFonts.sourceSansPro(
              fontSize: 17,
              fontWeight: FontWeight.w700,
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }
}
