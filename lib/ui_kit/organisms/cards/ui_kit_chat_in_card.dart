import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shuffle_uikit/shuffle_uikit.dart';
// ignore_for_file: prefer-single-widget-per-file

class UiKitChatInCard extends StatelessWidget {
  const UiKitChatInCard({
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
    final width = 0.7.sw;
    final height = width * 0.3;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          time,
          style: context.uiKitTheme?.regularTextTheme.caption2.copyWith(
            color: context.uiKitTheme?.colorScheme.darkNeutral900,
          ),
        ),
        SpacingFoundation.verticalSpace2,
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CustomPaint(
              painter: _MessageTriangle(color: context.uiKitTheme!.cardColor),
            ),
            Flexible(
              child: UiKitCardWrapper(
                child: text != null
                    ? ConstrainedBox(
                        constraints: BoxConstraints.expand(width: width, height: height),
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

class UiKitInviteMessageData extends StatelessWidget {
  const UiKitInviteMessageData({
    super.key,
    required this.username,
    required this.onNextTap,
    required this.placeName,
    required this.firstTagName,
    required this.firstImagePath,
    required this.secondTagName,
    required this.placeImagePath,
    required this.secondImagePath,
    required this.onInvitePeopleTap,
    required this.invitedPeopleAmount,
  });

  final String username;
  final String placeName;
  final String firstTagName;
  final String firstImagePath;
  final String secondTagName;
  final String secondImagePath;
  final String placeImagePath;
  final int invitedPeopleAmount;

  final VoidCallback onNextTap;
  final VoidCallback onInvitePeopleTap;

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
                    size: 40.w,
                  ),
                  Positioned(
                    left: EdgeInsetsFoundation.horizontal32 * 0.7.w,
                    child: BorderedUserCircleAvatar(
                      size: 40.w,
                      imageUrl: GraphicsFoundation.instance.png.mockAvatar.path,
                    ),
                  ),
                  Positioned(
                    left: EdgeInsetsFoundation.horizontal32 * 1.5.w,
                    child: BorderedUserCircleAvatar(
                      size: 40.w,
                      imageUrl: GraphicsFoundation.instance.png.mockAvatar.path,
                    ),
                  ),
                  Positioned(
                    left: EdgeInsetsFoundation.horizontal32 * 2.2.w,
                    child: CircleAvatar(
                      radius: 20.w,
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
            Column(
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
                      height: 16.w,
                    ),
                  ],
                ),
                Text(
                  'invites 7 people to',
                  style: context.uiKitTheme?.boldTextTheme.caption1Medium,
                ),
              ],
            ),
          ],
        ),
        SpacingFoundation.verticalSpace12,
        UiKitCardWrapper(
          borderRadius: BorderRadiusFoundation.all40,
          color: context.uiKitTheme?.colorScheme.surface4,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              BorderedUserCircleAvatar(
                size: 45.w,
                imageUrl: GraphicsFoundation.instance.png.mockAvatar.path,
              ),
              SpacingFoundation.horizontalSpace12,
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SpacingFoundation.verticalSpace4,
                  Text('At.mosphere', style: context.uiKitTheme?.boldTextTheme.caption1Bold),
                  SpacingFoundation.verticalSpace2,
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
                        svgAsset: GraphicsFoundation.instance.svg.label,
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
              context.badgeButtonNoValue(
                data: BaseUiKitButtonData(
                  onPressed: onNextTap,
                  icon: Icon(
                    CupertinoIcons.chevron_right_circle,
                    size: 45.w,
                    color: context.uiKitTheme?.colorScheme.inversePrimary,
                  ),
                ),
              )
            ],
          ),
        ),
        SpacingFoundation.verticalSpace12,
        ConstrainedBox(
          constraints: BoxConstraints.expand(width: double.infinity, height: 40.h),
          child: context.gradientButton(
            data: BaseUiKitButtonData(
              onPressed: onInvitePeopleTap,
              text: 'INVITE MORE PEOPLE',
            ),
          ),
        ),
      ],
    );
  }
}
