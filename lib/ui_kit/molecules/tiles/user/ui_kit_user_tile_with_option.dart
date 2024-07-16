import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:shuffle_uikit/shuffle_uikit.dart';

class UiKitUserTileWithOption extends StatelessWidget {
  const UiKitUserTileWithOption({
    super.key,
    required this.name,
    required this.onOptionTap,
    this.avatarLink,
    required this.options,
    this.date,
    this.subtitle,
    this.type = UserTileType.ordinary,
  });

  final String name;
  final String? avatarLink;
  final VoidCallback onOptionTap;
  final List<UiKitPopUpMenuButtonOption> options;
  final String? subtitle;
  final DateTime? date;
  final UserTileType type;

  @override
  Widget build(BuildContext context) {
    final theme = context.uiKitTheme;

    return Row(
      children: [
        SpacingFoundation.horizontalSpace12,
        context
            .userAvatar(size: UserAvatarSize.x40x40, type: type, userName: name, imageUrl: avatarLink)
            .paddingOnly(bottom: SpacingFoundation.verticalSpacing2),
        SpacingFoundation.horizontalSpace12,
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Text(name, style: theme?.boldTextTheme.caption1Bold),
                  const Spacer(),
                  if (date != null) ...[
                    Text(
                      DateFormat('MMM dd').format(date!),
                      style: theme?.boldTextTheme.caption1Medium.copyWith(
                        color: theme.colorScheme.bodyTypography,
                      ),
                    ),
                    SpacingFoundation.horizontalSpace16,
                  ],
                  UiKitPopUpMenuButton(options: options),
                ],
              ),
              if (subtitle != null)
                Text(
                  subtitle!,
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
