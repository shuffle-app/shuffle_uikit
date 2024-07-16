import 'package:flutter/material.dart';
import 'package:shuffle_uikit/shuffle_uikit.dart';

class UiKitChatCardWithReplyOut extends StatelessWidget {
  const UiKitChatCardWithReplyOut({
    super.key,
    required this.timeOfDay,
    required this.onReplyMassageTap,
    required this.replyUserType,
    required this.replyUserAvatar,
    required this.replyText,
    required this.replySenderName,
    required this.id,
    required this.replyMessageId,
    this.sentByMe = false,
    this.text,
    this.child,
    this.onReplyMessage,
  });

  final String replyUserAvatar;
  final String replySenderName;
  final UserTileType replyUserType;
  final ValueChanged<int>? onReplyMassageTap;
  final ValueChanged<int>? onReplyMessage;
  final DateTime timeOfDay;
  final String? text;
  final bool sentByMe;
  final String replyText;
  final Widget? child;
  final int id;
  final int replyMessageId;

  @override
  Widget build(BuildContext context) {
    final theme = context.uiKitTheme;
    final width = 0.7.sw;
    final lightTheme = theme?.themeMode == ThemeMode.light;
    final colorScheme = theme?.colorScheme;

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
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Text(
            formatChatMessageDate(timeOfDay.toLocal()),
            style: theme?.regularTextTheme.caption2.copyWith(
              color: theme.colorScheme.darkNeutral900,
            ),
          ),
          SpacingFoundation.verticalSpace2,
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Flexible(
                child: UiKitCardWrapper(
                  color: sentByMe ? Colors.white : theme?.colorScheme.surface3,
                  child: text != null
                      ? Column(
                          children: [
                            GestureDetector(
                              onTap: () => onReplyMassageTap?.call(replyMessageId),
                              child: UiKitCardWrapper(
                                color: ColorsFoundation.neutral16,
                                width: width,
                                borderRadius: BorderRadiusFoundation.all10,
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
                                              : colorScheme?.inverseBodyTypography,
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
                                style:
                                    theme?.boldTextTheme.caption1Medium.copyWith(color: sentByMe ? Colors.black : null),
                              ),
                            ),
                          ],
                        ).paddingAll(EdgeInsetsFoundation.all12)
                      : child!.paddingAll(EdgeInsetsFoundation.all12),
                ),
              ),
              Transform(
                transform: Matrix4.identity()..scale(-1.0, 1.0),
                child: CustomPaint(
                  painter: _MessageTriangle(color: sentByMe ? Colors.white : theme!.colorScheme.surface3),
                ),
              ),
            ],
          )
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
      ..quadraticBezierTo(1.w, 5.h, 0, 20.h)
      ..lineTo(30.w, 0)
      ..close();

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(_) => false;
}
