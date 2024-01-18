import 'package:flutter/material.dart';
import 'package:shuffle_uikit/shuffle_uikit.dart';

class GridTitledItemWidget extends StatelessWidget {
  final String title;
  final Widget child;

  const GridTitledItemWidget({super.key, required this.title, required this.child});

  @override
  Widget build(BuildContext context) {
    final theme = context.uiKitTheme;

    return Material(
        color: Colors.transparent,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            UiKitCardWrapper(
              height: 82.sp,
              width: 82.sp,
              borderRadius: BorderRadiusFoundation.all24,
              child: child.paddingAll(SpacingFoundation.verticalSpacing16),
            ),
            SpacingFoundation.verticalSpace8,
            Text(
              title,
              style: theme?.regularTextTheme.caption3,
            )
          ],
        ));
  }
}
