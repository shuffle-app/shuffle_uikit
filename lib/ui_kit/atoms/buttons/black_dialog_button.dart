import 'package:flutter/material.dart';
import 'package:shuffle_uikit/shuffle_uikit.dart';
import 'package:auto_size_text/auto_size_text.dart';

class BlackDialogButton extends StatelessWidget implements ButtonFactory {
  final String text;
  final VoidCallback? onPressed;
  final bool small;
  final ButtonFit? fit;
  final AutoSizeGroup? group;

  const BlackDialogButton({
    super.key,
    required this.text,
    required this.small,
    this.onPressed,
    this.fit,
    this.group,
  });

  @override
  Widget build(BuildContext context) {
    final textTheme = context.uiKitTheme?.boldTextTheme;
    final textStyle = small ? textTheme?.caption1Bold : textTheme?.bodyUpperCase;

    return ElevatedButton(
      style: ButtonStyle(
        fixedSize: WidgetStateProperty.resolveWith((states) {
          double? width;
          if (fit == ButtonFit.fitWidth) width = double.infinity;
          Size size = const Size.fromHeight(48);
          if (small) size = const Size.fromHeight(28);
          if (width != null && small) size = Size(width, 28);
          if (width != null && !small) size = Size(width, 48);

          return size;
        }),
        backgroundColor: WidgetStateProperty.resolveWith((states) {
          return states.contains(WidgetState.disabled) ? ColorsFoundation.darkNeutral300 : Colors.black;
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
      child: group != null
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
