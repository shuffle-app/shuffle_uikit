import 'dart:math';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:shuffle_uikit/shuffle_uikit.dart';
import 'package:table_calendar/table_calendar.dart';

class UiKitCalendarCompact extends StatelessWidget {
  final DateTime focusedDate, firstDay, lastDay;
  final bool Function(DateTime day)? enabledDayPredicate;
  final List<String> Function(DateTime day)? eventLoader;
  final Function(DateTime focusedDay)? onPageChanged;
  final Function(
    DateTime selectedDay,
    DateTime focusedDay,
  )? onDaySelected;
  final ValueChanged<PageController>? onCalendarCreated;
  final CalendarFormat calendarFormat;
  final bool wasChangedDateToSpecific;

  const UiKitCalendarCompact({
    super.key,
    required this.focusedDate,
    required this.firstDay,
    required this.lastDay,
    this.enabledDayPredicate,
    this.eventLoader,
    this.onCalendarCreated,
    this.onDaySelected,
    this.onPageChanged,
    this.wasChangedDateToSpecific = false,
    this.calendarFormat = CalendarFormat.twoWeeks,
  });

  @override
  Widget build(BuildContext context) {
    final theme = context.uiKitTheme!;
    final colorScheme = theme.colorScheme;
    final regularTextTheme = theme.regularTextTheme;
    final boldTextTheme = theme.boldTextTheme;

    final today = DateTime.now();

    return TableCalendar(
      // key: calendarKey,
      eventLoader: eventLoader,
      availableGestures: AvailableGestures.horizontalSwipe,
      // availableCalendarFormats: {
      //   CalendarFormat.month: 'Month',
      //   CalendarFormat.twoWeeks: '2 weeks',
      // },
      calendarFormat: calendarFormat,
      currentDay: today,
      enabledDayPredicate: enabledDayPredicate,
      rangeSelectionMode: RangeSelectionMode.disabled,
      onPageChanged: onPageChanged,
      startingDayOfWeek: StartingDayOfWeek.monday,
      onCalendarCreated: onCalendarCreated,
      headerVisible: false,
      rowHeight: 76.h,
      daysOfWeekHeight: 40.h,
      headerStyle: HeaderStyle(
          formatButtonVisible: false,
          titleTextFormatter: (DateTime date, dynamic locale) {
            return DateFormat('MMM yyyy', locale).format(date);
          },
          titleTextStyle: boldTextTheme.title2,
          headerPadding: EdgeInsets.symmetric(
              horizontal: EdgeInsetsFoundation.horizontal16, vertical: EdgeInsetsFoundation.vertical6)),
      // daysOfWeekStyle: DaysOfWeekStyle(
      //   decoration: BoxDecoration(borderRadius: BorderRadiusFoundation.all8, color: colorScheme.surface1),
      //   weekdayStyle: regularTextTheme.caption1.copyWith(color: colorScheme.darkNeutral900),
      //   weekendStyle: regularTextTheme.caption1.copyWith(color: colorScheme.darkNeutral900),
      // ),
      onDaySelected: onDaySelected,
      calendarStyle: CalendarStyle(
          //     cellAlignment: Alignment.center,
          markerSize: 0),
      //     markersMaxCount: 5,
      //     cellPadding: EdgeInsets.symmetric(horizontal: 5, vertical: SpacingFoundation.verticalSpacing6),
      //     markerDecoration: BoxDecoration(shape: BoxShape.circle, gradient: GradientFoundation.yellowLinearGradient)),
      calendarBuilders: CalendarBuilders(

          // headerTitleBuilder: (context,date){
          //   return Row(children: [
          //     Expanded(child: Text(DateFormat('MMMM yyyy').format(date))),
          //   ],)
          // },
          // disabledBuilder:(BuildContext context,
          //     DateTime day,)
          prioritizedBuilder: (
        BuildContext context,
        DateTime day,
        DateTime focusedDay,
      ) {
        final List<String> eventImages = eventLoader?.call(day) ?? [];
        return Column(children: [
          Expanded(
              child: UiKitCardWrapper(
                  width: double.infinity,
                  boxShadow: [
                    if (today.isAtSameDayAs(day))
                      BoxShadow(
                          color: colorScheme.inversePrimary.withOpacity(0.5),
                          blurStyle: BlurStyle.normal,
                          spreadRadius: 0,
                          blurRadius: 3.5)
                  ],
                  borderRadius: BorderRadiusFoundation.all8,
                  clipBehavior: Clip.none,
                  border: focusedDay.isAtSameDayAs(day) && wasChangedDateToSpecific
                      ? BorderSide(color: ColorsFoundation.purple)
                      : null,
                  padding: EdgeInsets.symmetric(
                      horizontal: EdgeInsetsFoundation.horizontal10, vertical: EdgeInsetsFoundation.vertical6),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        day.day.toString(),
                        style: boldTextTheme.caption3Medium
                            .copyWith(color: day.month != focusedDay.month ? colorScheme.darkNeutral800 : null),
                      ),
                      SpacingFoundation.verticalSpace2,
                      if (eventImages.isNotEmpty)
                        DecoratedBox(
                          decoration: BoxDecoration(borderRadius: BorderRadiusFoundation.all8, boxShadow: [
                            BoxShadow(
                                color: colorScheme.inversePrimary.withOpacity(0.5), spreadRadius: 2, blurRadius: 6.5)
                          ]),
                          child: Stack(
                            alignment: Alignment.center,
                            children: [
                              for (var i = 0; i < eventImages.length; i++)
                                Transform(
                                    transform: Matrix4.identity().scaled(1 - (i * 0.1), 1 - (i * 0.1), 1 - (i * 0.1))
                                      ..translate(i * SpacingFoundation.horizontalSpacing6),
                                    child: ClipRRect(
                                        borderRadius: BorderRadiusFoundation.all8,
                                        clipBehavior: Clip.hardEdge,
                                        child: ImageWidget(
                                          link: eventImages[i],
                                          height: 76.h * 0.45,
                                          fit: BoxFit.fitHeight,
                                        )))
                            ].reversed.toList(),
                          ),
                        )
                    ],
                  ))),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              for (int i = 0; i < eventImages.length.clamp(1, 5); i++)
                GradientableWidget(
                  active: eventImages.isNotEmpty,
                  gradient: GradientFoundation.defaultRadialGradient,
                  child: CircleAvatar(
                    backgroundColor: eventImages.isEmpty ? Colors.transparent : Colors.white,
                    radius: 3.sp,
                  ),
                ).paddingSymmetric(horizontal: 1),
            ],
          ).paddingSymmetric(vertical: SpacingFoundation.verticalSpacing4)
        ]).paddingSymmetric(horizontal: 1, vertical: SpacingFoundation.verticalSpacing2);
      }, dowBuilder: (context, day) {
        return UiKitCardWrapper(
          width: double.infinity,
          alignment: Alignment.center,
          borderRadius: BorderRadiusFoundation.all8,
          color: colorScheme.surface1,
          child: Text(
            DateFormat(
              'EEE',
            ).format(day),
            style: regularTextTheme.caption1.copyWith(color: colorScheme.darkNeutral900),
          ),
        ).paddingSymmetric(horizontal: 1, vertical: SpacingFoundation.verticalSpacing6);
      }),
      focusedDay: focusedDate,
      firstDay: firstDay,
      lastDay: lastDay,
    );
  }
}
