import 'package:flutter/material.dart';

String normalizedTi(TimeOfDay? time) {
  if (time == null) return 'nn';

  return '${leadingZeros(time.hour)}:${leadingZeros(time.minute)} ${time.period.name}';
}

String leadingZeros(int number) {
  return number.toString().padLeft(2, '0');
}

String durationFrom(TimeOfDay? timeFrom, TimeOfDay? timeTo) {
  if (timeTo == null) return '';

  final startDate = DateTime(9, 9, 9, timeFrom!.hour, timeFrom.minute);
  final finishDate = DateTime(9, 9, 10, timeTo.hour, timeTo.minute);

  final range = DateTimeRange(start: startDate, end: finishDate);
  final hours = range.duration.inHours % 12;
  final minutes = range.duration.inMinutes % 60;

  final hourText = hours == 0 ? '' : '$hours h, ';
  final minutesText = minutes == 0 ? '' : '$minutes min';

  return hourText + minutesText;
}

bool isBetween(TimeOfDay? timeFrom, TimeOfDay? timeTo) {
  int startTime = (timeFrom!.hour * 60 + timeFrom.minute) * 60;
  int endTime = (timeTo!.hour * 60 + timeTo.minute) * 60;
  int now = (TimeOfDay.now().hour * 60 + TimeOfDay.now().minute) * 60;

  if ((now >= startTime && now <= endTime)) return true;

  return false;
}
