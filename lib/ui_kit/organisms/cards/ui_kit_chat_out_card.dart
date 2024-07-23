import 'package:flutter/material.dart';
import 'package:shuffle_uikit/shuffle_uikit.dart';

class UiKitChatOutCard extends StatelessWidget {
  const UiKitChatOutCard({
    super.key,
    required this.timeOfDay,
    this.sentByMe = false,
    this.text,
    this.child,
    required this.id,
    this.onReplyMessage,
    this.brightness = Brightness.light,
  });

  final DateTime timeOfDay;
  final String? text;
  final Widget? child;
  final bool sentByMe;
  final int id;
  final ValueChanged<int>? onReplyMessage;
  final Brightness brightness;

  @override
  Widget build(BuildContext context) {
    final theme = context.uiKitTheme;
    final width = 0.7.sw;

    return Dismissible(
      key: Key(id.toString()),
      direction: DismissDirection.endToStart,
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
            style: theme?.regularTextTheme.caption4Regular.copyWith(
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
                  color: brightness == Brightness.light ? Colors.white : Colors.black,
                  clipBehavior: Clip.hardEdge,
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
                transform: Matrix4.identity()
                  ..scale(-1.0,0.9),
                  // ..translate(0.5, 0, 0),
                child: CustomPaint(
                  painter: _MessageTriangle(
                    color: brightness == Brightness.light ? Colors.white : Colors.black,
                  ),
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
    Paint paint = Paint()
      ..color = color;
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
