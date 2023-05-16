import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shuffle_uikit/shuffle_uikit.dart';

class VerticalMessageCard extends StatelessWidget {
  final String message;
  final Widget? icon;

  const VerticalMessageCard({
    Key? key,
    required this.message,
    this.icon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final messageStyle = context.uiKitTheme?.boldTextTheme.caption1UpperCaseMedium;

    return SizedBox(
      width: 102.w,
      child: UiKitCardWrapper(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            if (icon != null) icon!,
            if (icon != null) SpacingFoundation.verticalSpace8,
            Text(
              /// end line symbols added to make sure that the text is more than 4 lines
              /// so that the card height is always fixed
              '${message.toUpperCase()}\n\n\n\n',
              style: messageStyle,
              textAlign: TextAlign.center,
              maxLines: 4,
            ),
          ],
        ).paddingAll(EdgeInsetsFoundation.all16),
      ),
    );
  }
}
