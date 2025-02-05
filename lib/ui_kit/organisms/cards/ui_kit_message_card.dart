import 'package:flutter/material.dart';
import 'package:shuffle_uikit/shuffle_uikit.dart';

class UiKitMessageCard extends StatefulWidget {
  const UiKitMessageCard({
    super.key,
    required this.name,
    required this.userType,
    required this.subtitle,
    required this.avatarPath,
    required this.lastMessage,
    required this.lastMessageTime,
    required this.onTap,
    this.lastMessageSenderName,
    this.chatName,
    this.subtitleIconPath,
    this.unreadMessageCount,
    this.disabled = false,
    this.onDelete,
  });

  final String name;
  final String? lastMessageSenderName;
  final String? chatName;
  final String subtitle;
  final String? subtitleIconPath;
  final String lastMessage;
  final String lastMessageTime;
  final String avatarPath;
  final UserTileType userType;
  final VoidCallback onTap;
  final VoidCallback? onDelete;
  final bool disabled;

  final int? unreadMessageCount;

  factory UiKitMessageCard.empty() {
    return UiKitMessageCard(
      name: '',
      userType: UserTileType.ordinary,
      subtitle: '',
      avatarPath: '',
      lastMessage: '',
      lastMessageTime: '',
      onTap: () {},
      lastMessageSenderName: '',
    );
  }

  @override
  State<UiKitMessageCard> createState() => _UiKitMessageCardState();
}

class _UiKitMessageCardState extends State<UiKitMessageCard> {
  bool canDelete = false;

  @override
  Widget build(BuildContext context) {
    final theme = context.uiKitTheme;
    final boldTextTheme = theme?.boldTextTheme;
    final regularTextTheme = theme?.regularTextTheme;
    final colorScheme = theme?.colorScheme;
    final cardColor = theme?.colorScheme.surface1;

    return ConstrainedBox(
      constraints: BoxConstraints(
        minHeight: 0.325 * 0.9.sw,
        maxHeight: 0.375 * 0.9.sw,
        maxWidth: 1.sw,
        minWidth: 1.sw - EdgeInsetsFoundation.horizontal32,
      ),
      child: Material(
        borderRadius: BorderRadiusFoundation.all24,
        clipBehavior: Clip.hardEdge,
        color: cardColor,
        child: TapRegion(
          onTapOutside: (event) {
            setState(() => canDelete = false);
          },
          child: InkWell(
            onTap: () {
              if (!widget.disabled) widget.onTap.call();
              setState(() => canDelete = false);
            },
            onLongPress: () {
              setState(() => canDelete = true);
            },
            child: Ink(
              child: Stack(
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Opacity(
                        opacity: widget.disabled ? 0.5 : 1.0,
                        child: Column(children: [
                          if (widget.chatName != null)
                            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
                              Text(
                                widget.chatName!,
                                style: boldTextTheme?.caption1Bold.copyWith(overflow: TextOverflow.ellipsis),
                                maxLines: 1,
                              ),
                              Text(
                                widget.lastMessageTime,
                                style: regularTextTheme?.caption4.copyWith(
                                  color: colorScheme?.darkNeutral900,
                                ),
                                textAlign: TextAlign.end,
                              ),
                            ]).paddingOnly(bottom: SpacingFoundation.verticalSpacing4),
                          Row(
                            children: [
                              context.userAvatar(
                                size: UserAvatarSize.x40x40,
                                type: widget.userType,
                                userName: widget.name,
                                imageUrl: widget.avatarPath,
                              ),
                              SpacingFoundation.horizontalSpace12,
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.stretch,
                                  children: [
                                    Row(
                                      children: [
                                        Expanded(
                                          child: Row(
                                            children: [
                                              Flexible(
                                                child: Text(
                                                  widget.name,
                                                  style: (widget.chatName != null
                                                          ? boldTextTheme?.caption2Bold
                                                          : boldTextTheme?.caption1Medium)
                                                      ?.copyWith(overflow: TextOverflow.ellipsis),
                                                  maxLines: 2,
                                                ),
                                              ),
                                              SpacingFoundation.horizontalSpace4,
                                              UiKitUserBadge(userType: widget.userType),
                                              SpacingFoundation.horizontalSpace4,
                                            ],
                                          ),
                                        ),
                                        if (widget.chatName == null)
                                          Text(
                                            widget.lastMessageTime,
                                            style: regularTextTheme?.caption4.copyWith(
                                              color: colorScheme?.darkNeutral900,
                                            ),
                                            textAlign: TextAlign.end,
                                          ),
                                      ],
                                    ),
                                    SpacingFoundation.verticalSpace2,
                                    Row(
                                      children: [
                                        if (widget.subtitleIconPath != null)
                                          ImageWidget(
                                            link: widget.subtitleIconPath,
                                            height: 14.h,
                                            fit: BoxFit.fitHeight,
                                            color: colorScheme?.darkNeutral900,
                                          ).paddingOnly(right: EdgeInsetsFoundation.horizontal4),
                                        Flexible(
                                          child: Text(
                                            widget.subtitle,
                                            style: (widget.chatName != null
                                                    ? boldTextTheme?.caption2Bold
                                                    : boldTextTheme?.caption1Bold)
                                                ?.copyWith(
                                              color: colorScheme?.darkNeutral900,
                                              overflow: TextOverflow.ellipsis,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          )
                        ]),
                      ),
                      SpacingFoundation.verticalSpace4,
                      Row(
                        children: [
                          Expanded(
                            child: RichText(
                              maxLines: 1,
                              text: TextSpan(
                                children: [
                                  if (widget.lastMessageSenderName != null && widget.lastMessageSenderName!.isNotEmpty)
                                    TextSpan(
                                      text: '${widget.lastMessageSenderName}: ',
                                      style: boldTextTheme?.caption3Medium.copyWith(
                                        overflow: TextOverflow.ellipsis,
                                        color: ColorsFoundation.neutral48,
                                      ),
                                    ),
                                  TextSpan(
                                    text: widget.lastMessage,
                                    style: boldTextTheme?.caption3Medium.copyWith(
                                      overflow: TextOverflow.ellipsis,
                                      color: widget.disabled
                                          ? colorScheme?.inverseSurface
                                          : widget.unreadMessageCount == 0
                                              ? colorScheme?.darkNeutral900
                                              : null,
                                    ),
                                  ),
                                ],
                              ),
                              textAlign: TextAlign.start,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                          SpacingFoundation.horizontalSpace4,
                          if (widget.unreadMessageCount != null && widget.unreadMessageCount! > 0)
                            Container(
                              decoration: BoxDecoration(
                                color: colorScheme?.inversePrimary,
                                shape: BoxShape.circle,
                              ),
                              child: Text(
                                widget.unreadMessageCount!.toStringAsFixed(0),
                                style: boldTextTheme?.caption1Bold.copyWith(color: colorScheme?.primary),
                                textAlign: TextAlign.center,
                              ).paddingAll(EdgeInsetsFoundation.all4),
                            )
                        ],
                      ),
                    ],
                  ).paddingAll(EdgeInsetsFoundation.all16),
                  AnimatedSwitcher(
                    duration: const Duration(milliseconds: 200),
                    child: canDelete
                        ? ColoredBox(
                            color: ColorsFoundation.neutral48,
                            child: Center(
                              child: context
                                  .button(
                                    data: BaseUiKitButtonData(
                                      backgroundColor: colorScheme?.surface3,
                                      iconInfo: BaseUiKitButtonIconData(
                                        iconData: ShuffleUiKitIcons.trash,
                                        size: 18.h,
                                        color: colorScheme?.inverseSurface,
                                      ),
                                      borderColor: colorScheme?.inverseSurface,
                                      onPressed: widget.onDelete,
                                    ),
                                    // blurred: true,
                                  )
                                  .paddingSymmetric(vertical: EdgeInsetsFoundation.vertical24),
                            ),
                          )
                        : const SizedBox.shrink(),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
