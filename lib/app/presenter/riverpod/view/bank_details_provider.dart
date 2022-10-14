import 'package:hooks_riverpod/hooks_riverpod.dart';

final bankDetailsProvider = Provider(
  (ref) => {
    'bank': '399 - HSBC BANK BRASIL',
    'agency': '0841 - HSBC',
    'subAccount': '55',
    'account': '0040000', 
    'dv': '27'
  },
);
