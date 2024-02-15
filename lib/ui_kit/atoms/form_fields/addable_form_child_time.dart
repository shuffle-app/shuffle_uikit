import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:shuffle_uikit/shuffle_uikit.dart';

///There are only two options for the time picker.
/// We might set a [T] as [DateTime] to show time in 24 hour format.
/// We might set a [T] as [DateTimeRange] to show start and end times in 24 hour format.
class AddableFormChildTime<T> extends StatelessWidget {
  final T? initialValue;
  final VoidCallback? onChanged;

  const AddableFormChildTime({super.key, this.initialValue, this.onChanged})
      : assert(!(T is DateTime || T is DateTimeRange));

  @override
  Widget build(BuildContext context) {
    final color = context.uiKitTheme?.colorScheme.inversePrimary;
    final textStyle = context.uiKitTheme?.boldTextTheme.body;

    final hintTimeWidget = Text(
      '__ : __',
      style: textStyle,
    );
    final hintTimeRangeWidget = Text(
      '__ : __  —  __ : __',
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
                    iconInfo: BaseUiKitButtonIconData(iconData: ShuffleUiKitIcons.clock, color: color, size: 35))),
            SpacingFoundation.horizontalSpace12,
            if (initialValue == null)
              if (T == DateTime) hintTimeWidget else hintTimeRangeWidget
            else if (T == DateTime)
              Text(
                DateFormat('HH:mm').format(initialValue as DateTime),
                style: textStyle,
              )
            else
              Text(
                '${DateFormat('HH:mm').format((initialValue as DateTimeRange).start)} - ${DateFormat('HH:mm').format((initialValue as DateTimeRange).end)}',
                style: textStyle,
              ),
          ],
        ));
  }
}
