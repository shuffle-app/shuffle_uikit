import 'package:flutter/material.dart';
import 'package:shuffle_uikit/shuffle_uikit.dart';

class UiKitPlaceTag extends StatelessWidget {
  final String placeName;
  final Color? color;

  const UiKitPlaceTag({
    Key? key,
    required this.placeName,
    this.color,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final boldTextTheme = context.uiKitTheme?.regularTextTheme;

    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: color ?? Colors.white, width: 2),
        borderRadius: BorderRadiusFoundation.all24,
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          ImageWidget(
            iconData: ShuffleUiKitIcons.landmark,
            color: color ?? Colors.white,
          ),
          SpacingFoundation.horizontalSpace4,
          Text(
            placeName,
            style: boldTextTheme?.caption2.copyWith(color: color ?? Colors.white),
          ),
        ],
      ).paddingSymmetric(horizontal: EdgeInsetsFoundation.horizontal12, vertical: EdgeInsetsFoundation.vertical2),
    );
  }
}
