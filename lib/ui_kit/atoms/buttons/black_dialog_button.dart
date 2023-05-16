import 'package:flutter/material.dart';
import 'package:shuffle_uikit/shuffle_uikit.dart';

class BlackDialogButton extends StatelessWidget implements ButtonFactory {
  final String text;
  final VoidCallback? onPressed;
  final bool small;

  const BlackDialogButton({
    super.key,
    required this.text,
    required this.small,
    this.onPressed,
  });
  @override
  Widget build(BuildContext context) {
    final textTheme = context.uiKitTheme?.boldTextTheme;
    final textStyle = small ? textTheme?.caption1Bold : textTheme?.bodyUpperCase;

    return ElevatedButton(
      style: ButtonStyle(
        fixedSize: MaterialStateProperty.resolveWith((states) {
          if (small) return const Size.fromHeight(28);

          return const Size.fromHeight(48);
        }),
        backgroundColor: MaterialStateProperty.resolveWith((states) {
          return states.contains(MaterialState.disabled) ? ColorsFoundation.darkNeutral300 : Colors.black;
        }),
        shape: MaterialStateProperty.resolveWith(
          (states) => RoundedRectangleBorder(borderRadius: BorderRadiusFoundation.all24),
        ),
        overlayColor: MaterialStateProperty.resolveWith((states) {
          return ColorsFoundation.darkNeutral900;
        }),
        foregroundColor: MaterialStateProperty.resolveWith((states) => Colors.white),
        splashFactory: InkSplash.splashFactory,
      ),
      onPressed: onPressed,
      child: Text(
        text.toUpperCase(),
        style: textStyle?.copyWith(color: Colors.white),
      ),
    );
  }
}
