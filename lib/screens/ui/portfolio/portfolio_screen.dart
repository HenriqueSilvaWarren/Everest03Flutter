import 'package:flutter/material.dart';

import 'widgets/body_portfolio_screen.dart';

class PortfolioScreen extends StatelessWidget {
  const PortfolioScreen({super.key});

  static String route = '/portfolio-screen';

  @override
  Widget build(BuildContext context) {
    return BodyPortfolioScreen();
  }
}
