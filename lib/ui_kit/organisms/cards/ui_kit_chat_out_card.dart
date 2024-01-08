import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:shuffle_uikit/shuffle_uikit.dart';

class UiKitChatOutCard extends StatelessWidget {
  const UiKitChatOutCard({
    super.key,
    required this.timeOfDay,
    this.sentByMe = false,
    this.text,
    this.child,
  });

  final DateTime timeOfDay;
  final String? text;
  final Widget? child;
  final bool sentByMe;

  @override
  Widget build(BuildContext context) {
    final theme = context.uiKitTheme;
    final width = 0.7.sw;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Text(
          DateFormat.jm().format(timeOfDay).toLowerCase(),
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
                    ? SizedBox(
                        width: width,
                        child: Text(
                          text!,
                          style: theme?.boldTextTheme.caption1Medium.copyWith(color: sentByMe ? Colors.black : null),
                        ).paddingAll(EdgeInsetsFoundation.all12),
                      )
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
      ..quadraticBezierTo(1.w, 5.h, 0, 20.h)
      ..lineTo(30.w, 0)
      ..close();

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(_) => false;
}
