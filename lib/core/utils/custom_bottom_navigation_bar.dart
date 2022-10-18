import 'package:flutter/material.dart';

import '../../app/presenter/screens/portfolio/widgets/icon_from_svg_widget.dart';
import '../../l10n/app_localizations.dart';
import '../app_assets.dart';

class CustomBottomNavigationBar extends StatelessWidget {
  const CustomBottomNavigationBar(
      {Key? key, required this.curIndex, required this.onTap})
      : super(key: key);

  final int curIndex;
  final Function(int) onTap;

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      selectedItemColor: const Color.fromARGB(255, 224, 43, 87),
      onTap: onTap,
      currentIndex: curIndex,
      items: [
        BottomNavigationBarItem(
          label: CryptoAppStrings.of(context)!.portfolio,
          icon: IconFromSvgWidget(
            key: const Key('warrenInactive'),
            asset: warrenInactiveIcon,
          ),
          activeIcon: IconFromSvgWidget(
            key: const Key('warrenActive'),
            asset: warrenActiveIcon,
          ),
        ),
        BottomNavigationBarItem(
          label: CryptoAppStrings.of(context)!.transactions,
          icon: IconFromSvgWidget(
            key: const Key('movInactive'),
            asset: movInactiveIcon,
          ),
          activeIcon: IconFromSvgWidget(
            key: const Key('movActive'),
            asset: movActiveIcon,
          ),
        ),
      ],
    );
  }
}
