import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:shuffle_uikit/shuffle_uikit.dart';

class UiKitChatInCard extends StatelessWidget {
  const UiKitChatInCard({
    super.key,
    required this.timeOfDay,
    this.text,
    this.child,
  });

  final DateTime timeOfDay;
  final String? text;
  final Widget? child;

  @override
  Widget build(BuildContext context) {
    final theme = context.uiKitTheme;
    final width = 0.7.sw;
    final height = width * 0.3;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
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
          children: [
            CustomPaint(painter: _MessageTriangle(color: theme?.colorScheme.surface2 ?? theme?.cardColor ?? Colors.white)),
            Flexible(
              child: UiKitCardWrapper(
                color: theme?.colorScheme.surface2,
                child: text != null
                    ? ConstrainedBox(
                        constraints: BoxConstraints.expand(width: width, height: height),
                        child: Text(
                          text!,
                          style: theme?.boldTextTheme.caption1Medium,
                        ),
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
      ..quadraticBezierTo(1.w, 5.h, 0, 20.h)
      ..lineTo(30.w, -0.25.w)
      ..close();

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(_) => false;
}
