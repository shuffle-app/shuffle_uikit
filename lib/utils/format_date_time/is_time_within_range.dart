import 'package:flutter/material.dart';

bool isTimeWithinRange(TimeOfDay time, String range) {
  String timeRange = _extractTimeRange(range);

  if (timeRange == '00:00 - 00:00' || timeRange == '0:00 - 0:00') {
    return true;
  }

  List<String> timeRangeParts = timeRange.split(' - ');

  TimeOfDay startTime = _parseTimeOfDayWithAmPm(timeRangeParts[0]);
  TimeOfDay endTime = _parseTimeOfDayWithAmPm(timeRangeParts[1]);

  DateTime now = DateTime.now();
  DateTime timeToCheck = DateTime(now.year, now.month, now.day, time.hour, time.minute);
  DateTime startDateTime = DateTime(now.year, now.month, now.day, startTime.hour, startTime.minute);
  DateTime endDateTime = DateTime(now.year, now.month, now.day, endTime.hour, endTime.minute);

  if (endDateTime.isBefore(startDateTime)) {
    return timeToCheck.isAfter(startDateTime) ||
        timeToCheck.isBefore(endDateTime) ||
        timeToCheck
            .copyWith(second: 0, microsecond: 0, millisecond: 0)
            .isAtSameMomentAs(startDateTime.copyWith(second: 0, microsecond: 0, millisecond: 0));
  }

  return timeToCheck.isAfter(startDateTime) && timeToCheck.isBefore(endDateTime) ||
      timeToCheck
          .copyWith(second: 0, microsecond: 0, millisecond: 0)
          .isAtSameMomentAs(startDateTime.copyWith(second: 0, microsecond: 0, millisecond: 0));
}

TimeOfDay _parseTimeOfDayWithAmPm(String timeStr) {
  final RegExp regExp = RegExp(r'(\d{1,2}):(\d{2})\s*(am|pm)?', caseSensitive: false);
  final match = regExp.firstMatch(timeStr.trim());

  if (match != null) {
    int hour = int.parse(match.group(1)!);
    int minute = int.parse(match.group(2)!);
    String? period = match.group(3)?.toLowerCase();

    if (period == 'pm' && hour != 12) {
      hour += 12;
    } else if (period == 'am' && hour == 12) {
      hour = 0;
    }

    return TimeOfDay(hour: hour, minute: minute);
  } else {
    throw Exception('Incorrect time format: $timeStr');
  }
}

String _extractTimeRange(String range) {
  final RegExp regExp = RegExp(r'(\d{1,2}:\d{2}\s*(am|pm)? - \d{1,2}:\d{2}\s*(am|pm)?)', caseSensitive: false);
  final match = regExp.firstMatch(range);

  if (match != null) {
    return match.group(0)!.trim();
  } else {
    throw Exception('The time range was not found');
  }
}
