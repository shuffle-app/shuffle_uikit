import 'package:flutter/material.dart';
import 'package:shuffle_uikit/shuffle_uikit.dart';

extension DateTimeTimeAgoExtention on DateTime {
  String get timeAgo {
    return formatDifference(this);
  }

  bool get isAtSameDay {
    return DateTime.now().difference(this).inDays == 0 && DateTime.now().day == day;
  }
}

extension TimeIsNightExtention on TimeOfDay {
  bool get isNight {
    return hour >= 18 || hour < 6;
  }

  bool isBefore(TimeOfDay other) {
    return hour < other.hour || (hour == other.hour && minute < other.minute);
  }
}
