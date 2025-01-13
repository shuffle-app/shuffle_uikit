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

String? formatDate(DateTime? date, DateTime? dateTo, TimeOfDay? time, TimeOfDay? timeTo, List<String>? wDays,
    [bool showDateFirst = false]) {
  if (date == null && dateTo == null && time == null && timeTo == null && wDays == null) return null;
  String convDate = '';
  if (showDateFirst) {
    convDate += date != null ? '${convDate.isEmpty ? '' : ', '}${DateFormat('MMM dd').format(date)}' : '';
    if (dateTo != null && dateTo != date) {
      convDate += '${date != null ? ' - ' : convDate.isEmpty ? '' : ', '}${DateFormat('MMM dd, yyyy').format(dateTo)}';
    }
  }
  if ((time != null && timeTo != null) && time == timeTo) {
    convDate += S.current.daynight;
  } else {
    if (time != null) {
      convDate += (convDate.isEmpty ? '' : ', ') + normalizedTi(time, showDateName: false);
    }
    if (timeTo != null) {
      convDate += '${convDate.isEmpty ? '' : ' - '}${normalizedTi(timeTo, showDateName: false)}';
    }
  }
  if (wDays != null && wDays.isNotEmpty) {
    final List<String> days = ['Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat', 'Sun'];
    final int start = days.indexOf(wDays.first);
    final int end = days.indexOf(wDays.last);
    if (start == end) {
      convDate += ', ${wDays.first}';
    } else {
      convDate += end - start == wDays.length - 1
          ? '${convDate.isEmpty ? '' : ', '}${wDays.first} - ${wDays.last}'
          : ', ${wDays.join(', ')}';
    }

    return convDate;
  } else if (!showDateFirst) {
    convDate += date != null ? '${convDate.isEmpty ? '' : ', '}${DateFormat('MMM dd').format(date)}' : '';
    if (dateTo != null && dateTo != date) {
      convDate += '${date != null ? ' - ' : convDate.isEmpty ? '' : ', '}${DateFormat('MMM dd, yyyy').format(dateTo)}';
    }
  }

  return convDate;
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
                      style: theme?.regularTextTheme.body.copyWith(color: Colors.black),
                    ),
                    maxLines: 1,
                    textDirection: ui.TextDirection.ltr,
                  )..layout();

                  final secondTextPainter = TextPainter(
                    text: TextSpan(
                      text: secondText,
                      style: theme?.regularTextTheme.body.copyWith(color: Colors.black),
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
                            firstText,
                            style: theme?.regularTextTheme.body.copyWith(color: Colors.black),
                            maxLines: 1,
                            minFontSize: 8,
                          ),
                        ),
                        if (secondText.isNotEmpty)
                          Flexible(
                            child: AutoSizeText(
                              secondText,
                              textAlign: TextAlign.end,
                              style: theme?.regularTextTheme.body.copyWith(color: Colors.black),
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
                          firstText,
                          style: theme?.regularTextTheme.body.copyWith(color: Colors.black),
                          maxLines: 1,
                          minFontSize: 8,
                        ),
                        if (secondText.isNotEmpty)
                          AutoSizeText(
                            secondText,
                            style: theme?.regularTextTheme.body.copyWith(color: Colors.black),
                            maxLines: 1,
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
