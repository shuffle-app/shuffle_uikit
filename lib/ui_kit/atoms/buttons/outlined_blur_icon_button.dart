import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:shuffle_uikit/shuffle_uikit.dart';

class OutlinedBlurIconButton extends StatelessWidget implements ButtonFactory {
  final VoidCallback? onPressed;
  final Widget? icon;
  final BaseUiKitButtonIconData? iconInfo;
  final bool? loading;
  final double blurValue;

  const OutlinedBlurIconButton({
    Key? key,
    this.onPressed,
    required this.icon,
    this.loading,
    this.iconInfo,
    this.blurValue = 18,
  })  : assert(iconInfo != null || icon != null, 'Either iconInfo or icon must be provided'),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      shape: const CircleBorder(),
      clipBehavior: Clip.hardEdge,
      color: Colors.black.withOpacity(0.1),
      child: InkWell(
        onTap: loading ?? false ? null : onPressed,
        borderRadius: BorderRadiusFoundation.max,
        child: Ink(
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            border: Border.all(
              color: context.uiKitTheme?.colorScheme.inversePrimary ?? Colors.white,
              width: 2.w,
            ),
          ),
          child: ClipOval(
            child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: blurValue, sigmaY: blurValue),
              child: Padding(
                padding: EdgeInsets.all(EdgeInsetsFoundation.all14),
                child: icon ??
                    ImageWidget(
                      iconData: iconInfo?.iconData,
                      link: iconInfo?.iconPath,
                      height: iconInfo?.size,
                      fit: BoxFit.fitHeight,
                      color: iconInfo?.color ?? context.uiKitTheme?.colorScheme.inversePrimary,
                    ),
              ).loadingWrap(loading ?? false, color: Colors.white),
            ),
          ),
        ),
      ),
    );
  }
}
