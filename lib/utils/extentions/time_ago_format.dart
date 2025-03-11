import 'package:shuffle_uikit/localization/l10n.dart';

extension TimeFormatterExtension on DateTime {
  String timeAgoFormat() {
    final now = DateTime.now();
    final difference = now.difference(this);

    if (difference.isNegative) {
      return S.current.JustNow.toLowerCase();
    }

    if (difference.inDays >= 365) {
      final years = (difference.inDays / 365).floor();
      return S.current.YearsAgoX(years);
    } else if (difference.inDays >= 30) {
      final months = (difference.inDays / 30).floor();
      return S.current.MouthsAgoX(months);
    } else if (difference.inDays >= 7) {
      final weeks = (difference.inDays / 7).floor();
      return S.current.WeeksAgoX(weeks);
    } else if (difference.inDays >= 1) {
      return S.current.DaysAgoX(difference.inDays);
    } else if (difference.inHours >= 1) {
      return S.current.HoursAgoX(difference.inHours);
    } else if (difference.inMinutes >= 1) {
      return '${difference.inMinutes} ${S.current.MinAgoX}';
    } else if (difference.inSeconds >= 10) {
      return '${difference.inSeconds} ${S.current.SecAgoX}';
    } else {
      return S.current.JustNow.toLowerCase();
    }
  }
}
