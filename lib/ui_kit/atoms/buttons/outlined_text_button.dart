import 'package:flutter/material.dart';
import 'package:shuffle_uikit/shuffle_uikit.dart';

class OutlinedTextButton extends StatelessWidget implements ButtonFactory {
  final String text;
  final VoidCallback? onPressed;
  final bool? loading;
  final Color? borderColor;

  const OutlinedTextButton({
    Key? key,
    required this.text,
    this.onPressed,
    this.loading,
    this.borderColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final enabled = onPressed != null;

    final theme = context.uiKitTheme;
    final textStyle = theme?.boldTextTheme.bodyUpperCase;
    final textWidget = Text(
      text.toUpperCase(),
      style: textStyle,
    );

    return Material(
      clipBehavior: Clip.hardEdge,
      color: enabled ? Colors.white.withOpacity(0.01) : ColorsFoundation.darkNeutral300,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadiusFoundation.all24,
        side: BorderSide(
          color: context.uiKitTheme!.colorScheme.inversePrimary,
          width: 2.w,
        ),
      ),
      child: InkWell(
        onTap: enabled && !(loading ?? false) ? onPressed : null,
        borderRadius: BorderRadiusFoundation.all24,
        child: Ink(
          decoration: BoxDecoration(
            borderRadius: BorderRadiusFoundation.all24,
          ),
          child: loading ?? false
              ? SpacingFoundation.none
              : Center(
                  child: textWidget.paddingSymmetric(vertical: SpacingFoundation.verticalSpacing8),
                ),
        ),
      ),
    ).loadingWrap(loading ?? false);
  }
}
