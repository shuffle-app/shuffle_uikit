import 'package:flutter/material.dart';
import 'package:shuffle_uikit/shuffle_uikit.dart';

class UiKitExtendedFeedbackCard extends StatelessWidget {
  final String? title;
  final String? avatarUrl;
  final DateTime? datePosted;
  final String? text;
  final int? helpfulCount;
  final VoidCallback? onEdit;
  final VoidCallback? onDelete;

  const UiKitExtendedFeedbackCard({
    super.key,
    this.title,
    this.avatarUrl,
    this.datePosted,
    this.text,
    this.helpfulCount,
    this.onEdit,
    this.onDelete,
  });

  @override
  Widget build(BuildContext context) {
    final textTheme = context.uiKitTheme?.boldTextTheme;

    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        UiKitHeaderWithLeading(
          leading: context.userAvatar(
            size: UserAvatarSize.x24x24,
            type: UserTileType.ordinary,
            userName: title ?? '',
            imageUrl: avatarUrl,
          ),
          title: title ?? '',
          subtitle: datePosted?.timeAgo,
          trailing: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              GestureDetector(
                onTap: onEdit,
                child: const ImageWidget(
                  iconData: ShuffleUiKitIcons.pencil,
                  color: ColorsFoundation.darkNeutral900,
                ),
              ),
              SpacingFoundation.horizontalSpace12,
              GestureDetector(
                onTap: onDelete,
                child: const ImageWidget(
                  iconData: ShuffleUiKitIcons.trash,
                  color: ColorsFoundation.darkNeutral900,
                ),
              ),
            ],
          ),
        ),
        SpacingFoundation.verticalSpace12,
        Text(
          text ?? '',
          style: textTheme?.caption1Medium,
        ),
        SpacingFoundation.verticalSpace12,
        Row(
          mainAxisSize: MainAxisSize.max,
          children: [
            const Spacer(),
            const ImageWidget(
              iconData: ShuffleUiKitIcons.like,
              color: ColorsFoundation.darkNeutral900,
            ),
            SpacingFoundation.horizontalSpace8,
            Text(
              S.of(context).HelpfulNCount(helpfulCount ?? ''),
              style: textTheme?.caption2Medium.copyWith(color: ColorsFoundation.darkNeutral900),
            )
          ],
        ),
      ],
    );
  }
}
