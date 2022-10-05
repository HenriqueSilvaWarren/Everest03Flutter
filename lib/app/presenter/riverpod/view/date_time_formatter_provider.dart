import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:intl/intl.dart';

final dateTimeFormatterProvider = StateProvider.family<DateFormat, String>(
  (ref, arg) => DateFormat(arg),
);
