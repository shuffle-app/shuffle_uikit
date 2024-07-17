import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:shuffle_uikit/shuffle_uikit.dart';

String normalizedTi(TimeOfDay? time, {bool showDateName = true}) {
  if (time == null) return 'nn';

  return '${leadingZeros(showDateName ? time.hourOfPeriod : time.hour)}:${leadingZeros(time.minute)}${showDateName ? ' ${time.period.name}' : ''}';
}

String profileStatsFormatter(int value) {
  if (value < 1000) {
    return value.toString();
  } else if (value < 1000000) {
    return '${(value / 1000).toStringAsFixed(1)}k+';
  } else {
    return '${(value / 1000000).toStringAsFixed(1)}m+';
  }
}

extension TimeOfDayExtension on TimeOfDay {
  String get normalizedString {
    return normalizedTi(this, showDateName: false);
  }
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

String formatDuration(Duration? duration) {
  if (duration == null) return '0:0';
  final hours = duration.inHours;
  final minutes = duration.inMinutes;
  final seconds = duration.inSeconds.remainder(60);

  if (hours > 0) return '$hours:$minutes:$seconds';

  return '${minutes}:$seconds';
}

String formatDifference(DateTime date) {
  final difference = DateTime.now().difference(date).inDays;
  if (difference == 0) {
    final differenceInHours = DateTime.now().difference(date).inHours;
    if (differenceInHours == 0) {
      final differenceInMinutes = DateTime.now().difference(date).inMinutes;
      return S.current.MinutesAgo(differenceInMinutes);
    }

    return S.current.HoursAgo(differenceInHours);
  } else if (difference == 1) {
    return S.current.Yesterday;
  } else if (difference > 1 && difference < 7) {
    return S.current.WeekAgo;
  } else {
    return DateFormat('dd.MM.yyyy').format(date);
  }
}

String formatChatMessageDate(DateTime date) {
  if (date.isAtSameDay) {
    return DateFormat('HH:mm').format(date);
  }

  return DateFormat('MM.dd HH:mm').format(date);
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
    if (dateTo != null && dateTo != date) {
      convDate += '${date != null ? ' - ' : convDate.isEmpty ? '' : ', '}${DateFormat('MMM dd, yyyy').format(dateTo)}';
    }
  }

  return convDate;
}
