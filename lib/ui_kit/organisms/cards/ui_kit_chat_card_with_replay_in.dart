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
    this.text,
    this.child,
    this.onReplyMessage,
  });

  final String replyUserAvatar;
  final String replySenderName;
  final UserTileType replyUserType;
  final VoidCallback? onReplyMassageTap;
  final ValueChanged<int>? onReplyMessage;
  final DateTime timeOfDay;
  final String? text;
  final String replyText;
  final Widget? child;
  final int id;

  @override
  Widget build(BuildContext context) {
    final theme = context.uiKitTheme;
    final width = 0.7.sw;

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
          Text(
            formatChatMessageDate(timeOfDay.toLocal()),
            style: theme?.regularTextTheme.caption2.copyWith(
              color: theme.colorScheme.darkNeutral900,
            ),
          ),
          SpacingFoundation.verticalSpace2,
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
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
                              onTap: onReplyMassageTap,
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
                                        style: theme?.regularTextTheme.caption3,
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
