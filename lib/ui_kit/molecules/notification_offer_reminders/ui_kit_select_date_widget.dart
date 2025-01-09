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
    final title = _formatDateRange(selectedDates, dateToWord, context);

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

String _formatDateRange(List<DateTime?>? selectedDates, bool dateToWord, BuildContext context) {
  if (selectedDates == null || selectedDates.isEmpty) {
    return S.of(context).PleaseAddDatePeriod;
  }

  final firstDate = selectedDates[0];
  final firstDateFormatted = firstDate != null
      ? dateToWord
          ? formatDateWithCustomPattern('MMMM d', firstDate.toLocal()).capitalize()
          : formatDateWithCustomPattern('dd.MM.yyyy', firstDate.toLocal())
      : '';

  if (selectedDates.length > 1) {
    final secondDate = selectedDates[1];
    if (secondDate != null) {
      final secondDateFormatted = dateToWord
          ? (secondDate.month == firstDate?.month)
              ? formatDateWithCustomPattern('MMMM dd', secondDate.toLocal())
              : (secondDate.year != firstDate?.year)
                  ? formatDateWithCustomPattern('dd.MM.yyyy', secondDate.toLocal())
                  : formatDateWithCustomPattern('MMMM dd', secondDate.toLocal())
          : formatDateWithCustomPattern('dd.MM.yyyy', secondDate.toLocal());

      return '$firstDateFormatted - $secondDateFormatted';
    }
  }

  return firstDateFormatted;
}
