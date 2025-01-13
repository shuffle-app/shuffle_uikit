extension DaysOfWeekRangeFormatter on String {
  bool get isDaysOfWeek {
    const daysOfWeek = {'Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat', 'Sun'};
    final cleanedString = replaceAll(RegExp(r'[\[\]:]'), '');
    final days = cleanedString.split(', ').map((day) => day.trim()).toList();
    return days.every((day) => daysOfWeek.contains(day));
  }

  /// Converts a string with days of the week to a string with ranges.
  String toDayRanges() {
    if (isEmpty) return '';

    final cleanedString = replaceAll(RegExp(r'[\[\]:]'), '');
    final days = cleanedString.split(', ').map((day) => day.trim()).toList();
    const daysOfWeek = ['Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat', 'Sun'];
    final sortedDays = days..sort((a, b) => daysOfWeek.indexOf(a).compareTo(daysOfWeek.indexOf(b)));

    final ranges = <String>[];
    int start = 0;

    for (int i = 0; i < sortedDays.length; i++) {
      if (i > 0 && daysOfWeek.indexOf(sortedDays[i]) != daysOfWeek.indexOf(sortedDays[i - 1]) + 1) {
        if (start == i - 1) {
          ranges.add(sortedDays[start]);
        } else {
          ranges.add('${sortedDays[start]}-${sortedDays[i - 1]}');
        }
        start = i;
      }

      if (i == sortedDays.length - 1) {
        if (start == i) {
          ranges.add(sortedDays[start]);
        } else {
          ranges.add('${sortedDays[start]}-${sortedDays[i]}');
        }
      }
    }

    return ranges.join(', ');
  }
}
