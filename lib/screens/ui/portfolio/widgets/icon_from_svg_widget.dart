import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_svg/parser.dart';

class IconFromSvgWidget extends StatelessWidget {
  const IconFromSvgWidget({
    Key? key,
    required this.asset,
  }) : super(key: key);

  final String asset;

  @override
  Widget build(BuildContext context) {
    return SvgPicture.asset(
      asset
    );
  }
}
