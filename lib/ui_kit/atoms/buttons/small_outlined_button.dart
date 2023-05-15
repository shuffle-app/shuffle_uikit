import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shuffle_uikit/shuffle_uikit.dart';

class SmallOutlinedButton extends StatelessWidget implements ButtonFactory {
  final String text;
  final VoidCallback? onPressed;
  final Color? borderColor;
  final Color? textColor;

  const SmallOutlinedButton({
    Key? key,
    required this.text,
    this.onPressed,
    this.borderColor,
    this.textColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final textStyle = context.uiKitTheme?.boldTextTheme.caption1UpperCaseMedium.copyWith(color: textColor);

    return Material(
      borderRadius: BorderRadiusFoundation.max,
      clipBehavior: Clip.hardEdge,
      child: InkWell(
        onTap: onPressed,
        borderRadius: BorderRadiusFoundation.max,
        child: Ink(
          decoration: BoxDecoration(
            borderRadius: BorderRadiusFoundation.max,
            border: Border.all(
              color: borderColor ?? Colors.white,
              width: 2.w,
            ),
          ),
          child: Center(
            child: Text(
              text,
              style: textStyle,
            ).paddingSymmetric(
              vertical: EdgeInsetsFoundation.vertical4,
              horizontal: EdgeInsetsFoundation.horizontal16,
            ),
          ),
        ),
      ),
    );
  }
}
