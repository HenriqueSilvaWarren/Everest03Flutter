import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class WalletScreen extends StatefulWidget {
  const WalletScreen({super.key});

  @override
  State<WalletScreen> createState() => _WalletScreenState();
}

class _WalletScreenState extends State<WalletScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
            margin: const EdgeInsets.symmetric(
              horizontal: 15,
              vertical: 30,
            ),
            child: Padding(
              padding: const EdgeInsets.only(
                left: 16,
                right: 16,
                bottom: 24,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Carteira",
                        style: GoogleFonts.montserrat(
                          fontSize: 32,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      IconButton(
                        padding: EdgeInsets.zero,
                        onPressed: () {},
                        icon: const Icon(
                          Icons.remove_red_eye,
                          size: 22,
                        ),
                      ),
                    ],
                  ),
                  Text(
                    "U\$ 1.000,0",
                    style: GoogleFonts.montserrat(
                      fontSize: 32,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height * 0.7,
            child: ListView(
              children: [
                ListTile(
                  leading: const CircleAvatar(
                    backgroundColor: Color.fromARGB(255, 47, 47, 51),
                  ),
                  title: Text(
                    "ETH",
                    style: GoogleFonts.sourceSansPro(
                      fontWeight: FontWeight.w400,
                      fontSize: 20,
                    ),
                  ),
                  subtitle: Text(
                    "Ethereum",
                    style: GoogleFonts.sourceSansPro(
                      fontWeight: FontWeight.w400,
                      fontSize: 15,
                    ),
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
