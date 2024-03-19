import 'package:flutter/material.dart';
import 'package:shuffle_uikit/shuffle_uikit.dart';

class UiKitVideoReactionTile extends StatelessWidget {
  final String? authorAvatarUrl;
  final String? authorName;
  final UserTileType? authorType;
  final DateTime? reactionDate;
  final DateTime? eventDate;
  final String? eventName;
  final String? placeName;

  const UiKitVideoReactionTile({
    Key? key,
    this.authorAvatarUrl,
    this.authorType,
    this.authorName,
    this.reactionDate,
    this.eventDate,
    this.eventName,
    this.placeName,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final boldTextTheme = context.uiKitTheme?.boldTextTheme;

    return Row(
      mainAxisSize: MainAxisSize.max,
      children: [
        context.userAvatar(
          size: UserAvatarSize.x48x48,
          type: authorType ?? UserTileType.ordinary,
          userName: authorName ?? '',
          imageUrl: authorAvatarUrl,
        ),
        SpacingFoundation.horizontalSpace12,
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisSize: MainAxisSize.min,
            children: [
              RichText(
                text: TextSpan(
                  children: [
                    TextSpan(
                      text: authorName,
                      style: boldTextTheme?.caption1Bold,
                    ),
                    if (reactionDate != null)
                      TextSpan(
                        text: '  ${formatDateTimeDifferenceWithMonthName(reactionDate!)}',
                        style: boldTextTheme?.caption1Bold.copyWith(color: Colors.white38),
                      ),
                  ],
                ),
              ),
              if (eventName != null) SpacingFoundation.verticalSpace2,
              if (eventName != null)
                RichText(
                  text: TextSpan(
                    children: [
                      TextSpan(
                        text: eventName!,
                        style: boldTextTheme?.caption1Bold,
                      ),
                      if (eventDate != null)
                        TextSpan(
                          text: '  ${formatDateTimeDifferenceWithMonthName(eventDate!)}',
                          style: boldTextTheme?.caption1Bold.copyWith(color: Colors.white38),
                        ),
                    ],
                  ),
                ),
              SpacingFoundation.verticalSpace2,
              Align(
                alignment: Alignment.centerLeft,
                child: UiKitPlaceTag(
                  placeName: placeName ?? '',
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
