import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart' show timeDilation;

import 'widgets/body_exchanged_screen.dart';
import 'widgets/exchanged_app_bar.dart';

class ExchangedScreen extends StatefulWidget {
  const ExchangedScreen({Key? key}) : super(key: key);

  static String route = '/exchanged-screen';

  @override
  State<ExchangedScreen> createState() => _ExchangedScreenState();
}

class _ExchangedScreenState extends State<ExchangedScreen>
    with SingleTickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    timeDilation = 1;
    return const Scaffold(
      appBar: ExchangedAppBar(),
      body: BodyExchangedScreen(),
    );
  }
}
