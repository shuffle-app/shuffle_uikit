import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shuffle_uikit/shuffle_uikit.dart';

class UiKitTitledFilterChip extends StatelessWidget {
  final String title;
  final bool selected;
  final VoidCallback? onPressed;
  final String icon;

  const UiKitTitledFilterChip({
    Key? key,
    required this.title,
    this.selected = false,
     this.onPressed,
    required this.icon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final titleStyle = context.uiKitTheme?.boldTextTheme.caption1Bold;

    return InkWell(
        borderRadius: BorderRadiusFoundation.all24,
        onTap: onPressed,
        child: DecoratedBox(
          decoration: BoxDecoration(
            color: selected ? Colors.white : ColorsFoundation.surface2,
            borderRadius: BorderRadiusFoundation.all24,
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              ImageWidget(
                link: icon,
                color: selected ? Colors.black : Colors.white,
              ),
              SpacingFoundation.horizontalSpace8,
              Text(
                title,
                style: titleStyle?.copyWith(
                  color: selected ? Colors.black : Colors.white,
                ),
              ),
            ],
          ).paddingSymmetric(
            horizontal: SpacingFoundation.horizontalSpacing16,
            vertical: SpacingFoundation.verticalSpacing12,
          ),
        ),

    );
  }
}
