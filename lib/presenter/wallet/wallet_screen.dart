import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class WalletScreen extends StatefulWidget {
  const WalletScreen({super.key});

  @override
  State<WalletScreen> createState() => _WalletScreenState();
}

class _WalletScreenState extends State<WalletScreen> {
  bool isHidden = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(
            label: 'Portfólio',
            icon: ImageIcon(
              AssetImage("assets/icons/warren_active.png"),
            ),
          ),
          BottomNavigationBarItem(
            label: "Movimentações",
            icon: ImageIcon(
              AssetImage("assets/icons/warren_inactive.png"),
            ),
          ),
        ],
      ),
      body: SafeArea(
        child: Column(
          children: [
            Container(
              margin: const EdgeInsets.only(
                top: 10,
                left: 15,
                right: 15,
                bottom: 30,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Cripto",
                        style: GoogleFonts.montserrat(
                          fontSize: 32,
                          color: const Color.fromARGB(255, 224, 43, 87),
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      IconButton(
                        padding: EdgeInsets.zero,
                        onPressed: () {
                          setState(() {
                            isHidden = !isHidden;
                          });
                        },
                        icon: Icon(
                          !isHidden ? Icons.visibility : Icons.visibility_off,
                          size: 22,
                        ),
                      ),
                    ],
                  ),
                  AnimatedSwitcher(
                    duration: const Duration(milliseconds: 250),
                    child: !isHidden
                        ? Text(
                            "R\$ 14.798,00",
                            style: GoogleFonts.montserrat(
                              fontSize: 32,
                              fontWeight: FontWeight.w700,
                            ),
                          )
                        : Container(
                            height: 39,
                            width: 210,
                            decoration: BoxDecoration(
                              color: Colors.grey.shade500,
                              borderRadius: BorderRadius.circular(5),
                            ),
                          ),
                  ),
                  Text(
                    "Valor total de moedas",
                    style: GoogleFonts.sourceSansPro(
                        fontSize: 17,
                        fontWeight: FontWeight.w400,
                        color: const Color.fromARGB(255, 117, 118, 128)),
                  )
                ],
              ),
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height * 0.65,
              child: ListView(
                physics: const BouncingScrollPhysics(),
                children: [
                  ListTile(
                    horizontalTitleGap: 0,
                    shape: const Border(
                      top: BorderSide(
                        color: Color.fromARGB(255, 227, 228, 235),
                      ),
                    ),
                    leading: ClipRRect(
                      borderRadius: BorderRadius.circular(100),
                      child: Image.asset(
                        "assets/icons/bitcoin.png",
                        height: 48,
                      ),
                    ),
                    title: Padding(
                      padding: const EdgeInsets.only(left: 8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "BTC",
                            style: GoogleFonts.sourceSansPro(
                              fontWeight: FontWeight.w400,
                              fontSize: 20,
                            ),
                          ),
                          AnimatedSwitcher(
                            duration: const Duration(milliseconds: 250),
                            child: !isHidden
                                ? Text(
                                    "R\$ 6.557,00",
                                    style: GoogleFonts.sourceSansPro(
                                      fontSize: 20,
                                      fontWeight: FontWeight.w400,
                                    ),
                                  )
                                : Container(
                                    height: 20,
                                    width: 95,
                                    decoration: BoxDecoration(
                                      color: Colors.grey.shade500,
                                      borderRadius: BorderRadius.circular(5),
                                    ),
                                  ),
                          ),
                        ],
                      ),
                    ),
                    subtitle: Padding(
                      padding: const EdgeInsets.only(top: 4.0, left: 8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Bitcoin",
                            style: GoogleFonts.sourceSansPro(
                              fontWeight: FontWeight.w400,
                              fontSize: 15,
                            ),
                          ),
                          Text(
                            "0.65 BTC",
                            style: GoogleFonts.sourceSansPro(
                              fontSize: 15,
                              fontWeight: FontWeight.w400,
                            ),
                          )
                        ],
                      ),
                    ),
                    trailing: Column(
                      children: const [
                        Padding(
                          padding: EdgeInsets.only(
                            top: 2,
                            bottom: 6,
                            left: 9,
                            right: 8,
                          ),
                          child: Icon(
                            Icons.chevron_right,
                            size: 24,
                            color: Color.fromARGB(255, 117, 118, 128),
                          ),
                        ),
                      ],
                    ),
                  ),
                  ListTile(
                    horizontalTitleGap: 0,
                    shape: const Border(
                      top: BorderSide(
                        color: Color.fromARGB(255, 227, 228, 235),
                      ),
                    ),
                    leading: ClipRRect(
                      borderRadius: BorderRadius.circular(100),
                      child: Image.asset(
                        "assets/icons/ethereum.png",
                        height: 48,
                      ),
                    ),
                    title: Padding(
                      padding: const EdgeInsets.only(left: 8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "ETH",
                            style: GoogleFonts.sourceSansPro(
                              fontWeight: FontWeight.w400,
                              fontSize: 20,
                            ),
                          ),
                          AnimatedSwitcher(
                            duration: const Duration(milliseconds: 250),
                            child: !isHidden
                                ? Text(
                                    "R\$ 7.996,00",
                                    style: GoogleFonts.sourceSansPro(
                                      fontSize: 20,
                                      fontWeight: FontWeight.w400,
                                    ),
                                  )
                                : Container(
                                    height: 20,
                                    width: 95,
                                    decoration: BoxDecoration(
                                      color: Colors.grey.shade500,
                                      borderRadius: BorderRadius.circular(5),
                                    ),
                                  ),
                          ),
                        ],
                      ),
                    ),
                    subtitle: Padding(
                      padding: const EdgeInsets.only(
                        top: 4.0,
                        left: 8,
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Ethereum",
                            style: GoogleFonts.sourceSansPro(
                              fontWeight: FontWeight.w400,
                              fontSize: 15,
                            ),
                          ),
                          Text(
                            "0.94 ETH",
                            style: GoogleFonts.sourceSansPro(
                              fontSize: 15,
                              fontWeight: FontWeight.w400,
                            ),
                          )
                        ],
                      ),
                    ),
                    trailing: Column(
                      children: const [
                        Padding(
                          padding: EdgeInsets.only(
                            top: 2,
                            bottom: 6,
                            left: 9,
                            right: 4,
                          ),
                          child: Icon(
                            Icons.chevron_right,
                            size: 24,
                            color: Color.fromARGB(255, 117, 118, 128),
                          ),
                        ),
                      ],
                    ),
                  ),
                  ListTile(
                    horizontalTitleGap: 0,
                    shape: const Border(
                      top: BorderSide(
                        color: Color.fromARGB(255, 227, 228, 235),
                      ),
                    ),
                    leading: ClipRRect(
                      borderRadius: BorderRadius.circular(100),
                      child: Image.asset(
                        "assets/icons/litecoin.png",
                        height: 48,
                      ),
                    ),
                    title: Padding(
                      padding: const EdgeInsets.only(left: 8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "LTC",
                            style: GoogleFonts.sourceSansPro(
                              fontWeight: FontWeight.w400,
                              fontSize: 20,
                            ),
                          ),
                          AnimatedSwitcher(
                            duration: const Duration(milliseconds: 250),
                            child: !isHidden
                                ? Text(
                                    "R\$ 245,00",
                                    style: GoogleFonts.sourceSansPro(
                                      fontSize: 20,
                                      fontWeight: FontWeight.w400,
                                    ),
                                  )
                                : Container(
                                    height: 20,
                                    width: 79,
                                    decoration: BoxDecoration(
                                      color: Colors.grey.shade500,
                                      borderRadius: BorderRadius.circular(5),
                                    ),
                                  ),
                          ),
                        ],
                      ),
                    ),
                    subtitle: Padding(
                      padding: const EdgeInsets.only(top: 4.0, left: 8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Litecoin",
                            style: GoogleFonts.sourceSansPro(
                              fontWeight: FontWeight.w400,
                              fontSize: 15,
                            ),
                          ),
                          Text(
                            "0.82 LTC",
                            style: GoogleFonts.sourceSansPro(
                              fontSize: 15,
                              fontWeight: FontWeight.w400,
                            ),
                          )
                        ],
                      ),
                    ),
                    trailing: Column(
                      children: const [
                        Padding(
                          padding: EdgeInsets.only(
                            top: 2,
                            bottom: 6,
                            left: 9,
                            right: 4,
                          ),
                          child: Icon(
                            Icons.chevron_right,
                            size: 24,
                            color: Color.fromARGB(255, 117, 118, 128),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
