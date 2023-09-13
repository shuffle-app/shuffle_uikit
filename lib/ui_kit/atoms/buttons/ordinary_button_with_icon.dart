import 'package:flutter/material.dart';
import 'package:shuffle_uikit/shuffle_uikit.dart';

class OrdinaryButtonWithIcon extends StatelessWidget implements ButtonFactory {
  final VoidCallback? onPressed;
  final Widget icon;
  final String text;
  final bool? loading;
  final ButtonFit? fit;

  const OrdinaryButtonWithIcon({
    Key? key,
    this.onPressed,
    this.loading,
    this.fit,
    required this.icon,
    required this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    TextStyle? textStyle = context.uiKitTheme?.boldTextTheme.bodyUpperCase;

    return Material(
      color: context.uiKitTheme?.colorScheme.inversePrimary,
      borderRadius: BorderRadiusFoundation.max,
      clipBehavior: Clip.hardEdge,
      child: InkWell(
        onTap: loading ?? false ? null : onPressed,
        child: Ink(
          padding: EdgeInsets.symmetric(
            vertical: EdgeInsetsFoundation.vertical14,
            horizontal: EdgeInsetsFoundation.horizontal44,
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: fit == ButtonFit.fitWidth ? MainAxisAlignment.center : MainAxisAlignment.start,
            children: [
              Text(
                (loading ?? false) ? '' : text.toUpperCase(),
                style: textStyle?.copyWith(color: context.uiKitTheme?.colorScheme.primary),
              ),
              SpacingFoundation.horizontalSpace8,
              if (!(loading ?? false)) icon,
            ],
          ),
        ),
      ),
    ).loadingWrap(loading ?? false);
  }
}
