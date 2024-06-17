import 'package:flutter/material.dart';
import 'package:shuffle_uikit/shuffle_uikit.dart';

class UiKitIconedTitle extends StatelessWidget {
  const UiKitIconedTitle({super.key, required this.title, required this.icon});

  final String title;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(
        borderRadius: BorderRadiusFoundation.all24,
        color: context.uiKitTheme?.colorScheme.surface,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            icon,
            size: 26.sp,
            color: context.uiKitTheme?.colorScheme.bodyTypography,
          ),
          SpacingFoundation.horizontalSpace8,
          Text(
            title,
            style: context.uiKitTheme?.regularTextTheme.title1.copyWith(
                color: context.uiKitTheme?.colorScheme.bodyTypography),
          )
        ],
      ).paddingAll(EdgeInsetsFoundation.all24),
    );
  }
}
