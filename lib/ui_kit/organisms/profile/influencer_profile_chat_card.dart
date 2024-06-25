import 'package:flutter/material.dart';
import 'package:shuffle_uikit/shuffle_uikit.dart';

class UiKitInfluencerProfileChatCard extends StatelessWidget {
  final String? chatCover;
  final String? chatLastMessage;
  final int? newCommentsCount;
  final int? allCommentsCount;
  final DateTime? lastMessageDate;
  final DateTime? chatStartDate;
  final String? chatContentTitle;
  final String? chatContentSubtitle;
  final String? chatContentImage;
  final String? chatContentStartMessage;

  const UiKitInfluencerProfileChatCard({
    super.key,
    this.chatCover,
    this.chatLastMessage,
    this.newCommentsCount,
    this.allCommentsCount,
    this.lastMessageDate,
    this.chatStartDate,
    this.chatContentTitle,
    this.chatContentSubtitle,
    this.chatContentImage,
    this.chatContentStartMessage,
  });

  double get chatCoverWidth => 0.8.sw;

  double get chatCoverHeight => chatCoverWidth * 0.304;

  double get contentImageWidth => 0.15.sw;

  double get contentImageHeight => contentImageWidth * 0.714;

  @override
  Widget build(BuildContext context) {
    final boldTextTheme = context.uiKitTheme?.boldTextTheme;
    final regularTextTheme = context.uiKitTheme?.regularTextTheme;
    final colorScheme = context.uiKitTheme?.colorScheme;

    return Column(
      mainAxisSize: MainAxisSize.max,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        ClipRRect(
          borderRadius: BorderRadiusFoundation.onlyTop16,
          child: ImageWidget(
            link: chatCover,
            width: chatCoverWidth,
            height: chatCoverHeight,
            fit: BoxFit.cover,
          ),
        ),
        SpacingFoundation.verticalSpace8,
        Text(
          chatLastMessage ?? '',
          style: boldTextTheme?.caption2Medium,
          textAlign: TextAlign.left,
          maxLines: 4,
          overflow: TextOverflow.ellipsis,
        ),
        if (newCommentsCount != null && lastMessageDate != null) SpacingFoundation.verticalSpace8,
        if (newCommentsCount != null && lastMessageDate != null)
          Row(
            mainAxisSize: MainAxisSize.max,
            children: [
              Text(
                '+ $newCommentsCount ${S.current.Comments(newCommentsCount!)}',
                style: boldTextTheme?.caption3Medium,
              ),
              SpacingFoundation.horizontalSpace2,
              ImageWidget(
                iconData: ShuffleUiKitIcons.message,
                color: colorScheme?.inversePrimary,
                height: 12.h,
                fit: BoxFit.fitHeight,
              ),
              const Spacer(),
              Text(
                formatDifference(lastMessageDate!),
                style: regularTextTheme?.caption3.copyWith(color: ColorsFoundation.mutedText),
              )
            ],
          ),
        SpacingFoundation.verticalSpace8,
        Row(
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadiusFoundation.all8,
              child: ImageWidget(
                link: chatContentImage,
                width: contentImageWidth,
                height: contentImageHeight,
                fit: BoxFit.cover,
              ),
            ),
            SpacingFoundation.horizontalSpace4,
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Text(
                    chatContentTitle ?? '',
                    style: boldTextTheme?.caption3Medium,
                    textAlign: TextAlign.left,
                    maxLines: 2,
                  ),
                  Text(
                    chatContentSubtitle ?? '',
                    style: boldTextTheme?.caption3Medium.copyWith(color: ColorsFoundation.mutedText),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  )
                ],
              ),
            ),
          ],
        ),
        SpacingFoundation.verticalSpace8,
        Text(
          chatContentStartMessage ?? '',
          style: boldTextTheme?.caption2Medium,
          maxLines: 2,
          overflow: TextOverflow.ellipsis,
        ),
        SpacingFoundation.verticalSpace8,
        Row(
          mainAxisSize: MainAxisSize.max,
          children: [
            Text(
              '$allCommentsCount ${S.current.Comments(allCommentsCount!)}',
              style: boldTextTheme?.caption3Medium,
            ),
            SpacingFoundation.horizontalSpace2,
            ImageWidget(
              iconData: ShuffleUiKitIcons.message,
              color: colorScheme?.inversePrimary,
              height: 12.h,
              fit: BoxFit.fitHeight,
            ),
            const Spacer(),
            Text(
              formatDifference(chatStartDate!),
              style: regularTextTheme?.caption3.copyWith(color: ColorsFoundation.mutedText),
            )
          ],
        ),
      ],
    );
  }
}
