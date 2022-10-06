import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class DialogNamedSection extends StatelessWidget {
  const DialogNamedSection({
    Key? key,
    required this.title,
    required this.child,
  }) : super(key: key);

  final String title;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      fit: StackFit.passthrough,
      children: [
        Container(
          width: double.infinity,
          padding: const EdgeInsets.all(10),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5),
            border: Border.all(
              color: Colors.blueGrey.shade100,
            ),
          ),
          child: child,
        ),
        Positioned(
          left: 5,
          top: -8,
          child: Text(
            title,
            style: GoogleFonts.sourceSansPro(
              backgroundColor: Colors.white,
              fontSize: 12,
              color: Colors.blueGrey.shade400,
            ),
          ),
        )
      ],
    );
  }
}
