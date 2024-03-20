import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../localization/l10n.dart';

String normalizedTi(TimeOfDay? time, {bool showDateName = true}) {
  if (time == null) return 'nn';

  return '${leadingZeros(time.hour)}:${leadingZeros(time.minute)}${showDateName ? ' ${time.period.name}' : ''}';
}

String leadingZeros(int number) {
  return number.toString().padLeft(2, '0');
}

String formatDateTimeDifferenceWithMonthName(DateTime date) {
  final difference = DateTime.now().difference(date).inDays;
  if (difference == 0) {
    final differenceInHours = DateTime.now().difference(date).inHours;
    return '${differenceInHours}h';
  } else {
    return DateFormat('MMMM dd').format(date);
  }
}

String formatDifference(DateTime date) {
  final difference = DateTime.now().difference(date).inDays;
  if (difference == 0) {
    final differenceInHours = DateTime.now().difference(date).inHours;

    return '${differenceInHours}h ago';
  } else if (difference == 1) {
    return 'yesterday';
  } else if (difference > 1 && difference < 7) {
    return 'a week ago';
  } else {
    return DateFormat('dd.MM.yyyy').format(date);
  }
}

String? formatDate(DateTime? date, DateTime? dateTo, TimeOfDay? time, TimeOfDay? timeTo, List<String>? wDays) {
  if (date == null && dateTo == null && time == null && timeTo == null && wDays == null) return null;
  String convDate = '';
  if ((time != null && timeTo != null) && time == timeTo) {
    convDate = S.current.daynight;
  } else {
    if (time != null) {
      convDate = normalizedTi(time, showDateName: false);
    }
    if (timeTo != null) {
      convDate += '${convDate.isEmpty ? '' : ' - '}${normalizedTi(timeTo, showDateName: false)}';
    }
  }
  if (wDays != null && wDays.isNotEmpty) {
    final List<String> days = ['Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat', 'Sun'];
    final int start = days.indexOf(wDays.first);
    final int end = days.indexOf(wDays.last);
    if (start == end) {
      convDate += ', ${wDays.first}';
    } else {
      convDate += end - start == wDays.length - 1
          ? '${convDate.isEmpty ? '' : ', '}${wDays.first} - ${wDays.last}'
          : ', ${wDays.join(', ')}';
    }

    return convDate;
  } else {
    convDate += date != null ? '${convDate.isEmpty ? '' : ', '}${DateFormat('MMM dd').format(date)}' : '';
    if (dateTo != null) {
      convDate += '${date != null ? ' - ' : convDate.isEmpty ? '' : ', '}${DateFormat('MMM dd, yyyy').format(dateTo)}';
    }
  }

  return convDate;
}
