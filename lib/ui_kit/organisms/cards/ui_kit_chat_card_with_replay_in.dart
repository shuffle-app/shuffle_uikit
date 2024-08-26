import 'package:flutter/material.dart';
import 'package:shuffle_uikit/shuffle_uikit.dart';

class UiKitChatCardWithReplyIn extends StatelessWidget {
  const UiKitChatCardWithReplyIn({
    super.key,
    required this.timeOfDay,
    required this.onReplyMassageTap,
    required this.replyUserAvatar,
    required this.replyUserType,
    required this.replyText,
    required this.replySenderName,
    required this.id,
    required this.showAvatar,
    required this.replyMessageId,
    this.senderNickname,
    this.text,
    this.child,
    this.onReplyMessage,
    this.avatarUrl,
    this.senderName,
    this.senderType,
    this.onUsernameTapped,
  });

  final String replyUserAvatar;
  final String replySenderName;
  final String? senderNickname;
  final String? avatarUrl;
  final String? senderName;
  final UserTileType? senderType;
  final UserTileType replyUserType;
  final ValueChanged<int>? onReplyMassageTap;
  final ValueChanged<int>? onReplyMessage;
  final DateTime timeOfDay;
  final String? text;
  final String replyText;
  final Widget? child;
  final int id;
  final int replyMessageId;
  final bool showAvatar;
  final VoidCallback? onUsernameTapped;

  bool get _dataIsValid => avatarUrl != null && senderName != null && senderType != null;

  @override
  Widget build(BuildContext context) {
    final theme = context.uiKitTheme;
    final width = 0.7.sw;
    final colorScheme = theme?.colorScheme;
    final lightTheme = theme?.themeMode == ThemeMode.light;

    return Dismissible(
      key: Key(id.toString()),
      direction: DismissDirection.horizontal,
      confirmDismiss: (direction) async {
        onReplyMessage?.call(id);
        FeedbackIsolate.instance.addEvent(FeedbackIsolateHaptics(
          intensities: [170, 200],
          pattern: [10, 5],
        ));
        return false;
      },
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: showAvatar
                ? 1.sw -
                    EdgeInsetsFoundation.horizontal16 -
                    EdgeInsetsFoundation.horizontal16 -
                    EdgeInsetsFoundation.horizontal20 -
                    EdgeInsetsFoundation.horizontal8
                : width + EdgeInsetsFoundation.horizontal20 + EdgeInsetsFoundation.horizontal12,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                if (senderNickname != null)
                  GestureDetector(
                    onTap: onUsernameTapped,
                    child: Text(
                      '@$senderNickname',
                      style: theme?.regularTextTheme.caption4Regular.copyWith(
                        color: ColorsFoundation.mutedText,
                      ),
                    ),
                  ),
                Text(
                  formatChatMessageDate(timeOfDay.toLocal()),
                  style: theme?.regularTextTheme.caption4Regular.copyWith(
                    color: theme.colorScheme.darkNeutral900,
                  ),
                ),
              ],
            ).paddingOnly(left: showAvatar ? 0.0625.sw : 0),
          ),
          SpacingFoundation.verticalSpace2,
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              if (showAvatar && _dataIsValid)
                context
                    .userAvatar(
                      size: UserAvatarSize.x20x20,
                      type: senderType!,
                      userName: senderName!,
                      imageUrl: avatarUrl!,
                    )
                    .paddingOnly(right: EdgeInsetsFoundation.horizontal8),
              CustomPaint(
                painter: _MessageTriangle(
                  color: theme?.colorScheme.surface2 ?? theme?.cardColor ?? Colors.white,
                ),
              ),
              Flexible(
                child: UiKitCardWrapper(
                  color: theme?.colorScheme.surface2,
                  child: text != null
                      ? Column(
                          children: [
                            GestureDetector(
                              onTap: () => onReplyMassageTap?.call(replyMessageId),
                              child: UiKitCardWrapper(
                                color: ColorsFoundation.neutral16,
                                width: width,
                                borderRadius: BorderRadiusFoundation.all12,
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    context.userAvatar(
                                      size: UserAvatarSize.x20x20,
                                      type: replyUserType,
                                      userName: replySenderName,
                                      imageUrl: replyUserAvatar,
                                    ),
                                    SpacingFoundation.horizontalSpace4,
                                    Flexible(
                                      child: Text(
                                        replyText,
                                        style: theme?.regularTextTheme.caption3.copyWith(
                                          color: lightTheme
                                              ? ColorsFoundation.lightBodyTypographyColor
                                              : colorScheme?.bodyTypography,
                                        ),
                                        maxLines: 1,
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                    ),
                                  ],
                                ).paddingAll(EdgeInsetsFoundation.all4),
                              ),
                            ),
                            SpacingFoundation.verticalSpace4,
                            SizedBox(
                              width: width,
                              child: Text(
                                text!,
                                style: theme?.boldTextTheme.caption1Medium,
                              ),
                            ),
                          ],
                        ).paddingAll(EdgeInsetsFoundation.all12)
                      : child!.paddingAll(EdgeInsetsFoundation.all12),
                ),
              ),
            ],
          ),
        ],
      ).paddingSymmetric(horizontal: EdgeInsetsFoundation.horizontal20),
    );
  }
}

class _MessageTriangle extends CustomPainter {
  final Color color;

  _MessageTriangle({required this.color});

  @override
  void paint(canvas, _) {
    Paint paint = Paint()..color = color;
    Path path = Path();

    path
      ..lineTo(-8.w, 0)
      ..quadraticBezierTo(1.w, 6.h, 0, 20.h)
      ..lineTo(30.w, 0)
      ..close();

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(_) => false;
}
