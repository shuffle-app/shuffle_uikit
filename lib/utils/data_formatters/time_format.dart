import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

String normalizedTi(TimeOfDay? time, {bool showDateName = true}) {
  if (time == null) return 'nn';

  return '${leadingZeros(time.hour)}:${leadingZeros(time.minute)}${showDateName ? ' ${time.period.name}' : ''}';
}

String leadingZeros(int number) {
  return number.toString().padLeft(2, '0');
}

String formatDate(
  DateTime? date,
  DateTime? dateTo,
  TimeOfDay? time,
  TimeOfDay? timeTo,
  List<String>? weekdays,
) {
  String convertedDate = normalizedTi(time, showDateName: false);
  convertedDate += ' - ${normalizedTi(timeTo, showDateName: false)}, ';
  if (weekdays != null && weekdays.isNotEmpty) {
    bool isConsecutive = true;
    for (int ind = 1; ind < weekdays.length; ind++) {
      if (weekdays[ind] != _getFollowingDay(weekdays[ind - 1])) {
        isConsecutive = false;
        break;
      }
    }
    if (isConsecutive) {
      convertedDate += '${weekdays.first.substring(0, 3)} - ${weekdays.last.substring(0, 3)}';

      return convertedDate;
    }

    convertedDate += weekdays.map((day) => day.substring(0, 3)).toList().join(', ');
  } else {
    convertedDate += date != null ? DateFormat('MMM dd').format(date) : 'nn';
    convertedDate += dateTo != null ? ' - ${DateFormat('MMM dd, yyyy').format(dateTo)}' : '';
  }

  return convertedDate;
}

String _getFollowingDay(String day) {
  switch (day) {
    case 'Monday':
      return 'Tuesday';
    case 'Tuesday':
      return 'Wednesday';
    case 'Wednesday':
      return 'Thursday';
    case 'Thursday':
      return 'Friday';
    case 'Friday':
      return 'Saturday';
    case 'Saturday':
      return 'Sunday';
    case 'Sunday':
      return 'Monday';
    default:
      return '';
  }
}
