import 'package:flutter/material.dart';
import 'package:shuffle_uikit/shuffle_uikit.dart';

class UiKitSelectedIconWidget extends StatelessWidget {
  final List<String>? iconList;
  final ValueChanged<int>? onIconTap;
  final int? selectedIndex;

  const UiKitSelectedIconWidget({
    super.key,
    this.iconList,
    this.onIconTap,
    this.selectedIndex,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 0.18.sw,
      child: ListView.separated(
        itemCount: iconList?.length ?? 0,
        separatorBuilder: (context, index) => SpacingFoundation.horizontalSpace16,
        scrollDirection: Axis.horizontal,
        shrinkWrap: true,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () => onIconTap?.call(index),
            child: DecoratedBox(
              decoration: BoxDecoration(
                border: selectedIndex == index ? GradientFoundation.gradientBorder : null,
                borderRadius: BorderRadiusFoundation.all24r,
              ),
              child: ImageWidget(
                height: 0.18.sw,
                fit: BoxFit.fitHeight,
                link: iconList?[index],
              ).paddingAll(EdgeInsetsFoundation.all2),
            ),
          );
        },
      ),
    );
  }
}
