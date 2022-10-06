import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class DialogTransactionDetailsRow extends StatelessWidget {
  const DialogTransactionDetailsRow({
    Key? key,
    required this.firstText,
    required this.secondText,
  }) : super(key: key);

  final String firstText;
  final String secondText;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              firstText,
              style: GoogleFonts.sourceSansPro(fontSize: 14),
            ),
            Flexible(
              child: Padding(
                padding: const EdgeInsets.only(left: 8.0),
                child: Text(
                  secondText,
                  style: GoogleFonts.sourceSansPro(
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                  ),
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ),
          ],
        ),
        const SizedBox(height: 5),
      ],
    );
  }
}
