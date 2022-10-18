
import 'package:flutter/material.dart';

class DummyTestRoute extends StatelessWidget {
  final String routeName;
  const DummyTestRoute({Key? key, required this.routeName}) : super(key: key);

  @override
  Widget build(BuildContext context) => Text(routeName);
}
