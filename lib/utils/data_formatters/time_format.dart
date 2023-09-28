import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

String normalizedTi(TimeOfDay? time, {bool showDateName = true}) {
  if (time == null) return 'nn';

  return '${leadingZeros(time.hour)}:${leadingZeros(time.minute)}${showDateName ? ' ${time.period.name}' : ''}';
}

String leadingZeros(int number) {
  return number.toString().padLeft(2, '0');
}

String formatDate(DateTime? date, DateTime? dateTo, TimeOfDay? time, TimeOfDay? timeTo, List<String>? weekdays) {
  String convertedDate = normalizedTi(time, showDateName: false);
  convertedDate += ' - ${normalizedTi(timeTo, showDateName: false)}, ';
  if (weekdays != null && weekdays.isNotEmpty) {
    final List<String> days = ['Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat', 'Sun'];
    final int start = days.indexOf(weekdays.first);
    final int end = days.indexOf(weekdays.last);
    convertedDate += end - start == weekdays.length - 1 ? '${weekdays.first} - ${weekdays.last}' : weekdays.join(', ');

    return convertedDate;
  } else {
    convertedDate += date != null ? DateFormat('MMM dd').format(date) : 'nn';
    convertedDate += dateTo != null ? ' - ${DateFormat('MMM dd, yyyy').format(dateTo)}' : '';
  }

  return convertedDate;
}
