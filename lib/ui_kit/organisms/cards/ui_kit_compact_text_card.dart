import 'package:flutter/material.dart';
import 'package:shuffle_uikit/shuffle_uikit.dart';

class UiKitCompactTextCard extends StatelessWidget {
  final String text;
  final bool showRemoveButton;
  final VoidCallback? onTap;

  const UiKitCompactTextCard({
    Key? key,
    required this.text,
    this.onTap,
    this.showRemoveButton = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final textTheme = context.uiKitTheme?.boldTextTheme;

    return Material(
      borderRadius: BorderRadiusFoundation.all24,
      clipBehavior: Clip.hardEdge,
      color: UiKitColors.surface4,
      child: InkWell(
        onTap: onTap,
        child: Ink(
          child: Row(mainAxisSize: MainAxisSize.min, children: [
            Text(text, style: textTheme?.caption1Medium),
            if (showRemoveButton) ...[
              SpacingFoundation.horizontalSpace4,
              ImageWidget(
                  svgAsset: GraphicsFoundation.instance.svg.x,
                  color: Colors.white,
                  height: 10.w,
                  fit: BoxFit.fitWidth)
            ]
          ]).paddingSymmetric(
            vertical: EdgeInsetsFoundation.vertical4,
            horizontal: EdgeInsetsFoundation.horizontal8,
          ),
        ),
      ),
    );
  }
}
