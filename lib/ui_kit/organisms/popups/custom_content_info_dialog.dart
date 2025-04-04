import 'package:flutter/material.dart';
import 'package:shuffle_uikit/shuffle_uikit.dart';

class CustomContentInfoDialog extends StatelessWidget {
  final String title;
  final List<Widget> children;
  final double? width;
  final double? height;

  const CustomContentInfoDialog({
    super.key,
    required this.title,
    required this.children,
    this.width,
    this.height,
  });

  @override
  Widget build(BuildContext context) {
    final theme = context.uiKitTheme;

    return Column(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        GestureDetector(
          onTap: () => Navigator.of(context).pop(),
          child: ImageWidget(
            iconData: ShuffleUiKitIcons.cross,
            color: theme?.colorScheme.darkNeutral900,
            height: 19.h,
            fit: BoxFit.fitHeight,
          ),
        ),
        SpacingFoundation.verticalSpace16,
        UiKitCardWrapper(
          width: width,
          height: height,
          color: Colors.white,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: theme?.boldTextTheme.title2.copyWith(color: Colors.black),
              ),
              for (Widget child in children) child.paddingSymmetric(vertical: SpacingFoundation.verticalSpacing12)
            ],
          ).paddingAll(EdgeInsetsFoundation.all16),
        ),
      ],
    ).paddingSymmetric(horizontal: EdgeInsetsFoundation.horizontal16);
  }
}
