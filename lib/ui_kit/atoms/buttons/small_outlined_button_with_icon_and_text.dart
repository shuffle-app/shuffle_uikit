import 'package:flutter/material.dart';
import 'package:shuffle_uikit/shuffle_uikit.dart';

class SmallOutlinedButtonWithIconAndText extends StatelessWidget implements ButtonFactory {
  final String? text;
  final VoidCallback? onPressed;
  final Color? borderColor;
  final Color? textColor;
  final Widget? icon;
  final BaseUiKitButtonIconData? iconInfo;
  final bool? loading;
  final ButtonFit? fit;

  const SmallOutlinedButtonWithIconAndText({
    super.key,
    this.text,
    this.onPressed,
    this.borderColor,
    this.textColor,
    this.icon,
    this.iconInfo,
    this.loading,
    this.fit,
  });

  bool get textIsEmpty => text?.isEmpty ?? true;

  @override
  Widget build(BuildContext context) {
    final theme = context.uiKitTheme;
    final colorScheme = theme?.colorScheme;
    final textStyle = theme?.boldTextTheme.caption1UpperCaseMedium.copyWith(
      color: textColor,
    );
    final iconWidget = icon ??
        ImageWidget(
          iconData: iconInfo?.iconData,
          link: iconInfo?.iconPath,
          height: iconInfo?.size,
          fit: BoxFit.fitHeight,
          color: iconInfo?.color ?? theme?.colorScheme.inversePrimary,
        );

    return Material(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadiusFoundation.max,
        side: BorderSide(
          color: borderColor ?? context.uiKitTheme!.colorScheme.inversePrimary,
          width: 2.w,
        ),
      ),
      clipBehavior: Clip.hardEdge,
      color: Colors.transparent,
      child: InkWell(
        onTap: loading ?? false ? null : onPressed,
        borderRadius: BorderRadiusFoundation.max,
        child: Ink(
          padding: EdgeInsets.symmetric(
            horizontal: EdgeInsetsFoundation.horizontal16,
            vertical: EdgeInsetsFoundation.vertical6,
          ),
          decoration: BoxDecoration(
            color: textIsEmpty ? Colors.white.withOpacity(0.1) : null,
          ),
          child: Row(
            mainAxisSize: fit == ButtonFit.fitWidth ? MainAxisSize.max : MainAxisSize.min,
            children: [
              if (iconInfo?.isLeftIcon ?? false) iconWidget,
              Text(
                text ?? '',
                style: textStyle,
                textAlign: TextAlign.center,
              ).loadingWrap(loading ?? false, color: colorScheme?.surface),
              if (iconInfo?.isRightIcon ?? false) iconWidget,
            ],
          ).loadingWrap(loading ?? false, color: colorScheme?.inversePrimary),
        ),
      ),
    );
  }
}
