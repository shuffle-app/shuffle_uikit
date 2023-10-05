import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:shuffle_uikit/shuffle_uikit.dart';

class UiKitUserTileWithOption extends StatelessWidget {
  const UiKitUserTileWithOption({
    super.key,
    required this.title,
    required this.subtitle,
    required this.onOptionTap,
    required this.avatarLink,
    required this.options,
    this.date,
  });

  final String title;
  final String subtitle;
  final String avatarLink;
  final VoidCallback onOptionTap;
  final List<UiKitPopUpMenuButtonOption> options;
  final DateTime? date;

  @override
  Widget build(BuildContext context) {
    final theme = context.uiKitTheme;

    return Row(
      children: [
        SpacingFoundation.horizontalSpace12,
        Column(
          children: [
            BorderedUserCircleAvatar(imageUrl: avatarLink, size: 40.w),
            SpacingFoundation.verticalSpace2,
          ],
        ),
        SpacingFoundation.horizontalSpace12,
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Text(title, style: theme?.boldTextTheme.caption1Bold),
                  const Spacer(),
                  if (date != null) ...[
                    Text(
                      DateFormat('MMM dd').format(date!),
                      style: theme?.boldTextTheme.caption1Medium.copyWith(
                        color: theme.colorScheme.darkNeutral100,
                      ),
                    ),
                    SpacingFoundation.horizontalSpace16,
                  ],
                  UiKitPopUpMenuButton(options: options),
                ],
              ),
              Text(
                subtitle,
                style: theme?.boldTextTheme.caption1Medium.copyWith(
                  color: theme.colorScheme.darkNeutral900,
                ),
              )
            ],
          ),
        ),
      ],
    );
  }
}
