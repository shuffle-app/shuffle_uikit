import 'dart:ui' as ui;
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:shuffle_uikit/shuffle_uikit.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:shuffle_uikit/utils/text_formatter/days_of_week_range_formatter.dart';
import 'package:shuffle_uikit/utils/text_formatter/string_cleaner_formatter.dart';

String normalizedTi(TimeOfDay? time, {bool showDateName = true}) {
  if (time == null) return 'nn';

  return '${leadingZeros(showDateName ? time.hourOfPeriod : time.hour)}:${leadingZeros(time.minute)}${showDateName ? ' ${time.period.name}' : ''}';
}

String profileStatsFormatter(int value) {
  if (value < 1000) {
    return value.toString();
  } else if (value < 1000000) {
    return '${(value / 1000).toStringAsFixed(1)}k+';
  } else {
    return '${(value / 1000000).toStringAsFixed(1)}m+';
  }
}

extension TimeOfDayExtension on TimeOfDay {
  String get normalizedString {
    return normalizedTi(this, showDateName: false);
  }
}

extension TimeRangeExtension on TimeRange {
  String get normalizedString {
    return '${normalizedTi(start, showDateName: false)}${end != null ? ' - ${normalizedTi(end, showDateName: false)}' : ''}';
  }
}

String leadingZeros(int number) {
  return number.toString().padLeft(2, '0');
}

String formatDateTimeDifferenceWithMonthName(DateTime date) {
  final difference = DateTime.now().difference(date).inDays;
  if (difference == 0) {
    final differenceInHours = DateTime.now().difference(date).inHours;
    return '${differenceInHours}h';
  } else {
    return DateFormat('MMMM dd').format(date);
  }
}

String formatDuration(Duration? duration) {
  if (duration == null) return '00:00';
  final hours = duration.inHours;
  final minutes = duration.inMinutes;
  final seconds = duration.inSeconds.remainder(60);

  if (hours > 0) return '${leadingZeros(hours)}:${leadingZeros(minutes)}:${leadingZeros(seconds)}';

  return '${leadingZeros(minutes)}:${leadingZeros(seconds)}';
}

String formatDateWithCustomPattern(String pattern, DateTime date, {String? locale}) {
  return DateFormat(pattern, locale).format(date);
}

String formatDifference(DateTime date) {
  final difference = DateTime.now().difference(date).inDays;
  if (difference == 0) {
    final differenceInHours = DateTime.now().difference(date).inHours;
    if (differenceInHours == 0) {
      final differenceInMinutes = DateTime.now().difference(date).inMinutes;
      return S.current.MinutesAgo(differenceInMinutes);
    }

    return S.current.HoursAgo(differenceInHours);
  } else if (difference == 1) {
    return S.current.Yesterday;
  } else if (difference > 1 && difference < 7) {
    return S.current.WeekAgo;
  } else {
    return DateFormat('dd.MM.yyyy').format(date);
  }
}

String formatChatMessageDate(DateTime date) {
  if (date.isAtSameDay) {
    return DateFormat('HH:mm').format(date);
  }

  return DateFormat('HH:mm').format(date);
}

showTimeInfoDialog(BuildContext context, List<List<String>> times) {
  final theme = context.uiKitTheme;

  showGeneralDialog(
    barrierColor: const Color(0xff2A2A2A),
    transitionBuilder: (context, a1, a2, widget) {
      return Transform.scale(
        scale: a1.value,
        child: Opacity(
          opacity: a1.value,
          child: widget,
        ),
      );
    },
    transitionDuration: const Duration(milliseconds: 200),
    barrierDismissible: true,
    barrierLabel: '',
    context: context,
    pageBuilder: (context, animation1, animation2) {
      return Dialog(
        insetPadding: EdgeInsets.all(EdgeInsetsFoundation.all16),
        backgroundColor: Colors.transparent,
        clipBehavior: Clip.antiAlias,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadiusFoundation.all24,
        ),
        child: CustomContentInfoDialog(
          width: 1.sw,
          title: S.current.WorkHours,
          children: times.map(
            (time) {
              return LayoutBuilder(
                builder: (context, constraints) {
                  final firstText = time.first.isDaysOfWeek
                      ? time.first.cleanWhitespace().toDayRanges()
                      : time.first.cleanWhitespace();
                  final secondText = time.last != time.first ? time.last : '';

                  final firstTextPainter = TextPainter(
                    text: TextSpan(
                      text: firstText,
                      style: theme?.regularTextTheme.caption2.copyWith(color: Colors.black),
                    ),
                    maxLines: 1,
                    textDirection: ui.TextDirection.ltr,
                  )..layout();

                  final secondTextPainter = TextPainter(
                    text: TextSpan(
                      text: secondText,
                      style: theme?.boldTextTheme.caption1Medium.copyWith(color: Colors.black),
                    ),
                    maxLines: 1,
                    textDirection: ui.TextDirection.ltr,
                  )..layout();

                  final totalWidth = firstTextPainter.width + secondTextPainter.width;
                  final fitsInOneLine = totalWidth <= constraints.maxWidth;

                  if (fitsInOneLine) {
                    return Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Flexible(
                          child: AutoSizeText(
                            '$firstText:',
                            style: theme?.regularTextTheme.caption2.copyWith(color: Colors.black),
                            maxLines: 1,
                            minFontSize: 8,
                          ),
                        ),
                        if (secondText.isNotEmpty)
                          Flexible(
                            child: AutoSizeText(
                              secondText,
                              textAlign: TextAlign.end,
                              style: theme?.boldTextTheme.caption1Medium.copyWith(color: Colors.black),
                              maxLines: 1,
                              minFontSize: 8,
                            ),
                          ),
                      ],
                    );
                  } else {
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        AutoSizeText(
                          '$firstText:',
                          style: theme?.regularTextTheme.caption2.copyWith(color: Colors.black),
                          minFontSize: 8,
                        ),
                        if (secondText.isNotEmpty)
                          AutoSizeText(
                            secondText,
                            style: theme?.boldTextTheme.caption1Medium.copyWith(color: Colors.black),
                            minFontSize: 8,
                          ).paddingOnly(top: SpacingFoundation.verticalSpacing8),
                      ],
                    );
                  }
                },
              );
            },
          ).toList(),
        ),
      );
    },
  );
}

/// Correct Format date and time 20.03.25

enum WeekdayKey { Mon, Tue, Wed, Thu, Fri, Sat, Sun }

String normalizeDateKey(String key) {
  final parts = key.split('/');
  final start = DateFormat('yy-MM-dd').parse(parts[0]);
  final end = DateFormat('yy-MM-dd').parse(parts[1]);

  final dates = [start, end]..sort((a, b) => a.compareTo(b));
  final formattedStart = DateFormat('dd.MM.yy').format(dates[0]);
  final formattedEnd = DateFormat('dd.MM.yy').format(dates[1]);

  return dates[0] == dates[1] ? formattedStart : '$formattedStart – $formattedEnd';
}

WeekdayKey parseWeekdayKey(String input) {
  const mapping = {
    'Mon': WeekdayKey.Mon,
    'Tue': WeekdayKey.Tue,
    'Wed': WeekdayKey.Wed,
    'Thu': WeekdayKey.Thu,
    'Fri': WeekdayKey.Fri,
    'Sat': WeekdayKey.Sat,
    'Sun': WeekdayKey.Sun,
    'Пн': WeekdayKey.Mon,
    'Вт': WeekdayKey.Tue,
    'Ср': WeekdayKey.Wed,
    'Чт': WeekdayKey.Thu,
    'Пт': WeekdayKey.Fri,
    'Сб': WeekdayKey.Sat,
    'Вс': WeekdayKey.Sun,
  };

  final key = mapping[input.trim()];
  if (key == null) throw FormatException('Invalid weekday: $input');
  return key;
}

String normalizeDayKey(String originalKey) {
  final days = originalKey.split(', ').map((d) => parseWeekdayKey(d.trim())).toList()
    ..sort((a, b) => a.index.compareTo(b.index));

  return days.map((d) => d.toString().split('.').last).join(', ');
}

int timeComparator(String a, String b) {
  return compareTimeStrings(a.split(' – ')[0], b.split(' – ')[0]);
}

int compareTimeStrings(String a, String b) {
  final timeA = DateFormat('HH:mm').parse(a);
  final timeB = DateFormat('HH:mm').parse(b);
  return timeA.compareTo(timeB);
}

String formatRange(WeekdayKey start, WeekdayKey end) {
  String localizedDay(WeekdayKey key) {
    switch (key) {
      case WeekdayKey.Mon:
        return S.current.Mon;
      case WeekdayKey.Tue:
        return S.current.Tue;
      case WeekdayKey.Wed:
        return S.current.Wed;
      case WeekdayKey.Thu:
        return S.current.Thu;
      case WeekdayKey.Fri:
        return S.current.Fri;
      case WeekdayKey.Sat:
        return S.current.Sat;
      case WeekdayKey.Sun:
        return S.current.Sun;
    }
  }

  final startStr = localizedDay(start);
  final endStr = localizedDay(end);
  return start == end ? startStr : '$startStr – $endStr';
}

String compactDays(List<String> dayStrings) {
  if (dayStrings.isEmpty) return '';

  final days = dayStrings.map(parseWeekdayKey).toList();
  days.sort((a, b) => a.index.compareTo(b.index));

  List<List<WeekdayKey>> ranges = [];
  List<WeekdayKey> currentRange = [days.first];

  for (int i = 1; i < days.length; i++) {
    if (days[i].index == days[i - 1].index + 1) {
      currentRange.add(days[i]);
    } else {
      ranges.add(currentRange);
      currentRange = [days[i]];
    }
  }
  ranges.add(currentRange);

  return ranges.map((range) {
    return formatRange(range.first, range.last);
  }).join(', ');
}

String dateFormatterToString(String dateStr, {required String locale}) {
  final date = DateFormat('yy-MM-dd').parse(dateStr);
  return DateFormat('dd.MM.yy', locale).format(date);
}
