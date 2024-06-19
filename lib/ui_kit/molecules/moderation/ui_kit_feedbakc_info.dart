import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:shuffle_uikit/shuffle_uikit.dart';

class UiKitFeedbackInfo extends StatefulWidget {
  final DateTime dateTime;
  final String userName;
  final Function() removeFunction;

  ///displays the Expandthread button if
  ///there were responses from the company
  final bool responsesFromCompanytoReview;

  const UiKitFeedbackInfo({
    super.key,
    required this.dateTime,
    required this.userName,
    required this.removeFunction,
    this.responsesFromCompanytoReview = false,
  });

  @override
  State<UiKitFeedbackInfo> createState() => _UiKitFeedbackInfoState();
}

class _UiKitFeedbackInfoState extends State<UiKitFeedbackInfo> {
  bool _expandThreadIsOpen = false;

  @override
  Widget build(BuildContext context) {
    final theme = context.uiKitTheme;
    final boldTextTheme = context.uiKitTheme?.boldTextTheme;
    final regularTextTheme = context.uiKitTheme?.regularTextTheme;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          S.of(context).Info,
          style: boldTextTheme?.caption1Bold,
        ),
        SpacingFoundation.verticalSpace4,
        Row(
          children: [
            Flexible(
              child: Text(
                S.of(context).User,
                style: regularTextTheme?.labelSmall
                    .copyWith(color: theme?.colorScheme.darkNeutral900),
              ),
            ),
            SpacingFoundation.horizontalSpace16,
            Flexible(
              child: Text(
                widget.userName,
                style: regularTextTheme?.caption1,
              ),
            ),
          ],
        ),
        SpacingFoundation.verticalSpace4,
        Row(
          children: [
            Text(
              S.of(context).Date,
              style: regularTextTheme?.labelSmall
                  .copyWith(color: theme?.colorScheme.darkNeutral900),
            ),
            SpacingFoundation.horizontalSpace16,
            Text(
              DateFormat('dd.MM.yyyy').format(widget.dateTime),
              style: regularTextTheme?.caption1,
            ),
            const Spacer(),
            Text(
              DateFormat('HH:mm').format(widget.dateTime),
              style: regularTextTheme?.caption1,
            ),
          ],
        ),
        SpacingFoundation.verticalSpace16,
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            if (widget.responsesFromCompanytoReview) ...[
              context.coloredButtonWithBorderRadius(
                data: BaseUiKitButtonData(
                  fit: ButtonFit.hugContent,
                  textColor: theme?.colorScheme.inversePrimary,
                  backgroundColor:
                      theme?.colorScheme.darkNeutral900.withOpacity(0.68),
                  text: _expandThreadIsOpen
                      ? S.of(context).ExpandThread
                      : S.of(context).CollapseThread,
                  onPressed: () {
                    setState(() {
                      _expandThreadIsOpen = !_expandThreadIsOpen;
                    });
                  },
                ),
              ),
            ],
            SpacingFoundation.horizontalSpace16,
            Material(
              borderRadius: BorderRadiusFoundation.all12,
              color: ColorsFoundation.red.withOpacity(0.32),
              child: InkWell(
                borderRadius: BorderRadiusFoundation.all12,
                onTap: widget.removeFunction,
                child: Ink(
                  child: Container(
                    child: const ImageWidget(
                      iconData: ShuffleUiKitIcons.trash,
                      color: ColorsFoundation.red,
                    ).paddingAll(EdgeInsetsFoundation.all12),
                  ),
                ),
              ),
            ),
          ],
        )
      ],
    );
  }
}
