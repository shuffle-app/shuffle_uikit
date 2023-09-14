import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shuffle_uikit/shuffle_uikit.dart';

class UiKitMessageCard extends StatelessWidget {
  const UiKitMessageCard({
    super.key,
    required this.time,
    this.text,
    this.child,
  });

  final String time;
  final String? text;
  final Widget? child;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          time,
          style: context.uiKitTheme?.regularTextTheme.caption2.copyWith(
            color: context.uiKitTheme?.colorScheme.darkNeutral900,
          ),
        ),
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CustomPaint(
              painter: MessageTriangle(context.uiKitTheme!.cardColor),
            ),
            Flexible(
              child: UiKitCardWrapper(
                child: text != null
                    ? ConstrainedBox(
                        constraints: BoxConstraints(maxWidth: 225.w),
                        child: Text(
                          text!,
                          style: context.uiKitTheme?.boldTextTheme.caption1Medium,
                        ),
                      ).paddingAll(EdgeInsetsFoundation.all12)
                    : child!.paddingAll(EdgeInsetsFoundation.all12),
              ),
            ),
          ],
        ),
      ],
    );
  }
}

class MessageTriangle extends CustomPainter {
  final Color color;

  MessageTriangle(this.color);

  @override
  void paint(canvas, size) {
    Paint paint = Paint()..color = color;
    Path path = Path();

    path
      ..lineTo(-8.w, 0)
      ..lineTo(2.w, 20.h)
      ..lineTo(30.w, 0)
      ..close();

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(oldDelegate) => false;
}

class UiKitInviteMessage extends StatelessWidget {
  const UiKitInviteMessage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Expanded(
              child: Stack(
                children: [
                  BorderedUserCircleAvatar(
                    imageUrl: GraphicsFoundation.instance.png.mockAvatar.path,
                    size: 40.sp,
                  ),
                  Positioned(
                    left: EdgeInsetsFoundation.horizontal32,
                    child: BorderedUserCircleAvatar(
                      size: 40.sp,
                      imageUrl: GraphicsFoundation.instance.png.mockAvatar.path,
                    ),
                  ),
                  Positioned(
                    left: EdgeInsetsFoundation.horizontal32 * 2,
                    child: BorderedUserCircleAvatar(
                      size: 40.sp,
                      imageUrl: GraphicsFoundation.instance.png.mockAvatar.path,
                    ),
                  ),
                  Positioned(
                    left: EdgeInsetsFoundation.horizontal32 * 3,
                    child: CircleAvatar(
                      radius: 20.sp,
                      backgroundColor: context.uiKitTheme?.colorScheme.surface3,
                      child: Text(
                        '+4',
                        style: context.uiKitTheme?.regularTextTheme.caption1.copyWith(
                          color: context.uiKitTheme?.colorScheme.darkNeutral900,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Flexible(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Text(
                        '@m3dv3d3v',
                        style: context.uiKitTheme?.boldTextTheme.caption1Bold,
                      ),
                      SpacingFoundation.horizontalSpace12,
                      ImageWidget(
                        svgAsset: GraphicsFoundation.instance.svg.star2,
                        color: context.uiKitTheme?.colorScheme.inversePrimary,
                        height: 16.h,
                      ),
                    ],
                  ),
                  Text(
                    'invites 7 people to',
                    style: context.uiKitTheme?.boldTextTheme.caption1Medium,
                  ),
                ],
              ),
            ),
          ],
        ),
        SpacingFoundation.verticalSpace12,
        UiKitCardWrapper(
          color: context.uiKitTheme?.colorScheme.surface4,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              BorderedUserCircleAvatar(
                size: 40.sp,
                imageUrl: GraphicsFoundation.instance.png.mockAvatar.path,
              ),
              SpacingFoundation.horizontalSpace12,
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('At.mosphere', style: context.uiKitTheme?.boldTextTheme.caption1Bold),
                  SpacingFoundation.horizontalSpace2,
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      ImageWidget(
                        svgAsset: GraphicsFoundation.instance.svg.cocktail,
                        color: context.uiKitTheme?.colorScheme.darkNeutral900,
                      ),
                      SpacingFoundation.horizontalSpace4,
                      Text(
                        'Club',
                        style: context.uiKitTheme?.boldTextTheme.caption2Bold.copyWith(
                          color: context.uiKitTheme?.colorScheme.darkNeutral900,
                        ),
                      ),
                      SpacingFoundation.horizontalSpace8,
                      ImageWidget(
                        svgAsset: GraphicsFoundation.instance.svg.cocktail,
                        color: context.uiKitTheme?.colorScheme.darkNeutral900,
                      ),
                      SpacingFoundation.horizontalSpace4,
                      Text(
                        'Medium',
                        style: context.uiKitTheme?.boldTextTheme.caption2Bold.copyWith(
                          color: context.uiKitTheme?.colorScheme.darkNeutral900,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              SpacingFoundation.horizontalSpace12,
              Positioned(
                top: 2.h,
                right: 2.w,
                child: IconButton(
                  onPressed: () {},
                  icon: Icon(
                    CupertinoIcons.chevron_right_circle,
                    color: context.uiKitTheme?.colorScheme.inversePrimary,
                    size: 30.h,
                  ),
                ),
              ),
            ],
          ),
        ),
        SpacingFoundation.verticalSpace12,
        context.gradientButton(
          data: BaseUiKitButtonData(
            onPressed: () {},
            text: 'INVITE MORE PEOPLE',
          ),
        ),
      ],
    );
  }
}
