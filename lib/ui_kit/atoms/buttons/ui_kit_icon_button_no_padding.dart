import 'package:flutter/material.dart';
import 'package:shuffle_uikit/shuffle_uikit.dart';

class UiKitIconButtonNoPadding extends StatelessWidget implements ButtonFactory {
  final VoidCallback? onPressed;
  final BaseUiKitButtonIconData iconData;

  const UiKitIconButtonNoPadding({
    Key? key,
    required this.iconData,
    this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      shape: const CircleBorder(),
      clipBehavior: Clip.none,
      color: Colors.transparent,
      child: InkWell(
        onTap: onPressed,
        borderRadius: BorderRadiusFoundation.max,
        child: Ink(
          decoration: const BoxDecoration(
            shape: BoxShape.circle,
          ),
          child: ImageWidget(
            iconData: iconData.iconData,
            link: iconData.iconPath,
            height: iconData.size,
            fit: BoxFit.fitHeight,
            color: iconData.color ?? context.uiKitTheme?.colorScheme.inversePrimary,
          ),
        ),
      ),
    );
  }
}
