import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:shuffle_uikit/shuffle_uikit.dart';

class UiKitIconedTitle extends StatelessWidget {
  const UiKitIconedTitle({super.key, required this.title, required this.icon});

  final String title;
  final String icon;

  @override
  Widget build(BuildContext context) {
    return UiKitCardWrapper(
      borderRadius: BorderRadiusFoundation.all24,
      color: context.uiKitTheme?.colorScheme.surface,
      padding: EdgeInsets.all(EdgeInsetsFoundation.all24),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ImageWidget(
            link: icon,
            width: kIsWeb ? 24 : 24.sp,
            color: context.uiKitTheme?.colorScheme.bodyTypography,
          ),
          SpacingFoundation.horizontalSpace8,
          Expanded(
            child: Text(
              title,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: context.uiKitTheme?.regularTextTheme.title1
                  .copyWith(color: context.uiKitTheme?.colorScheme.bodyTypography),
            ),
          )
        ],
      ),
    );
  }
}
