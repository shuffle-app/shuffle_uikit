import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:shuffle_uikit/shuffle_uikit.dart';

class SmallOutlinedIconButton extends StatelessWidget implements ButtonFactory {
  final VoidCallback? onPressed;
  final Color? borderColor;
  final Color? textColor;
  final Widget icon;
  final bool blurred;
  final bool? loading;

  const SmallOutlinedIconButton({
    Key? key,
    this.onPressed,
    this.borderColor,
    this.textColor,
    required this.blurred,
    required this.icon,
    this.loading,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    print('object');
    double blurValue = 0;
    if (blurred) blurValue = 18;

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
            // color: Colors.white.withOpacity(0.1),
            border: Border.all(
              color: borderColor ?? Colors.white,
              width: 2.w,
            ),
          ),
          child: ClipOval(
            child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: blurValue, sigmaY: blurValue),
              child: icon.paddingAll(EdgeInsetsFoundation.all14).loadingWrap(loading ?? false, color: Colors.white),
            ),
          ),
        ),
      ),
    );
  }
}
