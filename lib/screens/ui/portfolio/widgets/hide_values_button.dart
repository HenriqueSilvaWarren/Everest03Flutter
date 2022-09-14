import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../riverpod/hide_values.dart';

class HideValuesButton extends HookConsumerWidget {
  const HideValuesButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    bool isHidden = ref.watch(hideValuesStateProvider);
    return IconButton(
      tooltip: "Esconder valores monetários",
      padding: EdgeInsets.zero,
      constraints: const BoxConstraints(),
      onPressed: () {
        ref.read(hideValuesStateProvider.state).state = !isHidden;
      },
      icon: Icon(
        !isHidden ? Icons.visibility : Icons.visibility_off,
        size: 22,
      ),
    );
  }
}
