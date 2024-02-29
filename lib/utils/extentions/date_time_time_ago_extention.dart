import 'package:flutter/material.dart';

extension DateTimeTimeAgoExtention on DateTime {
  String get timeAgo {
    return '${DateTime.now().difference(this).inDays} days ago';
  }

  bool get isAtSameDay {
    return DateTime.now().difference(this).inDays == 0 && DateTime.now().day == day;
  }
}

extension TimeIsNightExtention on TimeOfDay {
  bool get isNight {
    return hour >= 18;
  }

  bool isBefore(TimeOfDay other) {
    return hour < other.hour || (hour == other.hour && minute < other.minute);
  }
}