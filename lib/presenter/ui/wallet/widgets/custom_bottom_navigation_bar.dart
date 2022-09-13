import 'package:flutter/material.dart';

import '../../../../shared/app_assets.dart';

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

class IconFromAssetWidget extends StatelessWidget {
  const IconFromAssetWidget({
    Key? key,
    required this.asset,
  }) : super(key: key);

  final String asset;

  @override
  Widget build(BuildContext context) {
    return ImageIcon(
      AssetImage(
        asset,
      ),
    );
  }
}
