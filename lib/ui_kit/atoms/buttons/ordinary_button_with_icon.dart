import 'package:flutter/material.dart';
import 'package:shuffle_uikit/shuffle_uikit.dart';

class OrdinaryButtonWithIcon extends StatelessWidget implements ButtonFactory {
  final VoidCallback? onPressed;
  final Widget? icon;
  final BaseUiKitButtonIconData? iconInfo;
  final String? text;
  final bool? loading;
  final ButtonFit? fit;

  const OrdinaryButtonWithIcon({
    Key? key,
    this.onPressed,
    this.loading,
    this.fit,
    this.icon,
    this.iconInfo,
    this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    TextStyle? textStyle = context.uiKitTheme?.boldTextTheme.bodyUpperCase;
    final colorScheme = context.uiKitTheme?.colorScheme;

    return Material(
      color: context.uiKitTheme?.colorScheme.inverseSurface,
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
                (loading ?? false) ? '' : text?.toUpperCase() ?? '',
                style: textStyle?.copyWith(color: context.uiKitTheme?.colorScheme.surface),
              ),
              SpacingFoundation.horizontalSpace8,
              if (!(loading ?? false))
                icon ??
                    ImageWidget(
                      iconData: iconInfo?.iconData,
                      link: iconInfo?.iconPath,
                      height: iconInfo?.size,
                      fit: BoxFit.fitHeight,
                      color: iconInfo?.color ?? context.uiKitTheme?.colorScheme.surface,
                    ),
            ],
          ),
        ),
      ),
    ).loadingWrap(loading ?? false, color: colorScheme?.inverseSurface);
  }
}
