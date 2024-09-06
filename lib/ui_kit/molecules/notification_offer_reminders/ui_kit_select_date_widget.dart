import 'package:flutter/material.dart';
import 'package:shuffle_uikit/shuffle_uikit.dart';
import 'package:auto_size_text/auto_size_text.dart';

class UiKitSelectDateWidget extends StatefulWidget {
  final List<DateTime?>? selectedDates;
  final bool dateToWord;
  final DateTime? lastDate;

  const UiKitSelectDateWidget({
    super.key,
    this.selectedDates,
    this.dateToWord = false,
    this.lastDate,
  });

  @override
  State<UiKitSelectDateWidget> createState() => _UiKitSelectDateWidgetState();
}

class _UiKitSelectDateWidgetState extends State<UiKitSelectDateWidget> {
  @override
  Widget build(BuildContext context) {
    final theme = context.uiKitTheme;

    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Expanded(
          child: AutoSizeText(
            widget.selectedDates != null && widget.selectedDates?.first != null
                ? widget.dateToWord
                    ? '${formatDateWithCustomPattern('MMMM d', widget.selectedDates!.first!.toLocal()).capitalize()} ${widget.selectedDates!.last != null ? (widget.selectedDates!.last?.month == widget.selectedDates!.first?.month) ? ' - ${formatDateWithCustomPattern('MMMM dd', widget.selectedDates!.last!.toLocal())}' : widget.selectedDates!.last?.year != widget.selectedDates!.first?.year ? ' - ${formatDateWithCustomPattern('dd.MM.yyyy', widget.selectedDates!.last!.toLocal())}' : ' - ${formatDateWithCustomPattern('MMMM dd', widget.selectedDates!.last!.toLocal())}' : ''}'
                    : '${formatDateWithCustomPattern('dd.MM.yyyy', widget.selectedDates!.first!.toLocal())} '
                        '${widget.selectedDates!.last != null ? '- ${formatDateWithCustomPattern('dd.MM.yyyy', widget.selectedDates!.last!.toLocal())}' : ''}'
                : S.of(context).PleaseAddDatePeriod,
            style: widget.selectedDates != null && widget.selectedDates!.first != null
                ? theme?.boldTextTheme.body
                : theme?.boldTextTheme.body.copyWith(color: ColorsFoundation.error),
            maxLines: 1,
          ),
        ),
        SpacingFoundation.horizontalSpace12,
        context.outlinedButton(
          padding: EdgeInsets.all(EdgeInsetsFoundation.all12),
          data: BaseUiKitButtonData(
            iconInfo: BaseUiKitButtonIconData(iconData: ShuffleUiKitIcons.calendar),
            onPressed: () async {
              await showUiKitCalendarFromToDialog(
                context,
                lastDate: (widget.lastDate != null &&
                        widget.lastDate!.isAfter(DateTime.now()) &&
                        !widget.lastDate!.isAtSameDay)
                    ? widget.lastDate
                    : null,
                (from, to) {
                  setState(() {
                    widget.selectedDates?.clear();
                    (from != null && (from!.isAfter(DateTime.now()) || from!.isAtSameDay))
                        ? widget.selectedDates?.add(from)
                        : from = null;
                    (from != null && from != to) ? widget.selectedDates?.add(to) : widget.selectedDates?.add(null);
                  });
                },
              );
            },
          ),
        )
      ],
    );
  }
}
