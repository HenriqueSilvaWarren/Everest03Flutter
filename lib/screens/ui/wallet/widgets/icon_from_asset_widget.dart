import 'package:flutter/material.dart';

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
