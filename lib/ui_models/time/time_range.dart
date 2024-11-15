import 'package:flutter/material.dart';

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
}
