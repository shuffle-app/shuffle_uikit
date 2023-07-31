import 'package:flutter/material.dart';
import 'package:shuffle_uikit/shuffle_uikit.dart';

class UiKitBadgeOutlined extends StatelessWidget {
  final Widget child;

  const UiKitBadgeOutlined({super.key, required this.child});

  UiKitBadgeOutlined.text({super.key, required String text})
      : child = Text(
          text,
          style: UiKitBoldTextTheme().caption1Bold,
        );

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      shape: RoundedRectangleBorder(

        borderRadius: BorderRadiusFoundation.all24,
        side:  BorderSide(
          color: Colors.white,
          width: 2.w,
        ),
      ),
      child: child.paddingSymmetric(
          vertical: SpacingFoundation.verticalSpacing6,
          horizontal: SpacingFoundation.horizontalSpacing24),
    );
  }
}
