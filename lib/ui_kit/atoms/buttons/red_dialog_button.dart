import 'package:flutter/material.dart';
import 'package:shuffle_uikit/shuffle_uikit.dart';
import 'package:auto_size_text/auto_size_text.dart';

class RedDialogButton extends StatelessWidget implements ButtonFactory {
  final String text;
  final VoidCallback? onPressed;
  final bool small;
  final AutoSizeGroup? group;

  const RedDialogButton({
    super.key,
    required this.text,
    required this.small,
    this.onPressed,
    this.group,
  });
  @override
  Widget build(BuildContext context) {
    final textTheme = context.uiKitTheme?.boldTextTheme;
    final textStyle = small ? textTheme?.caption1Bold : textTheme?.bodyUpperCase;

    return ElevatedButton(
      style: ButtonStyle(
        fixedSize: WidgetStateProperty.resolveWith((states) {
          if (small) return const Size.fromHeight(28);

          return const Size.fromHeight(48);
        }),
        backgroundColor: WidgetStateProperty.resolveWith((states) {
          return states.contains(WidgetState.disabled) ? ColorsFoundation.error : Colors.red;
        }),
        shape: WidgetStateProperty.resolveWith(
              (states) => RoundedRectangleBorder(borderRadius: BorderRadiusFoundation.all24),
        ),
        overlayColor: WidgetStateProperty.resolveWith((states) {
          return ColorsFoundation.darkNeutral900;
        }),
        foregroundColor: WidgetStateProperty.resolveWith((states) => Colors.white),
        splashFactory: InkSplash.splashFactory,
      ),
      onPressed: onPressed,
      child:group != null
          ? AutoSizeText(
        text.toUpperCase(),
        style: textStyle?.copyWith(color: Colors.white),
        maxLines: 1,
        group: group,
      )
          : Text(
        text.toUpperCase(),
        style: textStyle?.copyWith(color: Colors.white),
      ),
    );
  }
}
