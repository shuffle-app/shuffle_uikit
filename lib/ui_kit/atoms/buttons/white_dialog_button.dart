import 'package:flutter/material.dart';
import 'package:shuffle_uikit/shuffle_uikit.dart';

class WhiteDialogButton extends StatelessWidget implements ButtonFactory {
  final String text;
  final VoidCallback? onPressed;
  final bool small;
  final bool isOutlined;

  const WhiteDialogButton({
    super.key,
    required this.text,
    required this.small,
    this.isOutlined = false,
    this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    final theme = context.uiKitTheme;
    final textTheme = theme?.boldTextTheme;
    final textStyle = small ? textTheme?.caption1Bold : textTheme?.bodyUpperCase;
    final side = isOutlined ? BorderSide(width: 2, color: theme!.colorScheme.primary) : BorderSide.none;

    return ElevatedButton(
      style: ButtonStyle(
        fixedSize: MaterialStateProperty.resolveWith((states) {
          if (small) return const Size.fromHeight(28);
          if (isOutlined) return const Size(double.infinity, 48);

          return const Size.fromHeight(48);
        }),
        backgroundColor: MaterialStateProperty.resolveWith((states) {
          return states.contains(MaterialState.disabled) ? ColorsFoundation.darkNeutral300 : Colors.white;
        }),
        shape: MaterialStateProperty.resolveWith(
          (states) => RoundedRectangleBorder(borderRadius: BorderRadiusFoundation.all24),
        ),
        overlayColor: MaterialStateProperty.resolveWith((states) {
          return ColorsFoundation.darkNeutral900;
        }),
        foregroundColor: MaterialStateProperty.resolveWith((states) => Colors.black),
        side: MaterialStateProperty.resolveWith((_) => side),
      ),
      onPressed: onPressed,
      child: isOutlined
          ? SizedBox.expand(
              child: Center(
                child: Text(
                  text.toUpperCase(),
                  style: textStyle?.copyWith(color: Colors.black),
                ),
              ),
            )
          : Text(
              text.toUpperCase(),
              style: textStyle?.copyWith(color: Colors.black),
            ),
    );
  }
}
