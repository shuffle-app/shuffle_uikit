import 'package:flutter/material.dart';
import 'package:shuffle_uikit/shuffle_uikit.dart';

class UiKitChatInCard extends StatelessWidget {
  const UiKitChatInCard({
    super.key,
    required this.timeOfDay,
    this.text,
    this.child,
    this.onReplyMessage,
    required this.id,
    this.avatarUrl,
    this.senderName,
    this.senderType,
  });

  final DateTime timeOfDay;
  final String? text;
  final String? avatarUrl;
  final String? senderName;
  final UserTileType? senderType;
  final Widget? child;
  final ValueChanged<int>? onReplyMessage;
  final int id;

  bool get showAvatar => avatarUrl != null && senderName != null && senderType != null;

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
              if (showAvatar)
                context.userAvatar(
                  size: UserAvatarSize.x20x20,
                  type: senderType!,
                  userName: senderName!,
                  imageUrl: avatarUrl!,
                ),
              SpacingFoundation.horizontalSpace8,
              CustomPaint(
                  painter: _MessageTriangle(color: theme?.colorScheme.surface2 ?? theme?.cardColor ?? Colors.white)),
              Flexible(
                child: UiKitCardWrapper(
                  color: theme?.colorScheme.surface2,
                  child: text != null
                      ? SizedBox(
                          width: width,
                          child: Text(
                            text!,
                            style: theme?.boldTextTheme.caption1Medium,
                          ).paddingAll(EdgeInsetsFoundation.all12),
                        )
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
