import 'package:flutter/material.dart';
import 'package:shuffle_uikit/shuffle_uikit.dart';
import 'package:flutter/foundation.dart';

class SmallOutlinedIconButton extends StatelessWidget implements ButtonFactory {
  final VoidCallback? onPressed;
  final Color? borderColor;
  final Color? textColor;
  final Widget icon;
  final bool? loading;

  const SmallOutlinedIconButton({
    Key? key,
    this.onPressed,
    this.borderColor,
    this.textColor,
    required this.icon,
    this.loading,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
          child: icon
              .paddingAll( kIsWeb ? EdgeInsetsFoundation.horizontal6: EdgeInsetsFoundation.horizontal12)
              .loadingWrap(loading ?? false, color: borderColor ?? Colors.white),
        ),
      ),
    );
  }
}
