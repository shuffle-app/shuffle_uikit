import 'package:flutter/material.dart';
import 'package:shuffle_uikit/shuffle_uikit.dart';
import 'package:auto_size_text/auto_size_text.dart';

class WhiteDialogButton extends StatelessWidget implements ButtonFactory {
  final String text;
  final VoidCallback? onPressed;
  final bool small;
  final bool isOutlined;
  final AutoSizeGroup? group;

  const WhiteDialogButton({
    super.key,
    required this.text,
    required this.small,
    this.isOutlined = false,
    this.onPressed,
    this.group,
  });

  @override
  Widget build(BuildContext context) {
    final theme = context.uiKitTheme;
    final textTheme = theme?.boldTextTheme;
    final textStyle = small ? textTheme?.caption1Bold : textTheme?.bodyUpperCase;
    final side = isOutlined ? BorderSide(width: 2, color: theme!.colorScheme.primary) : BorderSide.none;

    return ElevatedButton(
      style: ButtonStyle(
        fixedSize: WidgetStateProperty.resolveWith((states) {
          if (small) return const Size.fromHeight(28);
          if (isOutlined) return const Size(double.infinity, 48);

          return const Size.fromHeight(48);
        }),
        backgroundColor: WidgetStateProperty.resolveWith((states) {
          return states.contains(WidgetState.disabled) ? ColorsFoundation.darkNeutral300 : Colors.white;
        }),
        shape: WidgetStateProperty.resolveWith(
          (states) => RoundedRectangleBorder(borderRadius: BorderRadiusFoundation.all24),
        ),
        overlayColor: WidgetStateProperty.resolveWith((states) {
          return ColorsFoundation.darkNeutral900;
        }),
        foregroundColor: WidgetStateProperty.resolveWith((states) => Colors.black),
        side: WidgetStateProperty.resolveWith((_) => side),
      ),
      onPressed: onPressed,
      child: isOutlined
          ? Center(
              child: group != null
                  ? AutoSizeText(
                      text.toUpperCase(),
                      style: textStyle?.copyWith(color: Colors.black),
                      maxLines: 1,
                      group: group,
                    )
                  : Text(
                      text.toUpperCase(),
                      style: textStyle?.copyWith(color: Colors.black),
                    ),
            )
          : group != null
              ? AutoSizeText(
                  text.toUpperCase(),
                  style: textStyle?.copyWith(color: Colors.black),
                  maxLines: 1,
                  group: group,
                )
              : Text(
                  text.toUpperCase(),
                  style: textStyle?.copyWith(color: Colors.black),
                ),
    );
  }
}
