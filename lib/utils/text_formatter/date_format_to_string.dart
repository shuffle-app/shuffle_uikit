import 'package:intl/intl.dart';

String dateFormatToString(String inputDate, {String? locale}) {
  final parts = inputDate.split('-');
  if (parts.length != 3) {
    return inputDate;
  }

  final yearPart = parts[0];
  final year = yearPart.length == 2 ? int.parse('20${yearPart}') : int.parse(yearPart);
  final month = int.parse(parts[1]);
  final day = int.parse(parts[2]);

  final date = DateTime(year, month, day);

  final dateFormat = DateFormat('dd MMM. yyyy', locale);
  return dateFormat.format(date);
}
