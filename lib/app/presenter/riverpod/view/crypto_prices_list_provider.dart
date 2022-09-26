import 'package:decimal/decimal.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final cryptoPricesListProvider = StateProvider<List<Decimal>>(
  (ref) => [],
);
