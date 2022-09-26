import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../app/presenter/riverpod/view/hide_values.dart';



class AnimatedHideTextValue extends HookConsumerWidget {
  const AnimatedHideTextValue({
    Key? key,
    required this.text,
    required this.style,
  }) : super(key: key);

  final String text;
  final TextStyle style;

  Size _getTextSize(String text, TextStyle style) {
    final TextPainter textPainter = TextPainter(
        text: TextSpan(text: text, style: style),
        maxLines: 1,
        textDirection: TextDirection.ltr)
      ..layout(minWidth: 0, maxWidth: double.infinity);
    return textPainter.size;
  }

  Size get txtSize => _getTextSize(text, style);
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    bool isHidden = ref.watch(hideValuesStateProvider);
    return AnimatedSwitcher(
      duration: const Duration(milliseconds: 250),
      child: !isHidden
          ? Text(
              text,
              style: style,
            )
          : Container(
              height: txtSize.height,
              width: txtSize.width,
              decoration: BoxDecoration(
                color: Colors.grey.shade500,
                borderRadius: BorderRadius.circular(5),
              ),
            ),
    );
  }
}
