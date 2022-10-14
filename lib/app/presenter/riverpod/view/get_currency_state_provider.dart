import 'dart:io';

import 'package:hooks_riverpod/hooks_riverpod.dart';

final getCurrencyStateProvider = StateProvider<String>(
  (ref) => Platform.localeName == 'pt_BR' ? 'brl' : 'usd',
);
