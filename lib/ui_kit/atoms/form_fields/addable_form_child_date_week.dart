import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:shuffle_uikit/shuffle_uikit.dart';

/// There are tree options for the date picker.
/// We might set a [T] as [DateTime] to show date.
/// We might set a [T] as [DateTimeRange] to show start and end dates.
/// We might set a [T] as [String] to show weekdays.
class AddableFormChildDateWeek<T> extends StatelessWidget {
  final T? initialValue;
  final VoidCallback? onChanged;

  const AddableFormChildDateWeek({super.key, this.initialValue, this.onChanged})
      : assert(!(T is DateTime || T is DateTimeRange || T is String));

  @override
  Widget build(BuildContext context) {
    final color = context.uiKitTheme?.colorScheme.inversePrimary;
    final textStyle = context.uiKitTheme?.boldTextTheme.body;

    final hintBaseWidget = Text(
      '____',
      style: textStyle,
    );
    final hintRangeWidget = Text(
      '____  —  ____',
      style: textStyle,
    );

    return InkWell(
        onTap: onChanged,
        borderRadius: BorderRadiusFoundation.zero,
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            context.smallOutlinedButton(
                data: BaseUiKitButtonData(
                    iconInfo: BaseUiKitButtonIconData(iconData: ShuffleUiKitIcons.calendar, color: color, size: 35))),
            SpacingFoundation.horizontalSpace12,
            if (initialValue == null)
              if (T == DateTime || T == String) hintBaseWidget else hintRangeWidget
            else if (T == DateTime)
              Flexible(
                  child: Text(
                DateFormat('dd.MM.yy').format(initialValue as DateTime),
                style: textStyle,
              ))
            else if (T == DateTimeRange)
              Flexible(
                  child: Text(
                '${DateFormat('dd.MM.yy').format((initialValue as DateTimeRange).start)} - ${DateFormat('dd.MM.yy').format((initialValue as DateTimeRange).end)}',
                style: textStyle,
              ))
            else
              Flexible(
                  child: Text(
                initialValue as String,
                style: textStyle,
              ))
          ],
        ));
  }
}
