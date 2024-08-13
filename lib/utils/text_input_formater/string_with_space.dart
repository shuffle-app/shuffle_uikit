import 'package:intl/intl.dart';

String stringWithSpace(int text) {
  NumberFormat formatter = NumberFormat('#,###');
  return formatter.format(text).replaceAll(',', ' ');
}
