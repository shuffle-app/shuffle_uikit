import 'package:flutter/material.dart';
import 'package:shuffle_uikit/shuffle_uikit.dart';

class OrdinaryTextButton extends StatelessWidget implements ButtonFactory {
  final String text;
  final VoidCallback? onPressed;
  final Widget? icon;
  final BaseUiKitButtonIconData? iconInfo;

  const OrdinaryTextButton({
    super.key,
    required this.text,
    this.onPressed,
    this.icon,
    this.iconInfo,
  });

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onPressed,
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          if (icon != null && iconInfo == null) ...[icon!, SpacingFoundation.horizontalSpace8],
          if (iconInfo != null && icon == null) ...[
            ImageWidget(
              iconData: iconInfo?.iconData,
              link: iconInfo?.iconPath,
              height: iconInfo?.size,
              fit: BoxFit.fitHeight,
              color: iconInfo?.color ?? context.uiKitTheme?.colorScheme.inversePrimary,
            ),
            SpacingFoundation.horizontalSpace8,
          ],
          Text(text.toUpperCase()),
        ],
      ),
    );
  }
}
