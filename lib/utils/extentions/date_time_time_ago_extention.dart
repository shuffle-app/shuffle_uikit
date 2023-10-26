extension DateTimeTimeAgoExtention on DateTime {
  String get timeAgo {
    return '${DateTime.now().difference(this).inDays} days ago';
  }

  bool get isAtSameDay {
    return DateTime.now().difference(this).inDays == 0 && DateTime.now().day == day;
  }
}
