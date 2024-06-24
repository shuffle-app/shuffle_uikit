import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:shuffle_uikit/shuffle_uikit.dart';

class SmallButtonWithTextAndIcon extends StatelessWidget implements ButtonFactory {
  final String? text;
  final Widget? icon;
  final BaseUiKitButtonIconData? iconInfo;
  final VoidCallback? onPressed;
  final bool uppercase;
  final bool? loading;
  final ButtonFit? fit;
  final AutoSizeGroup? group;

  const SmallButtonWithTextAndIcon({
    super.key,
    this.text,
    this.icon,
    this.iconInfo,
    this.onPressed,
    this.loading,
    this.fit,
    this.group,
    this.uppercase = true,
  })  : assert(iconInfo != null || icon != null, 'Either iconInfo or icon must be provided');

  @override
  Widget build(BuildContext context) {
    final theme = context.uiKitTheme;
    final colorScheme = theme?.colorScheme;
    final textStyle = theme?.boldTextTheme.caption1UpperCaseMedium;
    final textWidget = group != null
        ? AutoSizeText(
            loading ?? false
                ? ''
                : uppercase
                    ? text?.toUpperCase() ?? ''
                    : text ?? '',
            maxLines: 1,
            style: textStyle?.copyWith(color: theme?.colorScheme.surface),
            textAlign: TextAlign.center,
          )
        : Text(
            loading ?? false
                ? ''
                : uppercase
                    ? text?.toUpperCase() ?? ''
                    : text ?? '',
            style: textStyle?.copyWith(color: theme?.colorScheme.surface),
            textAlign: TextAlign.center,
          );

    return Material(
      color: theme?.colorScheme.inverseSurface,
      clipBehavior: Clip.hardEdge,
      borderRadius: BorderRadiusFoundation.max,
      child: InkWell(
        onTap: loading ?? false ? null : onPressed,
        child: Ink(
          padding: EdgeInsets.symmetric(
            horizontal: EdgeInsetsFoundation.horizontal16,
            vertical: EdgeInsetsFoundation.vertical6,
          ),
          child: Row(
            mainAxisSize: fit == ButtonFit.fitWidth ? MainAxisSize.max : MainAxisSize.min,
            mainAxisAlignment: fit == ButtonFit.fitWidth ? MainAxisAlignment.center : MainAxisAlignment.start,
            children: [
              textWidget,
              SpacingFoundation.horizontalSpace4,
              icon ??
                  ImageWidget(
                    iconData: iconInfo?.iconData,
                    link: iconInfo?.iconPath,
                    height: iconInfo?.size,
                    fit: BoxFit.fitHeight,
                    color: iconInfo?.color ?? theme?.colorScheme.surface,
                  )
            ],
          ).loadingWrap(loading ?? false, color: colorScheme?.inverseSurface),
        ),
      ),
    );
  }
}
