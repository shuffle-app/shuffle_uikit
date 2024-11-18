import 'package:flutter/material.dart';
import 'package:shuffle_uikit/shuffle_uikit.dart';

class TimeRange {
  final TimeOfDay? start;
  final TimeOfDay? end;

  const TimeRange({this.start, this.end});

  /// Converts TimeRange to formatted strings.
  String formatTime(TimeOfDay? time) {
    if (time == null) return '--:--';
    final String hour = time.hour.toString().padLeft(2, '0');
    final String minute = time.minute.toString().padLeft(2, '0');
    return '$hour:$minute';
  }

  /// Formats the TimeRange as strings like "11:20 - 02:03".
  String formatted() {
    return '${formatTime(start)} - ${formatTime(end)}';
  }

  @override
  String toString() {
    return normalizedTi(start) + (end != null ? '-${normalizedTi(end)}' : '');
  }

  TimeRange copyWith({TimeOfDay? start, TimeOfDay? end}) => TimeRange(
        start: start ?? this.start,
        end: end ?? this.end,
      );
}

List<TimeRange> listTimeDayToTimeRange(List<TimeOfDay> times) {
  var result = <TimeRange>[];
  debugPrint('times.length is ${times.length}');
  for (int i = 0; i < times.length; i++) {
    if (i.isOdd) continue;
    debugPrint('i is $i');
    result.add(TimeRange(start: times[i], end: i + 1 >= times.length ? null : times[i + 1]));
    // }
  }
  return result;
}
