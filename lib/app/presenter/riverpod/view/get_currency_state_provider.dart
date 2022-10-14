import 'locale_state_provider.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final getCurrencyStateProvider = StateProvider<String>(
  (ref) => ref.watch(localeStateProvider) == const Locale('pt', 'BR')
      ? 'brl'
      : 'usd',
);
