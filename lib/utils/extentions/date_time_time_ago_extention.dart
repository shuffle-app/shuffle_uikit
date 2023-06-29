extension DateTimeTimeAgoExtention on DateTime {
  String get timeAgo {
    return '${DateTime.now().difference(this).inDays} days ago';
  }
}
