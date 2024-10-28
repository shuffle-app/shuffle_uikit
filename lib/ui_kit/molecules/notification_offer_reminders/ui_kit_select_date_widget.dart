import 'package:flutter/material.dart';
import 'package:shuffle_uikit/shuffle_uikit.dart';
import 'package:auto_size_text/auto_size_text.dart';

class UiKitSelectDateWidget extends StatelessWidget {
  final List<DateTime?>? selectedDates;
  final bool dateToWord;
  final VoidCallback? onCalenderTap;

  const UiKitSelectDateWidget({
    super.key,
    this.selectedDates,
    this.dateToWord = false,
    this.onCalenderTap,
  });

  @override
  Widget build(BuildContext context) {
    final theme = context.uiKitTheme;
    final title = selectedDates != null && selectedDates?.first != null
        ? dateToWord
            ? '${formatDateWithCustomPattern('MMMM d', selectedDates!.first!.toLocal()).capitalize()} ${selectedDates!.last != null ? (selectedDates!.last?.month == selectedDates!.first?.month) ? ' - ${formatDateWithCustomPattern('MMMM dd', selectedDates!.last!.toLocal())}' : selectedDates!.last?.year != selectedDates!.first?.year ? ' - ${formatDateWithCustomPattern('dd.MM.yyyy', selectedDates!.last!.toLocal())}' : ' - ${formatDateWithCustomPattern('MMMM dd', selectedDates!.last!.toLocal())}' : ''}'
            : '${formatDateWithCustomPattern('dd.MM.yyyy', selectedDates!.first!.toLocal())} '
                '${selectedDates!.last != null ? '- ${formatDateWithCustomPattern('dd.MM.yyyy', selectedDates!.last!.toLocal())}' : ''}'
        : S.of(context).PleaseAddDatePeriod;

    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Expanded(
          child: AutoSizeText(
            title,
            style: selectedDates != null && selectedDates!.first != null
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
            onPressed: onCalenderTap,
          ),
        )
      ],
    );
  }
}
