import 'package:brasil_fields/brasil_fields.dart';
import 'package:card_02_listagem_crypto/presenter/riverpod/hide_monetary_values.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../../shared/app_assets.dart';

class BodyWalletScreen extends StatefulHookConsumerWidget {
  const BodyWalletScreen({
    Key? key,
  }) : super(key: key);

  @override
  ConsumerState<BodyWalletScreen> createState() => _BodyWalletScreenState();
}

class _BodyWalletScreenState extends ConsumerState<BodyWalletScreen> {
  @override
  Widget build(BuildContext context) {
   bool isHidden = ref.watch(hideMonetaryValuesStateProvider);
    return SafeArea(
      child: Column(
        children: [
          TotalCurrencyCard(isHidden: isHidden),
          Expanded(
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
                      bitcoinImage,
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
                                  UtilBrasilFields.obterReal(6557),
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
                        AnimatedSwitcher(
                          duration: const Duration(milliseconds: 250),
                          child: !isHidden
                              ? Text(
                                  "0.65 BTC",
                                  style: GoogleFonts.sourceSansPro(
                                    fontSize: 15,
                                    fontWeight: FontWeight.w400,
                                  ),
                                )
                              : Container(
                                  height: 15,
                                  width: 54,
                                  decoration: BoxDecoration(
                                    color: Colors.grey.shade500,
                                    borderRadius: BorderRadius.circular(5),
                                  ),
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
                      ethereumImage,
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
                                  UtilBrasilFields.obterReal(7996),
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
                        AnimatedSwitcher(
                          duration: const Duration(milliseconds: 250),
                          child: !isHidden
                              ? Text(
                                  "0.94 ETH",
                                  style: GoogleFonts.sourceSansPro(
                                    fontSize: 15,
                                    fontWeight: FontWeight.w400,
                                  ),
                                )
                              : Container(
                                  height: 15,
                                  width: 55,
                                  decoration: BoxDecoration(
                                    color: Colors.grey.shade500,
                                    borderRadius: BorderRadius.circular(5),
                                  ),
                                ),
                        ),
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
                      litecoinImage,
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
                                  UtilBrasilFields.obterReal(245),
                                  style: GoogleFonts.sourceSansPro(
                                    fontSize: 20,
                                    fontWeight: FontWeight.w400,
                                  ),
                                )
                              : Container(
                                  height: 20,
                                  width: 80,
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
                        AnimatedSwitcher(
                          duration: const Duration(milliseconds: 250),
                          child: !isHidden
                              ? Text(
                                  "0.82 LTC",
                                  style: GoogleFonts.sourceSansPro(
                                    fontSize: 15,
                                    fontWeight: FontWeight.w400,
                                  ),
                                )
                              : Container(
                                  height: 15,
                                  width: 51,
                                  decoration: BoxDecoration(
                                    color: Colors.grey.shade500,
                                    borderRadius: BorderRadius.circular(5),
                                  ),
                                ),
                        ),
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
    );
  }
}

class TotalCurrencyCard extends StatelessWidget {
  const TotalCurrencyCard({
    Key? key,
    required this.isHidden,
  }) : super(key: key);

  final bool isHidden;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(
        top: 10,
        left: 15,
        right: 15,
        bottom: 30,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(bottom: 8.0),
            child: Row(
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
                  tooltip: "Esconder valores monetários",
                  padding: EdgeInsets.zero,
                  constraints: const BoxConstraints(),
                  onPressed: () {
                    // setState(() {
                    //   isHidden = !isHidden;
                    // });
                  },
                  icon: Icon(
                    !isHidden ? Icons.visibility : Icons.visibility_off,
                    size: 22,
                  ),
                ),
              ],
            ),
          ),
          AnimatedSwitcher(
            duration: const Duration(milliseconds: 250),
            child: !isHidden
                ? Text(
                    UtilBrasilFields.obterReal(14798),
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
    );
  }
}
