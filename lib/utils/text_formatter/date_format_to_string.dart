import 'package:intl/intl.dart';

String dateFormatToString(String inputDate, {String? locale}) {
  final parts = inputDate.split('-');
  if (parts.length != 3) {
    return inputDate;
  }

  final year = int.parse('20${parts[0]}');
  final month = int.parse(parts[1]);
  final day = int.parse(parts[2]);

  final date = DateTime(year, month, day);

  final dateFormat = DateFormat('dd MMM. yyyy', Intl.getCurrentLocale());
  return dateFormat.format(date);
}
