import 'package:shuffle_uikit/localization/l10n.dart';

extension CustomMonthDateFormat on DateTime {
  String toCustomString() {
    final monthNames = [
      S.current.January,
      S.current.February,
      S.current.March,
      S.current.April,
      S.current.May,
      S.current.June,
      S.current.July,
      S.current.August,
      S.current.September,
      S.current.October,
      S.current.November,
      S.current.December,
    ];

    String monthName = monthNames[month - 1];

    String dayFormatted = day.toString().padLeft(2, '0');

    return '$monthName $dayFormatted';
  }
}
