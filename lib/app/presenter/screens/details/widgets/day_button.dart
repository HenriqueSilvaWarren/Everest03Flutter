import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class DayButton extends HookConsumerWidget {
  const DayButton({Key? key, required this.text, required this.selectedIndex})
      : super(key: key);

  final String text;

  final bool selectedIndex;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
      alignment: Alignment.center,
      width: text.length == 2 ? 32 : 40,
      decoration: BoxDecoration(
        color: selectedIndex
            ? const Color.fromRGBO(227, 228, 235, 1)
            : Colors.transparent,
        borderRadius: BorderRadius.circular(4),
      ),
      child: Text(
        text,
        style: const TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.w700,
        ),
      ),
    );
  }
}
