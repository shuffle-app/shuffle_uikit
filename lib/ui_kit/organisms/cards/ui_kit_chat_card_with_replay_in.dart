import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:shuffle_uikit/shuffle_uikit.dart';

class UiKitChatCardWithReplyIn extends StatelessWidget {
  const UiKitChatCardWithReplyIn({
    super.key,
    required this.timeOfDay,
    required this.onReplyMassageTap,
    required this.replyUserName,
    this.text,
    required this.replayText,
    this.child,
  });

  final String replyUserName;
  final Function() onReplyMassageTap;
  final DateTime timeOfDay;
  final String? text;
  final String replayText;
  final Widget? child;

  @override
  Widget build(BuildContext context) {
    final theme = context.uiKitTheme;
    final width = 0.7.sw;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          DateFormat.jm().format(timeOfDay.toLocal()).toLowerCase(),
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
                color: theme?.colorScheme.surface2 ??
                    theme?.cardColor ??
                    Colors.white,
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
                            child: Container(
                              width: width,
                              decoration: BoxDecoration(
                                color: theme?.colorScheme.surface1,
                                borderRadius: BorderRadiusFoundation.all8,
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    replyUserName,
                                    style: theme?.boldTextTheme.caption1Medium
                                        .copyWith(
                                            color: theme.colorScheme.info),
                                  ),
                                  SpacingFoundation.verticalSpace2,
                                  Text(
                                    replayText,
                                    style: theme?.boldTextTheme.caption1Medium,
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ],
                              ).paddingAll(EdgeInsetsFoundation.all6),
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
    ).paddingSymmetric(horizontal: EdgeInsetsFoundation.horizontal20);
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
