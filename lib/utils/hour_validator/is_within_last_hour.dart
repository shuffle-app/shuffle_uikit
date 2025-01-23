bool isWithinLastHour(DateTime? eventTime) {
  if (eventTime == null) return false;

  final DateTime now = DateTime.now();
  final Duration difference = now.difference(eventTime.toLocal());

  return difference.inSeconds <= 3600 && difference.inSeconds >= 0;
}
