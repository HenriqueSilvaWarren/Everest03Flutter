import 'package:flutter/material.dart';

import '../../../../core/app_assets.dart';
import 'icon_from_asset_widget.dart';

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
          label: 'Portfólio',
          icon: IconFromAssetWidget(
            asset: warrenInactiveIcon,
          ),
          activeIcon: IconFromAssetWidget(
            asset: warrenActiveIcon,
          ),
        ),
        BottomNavigationBarItem(
          label: "Movimentações",
          icon: IconFromAssetWidget(
            asset: movInactiveIcon,
          ),
          activeIcon: IconFromAssetWidget(
            asset: movActiveIcon,
          ),
        ),
      ],
    );
  }
}

