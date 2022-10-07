import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final localeStateProvider = StateProvider((ref) {
  List<String> initialLocale = Platform.localeName.split('_');
  return Locale(initialLocale[0], initialLocale[1]);
});
