import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class DetailsScreen extends StatefulWidget {
  const DetailsScreen({Key? key}) : super(key: key);

  static String route = '/details-screen';

  @override
  State<DetailsScreen> createState() => _DetailsScreenState();
}

class _DetailsScreenState extends State<DetailsScreen> {
  @override
  Widget build(BuildContext context) {
    final Map<String, dynamic> detailsArgs =
        ModalRoute.of(context)?.settings.arguments as Map<String, dynamic>;

    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.black),
        title: const Text(
          'Detalhes',
        ),
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
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  detailsArgs['cryptoName'],
                  style: GoogleFonts.sourceSansPro(
                      fontWeight: FontWeight.w700, fontSize: 32),
                ),
                ClipRRect(
                  borderRadius: BorderRadius.circular(100),
                  child: Image.network(
                    detailsArgs['cryptoImage'],
                    height: 48,
                  ),
                ),
              ],
            ),
            Text(
              detailsArgs['cryptoSymbol'],
              style: GoogleFonts.sourceSansPro(
                  color: Colors.grey,
                  fontSize: 18
              ),
            ),
          ],
        ),
      ),
    );
  }
}
