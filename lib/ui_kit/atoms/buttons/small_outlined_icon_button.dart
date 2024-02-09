import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:shuffle_uikit/shuffle_uikit.dart';

class SmallOutlinedIconButton extends StatelessWidget implements ButtonFactory {
  final VoidCallback? onPressed;
  final Color? borderColor;
  final Widget? icon;
  final BaseUiKitButtonIconData? iconInfo;
  final bool? loading;

  const SmallOutlinedIconButton({
    Key? key,
    this.onPressed,
    this.borderColor,
    this.icon,
    this.iconInfo,
    this.loading,
  })  : assert(iconInfo != null || icon != null, 'Either iconInfo or icon must be provided'),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    final colorScheme = context.uiKitTheme?.colorScheme;

    return Material(
      shape: const CircleBorder(),
      clipBehavior: Clip.hardEdge,
      color: Colors.black.withOpacity(0.1),
      child: InkWell(
        onTap: loading ?? false ? null : onPressed,
        child: Ink(
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            border: Border.all(
              color: borderColor ?? Colors.white,
              width: 2.w,
            ),
          ),
          child: Padding(
            padding: EdgeInsets.all(kIsWeb ? EdgeInsetsFoundation.horizontal6 : EdgeInsetsFoundation.horizontal12),
            child: icon ??
                ImageWidget(
                  iconData: iconInfo?.iconData,
                  link: iconInfo?.iconPath,
                  height: iconInfo?.size,
                  fit: BoxFit.fitHeight,
                  color: iconInfo?.color ?? context.uiKitTheme?.colorScheme.inversePrimary,
                ),
          ).loadingWrap(loading ?? false, color: borderColor ?? colorScheme?.surface),
        ),
      ),
    );
  }
}
