import 'package:flutter/material.dart';
import 'package:shuffle_uikit/shuffle_uikit.dart';

class OrdinaryReversedTextButton extends StatelessWidget implements ButtonFactory {
  final String text;
  final VoidCallback? onPressed;
  final Widget? icon;
  final BaseUiKitButtonIconData? iconInfo;

  const OrdinaryReversedTextButton({
    Key? key,
    required this.text,
    this.onPressed,
    this.icon,
    this.iconInfo,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onPressed,
      child: Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(text),
          if (icon != null && iconInfo == null) icon!,
          if (iconInfo != null && icon == null)
            ImageWidget(
              iconData: iconInfo?.iconData,
              link: iconInfo?.iconPath,
              height: iconInfo?.size,
              fit: BoxFit.fitHeight,
              color: iconInfo?.color ?? Colors.black,
            ),
        ],
      ),
    );
  }
}
