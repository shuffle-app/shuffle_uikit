import 'package:flutter/material.dart';
import 'package:flutter_html_iframe/shims/dart_ui_real.dart';
import 'package:shuffle_uikit/shuffle_uikit.dart';

class SmallBlurredOutlinedIconButton extends StatelessWidget implements ButtonFactory {
  final VoidCallback? onPressed;
  final Color? borderColor;
  final Color? color;
  final Widget icon;
  final bool? loading;
  final double blurValue;

  const SmallBlurredOutlinedIconButton({
    Key? key,
    this.onPressed,
    this.borderColor,
    this.color,
    required this.icon,
    this.loading,
    double? blurValue,
  })  : blurValue = blurValue ?? 18,
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      shape: CircleBorder(
        side: BorderSide(
          color: borderColor ?? Colors.white,
          width: 1,
        ),
      ),
      clipBehavior: Clip.hardEdge,
      color: color ?? Colors.black.withOpacity(0.1),
      child: InkWell(
        onTap: loading ?? false ? null : onPressed,
        borderRadius: BorderRadiusFoundation.max,
        child: Ink(
          child: ClipOval(
            child: BackdropFilter(
              filter: ImageFilter.blur(
                sigmaX: blurValue,
                sigmaY: blurValue,
                tileMode: TileMode.repeated,
              ),
              child: icon.paddingAll(EdgeInsetsFoundation.all6).loadingWrap(loading ?? false, color: Colors.white),
            ),
          ),
        ),
      ),
    );
  }
}
