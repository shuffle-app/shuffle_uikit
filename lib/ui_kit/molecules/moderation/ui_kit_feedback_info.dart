import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:shuffle_uikit/shuffle_uikit.dart';

class UiKitFeedbackInfo extends StatelessWidget {
  final DateTime dateTime;
  final String userName;
  final bool? expandThreadIsOpen;
  final VoidCallback removeFunction;
  final VoidCallback onSubmit;
  final VoidCallback onModerated;
  final bool isModerated;

  ///displays the ExpandThread button if
  ///there were responses from the company
  final bool responsesFromCompanyToReview;

  const UiKitFeedbackInfo({
    super.key,
    required this.dateTime,
    required this.userName,
    required this.removeFunction,
    required this.onSubmit,
    this.responsesFromCompanyToReview = false,
    this.expandThreadIsOpen,
    required this.onModerated,
    required this.isModerated,
  });

  @override
  Widget build(BuildContext context) {
    final theme = context.uiKitTheme;
    final boldTextTheme = context.uiKitTheme?.boldTextTheme;
    final regularTextTheme = context.uiKitTheme?.regularTextTheme;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Text(
              S.of(context).Info,
              style:
                  boldTextTheme?.title2.copyWith(fontWeight: FontWeight.w400),
            ),
            const Spacer(),
            if (isModerated)
              const Icon(
                ShuffleUiKitIcons.flag,
                color: ColorsFoundation.onHover,
              )
          ],
        ),
        SpacingFoundation.verticalSpace4,
        Row(
          children: [
            Flexible(
              child: Text(
                S.of(context).User,
                style: regularTextTheme?.body
                    .copyWith(color: theme?.colorScheme.darkNeutral900),
              ),
            ),
            SpacingFoundation.horizontalSpace16,
            Flexible(
              child: Text(
                userName,
                style: regularTextTheme?.body,
              ),
            ),
          ],
        ),
        SpacingFoundation.verticalSpace4,
        Row(
          children: [
            Text(
              S.of(context).Date,
              style: regularTextTheme?.body
                  .copyWith(color: theme?.colorScheme.darkNeutral900),
            ),
            SpacingFoundation.horizontalSpace16,
            Text(
              DateFormat('dd.MM.yyyy').format(dateTime),
              style: regularTextTheme?.body,
            ),
            const Spacer(),
            Text(
              DateFormat('HH:mm').format(dateTime),
              style: regularTextTheme?.body,
            ),
          ],
        ),
        SpacingFoundation.verticalSpace16,
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            if (responsesFromCompanyToReview) ...[
              context.coloredButtonWithBorderRadius(
                data: BaseUiKitButtonData(
                  fit: ButtonFit.hugContent,
                  textColor: theme?.colorScheme.inversePrimary,
                  backgroundColor:
                      theme?.colorScheme.darkNeutral900.withOpacity(0.68),
                  text: (expandThreadIsOpen ?? false)
                      ? S.of(context).CollapseThread
                      : S.of(context).ExpandThread,
                  onPressed: onSubmit,
                ),
              ),
            ],
            SpacingFoundation.horizontalSpace16,
            if (!isModerated)
              Material(
                borderRadius: BorderRadiusFoundation.all12,
                color: ColorsFoundation.onHover.withOpacity(0.32),
                child: InkWell(
                  borderRadius: BorderRadiusFoundation.all12,
                  onTap: onModerated,
                  child: Ink(
                    child: Container(
                      child: const ImageWidget(
                        iconData: ShuffleUiKitIcons.check,
                        color: ColorsFoundation.onHover,
                      ).paddingAll(EdgeInsetsFoundation.all12),
                    ),
                  ),
                ),
              ),
            SpacingFoundation.horizontalSpace16,
            Material(
              borderRadius: BorderRadiusFoundation.all12,
              color: ColorsFoundation.red.withOpacity(0.32),
              child: InkWell(
                borderRadius: BorderRadiusFoundation.all12,
                onTap: removeFunction,
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
