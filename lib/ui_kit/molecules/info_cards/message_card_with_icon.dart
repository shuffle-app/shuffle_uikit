import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shuffle_uikit/shuffle_uikit.dart';

class UiKitMessageCardWithIcon extends StatelessWidget {
  final String message;
  final ImageWidget icon;
  final Axis layoutDirection;

  const UiKitMessageCardWithIcon({
    Key? key,
    required this.message,
    required this.icon,
    required this.layoutDirection,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    switch (layoutDirection) {
      case Axis.horizontal:
        return _HorizontalMessageCard(
          message: message,
          icon: icon,
        );
      case Axis.vertical:
        return _VerticalMessageCard(
          message: message,
          icon: icon,
        );
    }
  }
}

class _VerticalMessageCard extends StatelessWidget {
  final String message;
  final ImageWidget icon;

  const _VerticalMessageCard({
    Key? key,
    required this.message,
    required this.icon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final messageStyle = context.uiKitTheme?.boldTextTheme.caption1UpperCaseMedium;
    return SizedBox(
      height: 144.h,
      width: 106.w,
      child: CardWrapper(
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            icon,
            SpacingFoundation.verticalSpace8,
            Expanded(
              child: Text(
                message.toUpperCase(),
                style: messageStyle,
                textAlign: TextAlign.center,
              ),
            ),
          ],
        ).paddingAll(EdgeInsetsFoundation.all16),
      ),
    );
  }
}

class _HorizontalMessageCard extends StatelessWidget {
  final String message;
  final ImageWidget icon;

  const _HorizontalMessageCard({
    Key? key,
    required this.message,
    required this.icon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final messageStyle = context.uiKitTheme?.boldTextTheme.bodyUpperCase;
    return CardWrapper(
      child: Row(
        mainAxisSize: MainAxisSize.max,
        children: [
          icon,
          SpacingFoundation.horizontalSpace12,
          Expanded(
            child: Text(
              message.toUpperCase(),
              style: messageStyle,
            ),
          ),
        ],
      ).paddingAll(EdgeInsetsFoundation.all16),
    );
  }
}
