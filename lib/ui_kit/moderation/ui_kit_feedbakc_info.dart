import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:shuffle_uikit/shuffle_uikit.dart';

class FeedbackInfo extends StatelessWidget {
  final DateTime dateTime;
  final String userName;
  final Function() removeFunction;
  final bool showExpand;

  const FeedbackInfo({
    super.key,
    required this.dateTime,
    required this.userName,
    required this.removeFunction,
    this.showExpand = false,
  });

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
            Text(
              S.of(context).User,
              style: regularTextTheme?.labelSmall
                  .copyWith(color: theme?.colorScheme.darkNeutral900),
            ),
            SpacingFoundation.horizontalSpace16,
            Text(
              userName,
              style: regularTextTheme?.caption1,
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
              DateFormat('dd.MM.yyyy').format(dateTime),
              style: regularTextTheme?.caption1,
            ),
            const Spacer(),
            Text(
              DateFormat('HH:mm').format(dateTime),
              style: regularTextTheme?.caption1,
            ),
          ],
        ),
        SpacingFoundation.verticalSpace16,
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            if (showExpand) ...[
              context.coloredButtonWithBorderRadius(
                data: BaseUiKitButtonData(
                  fit: ButtonFit.hugContent,
                  textColor: theme?.colorScheme.inversePrimary,
                  backgroundColor:
                      theme?.colorScheme.darkNeutral900.withOpacity(0.68),
                  //TODO
                  text: 'Expand thread',
                  onPressed: () {},
                ),
              ),
            ],
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
    ).paddingAll(EdgeInsetsFoundation.all16);
  }
}
