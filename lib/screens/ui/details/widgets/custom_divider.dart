import 'package:flutter/material.dart';

class CustomDivider extends StatelessWidget {
  const CustomDivider({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 1,
      width: MediaQuery.of(context).size.width,
      child: ColoredBox(color: Colors.grey.shade300),
    );
  }
}


