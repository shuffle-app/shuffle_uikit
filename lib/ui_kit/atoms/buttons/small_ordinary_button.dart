import 'package:flutter/material.dart';
import 'package:shuffle_uikit/shuffle_uikit.dart';

class SmallOrdinaryButton extends StatelessWidget implements ButtonFactory {
  final String text;
  final VoidCallback? onPressed;
  final bool uppercase;
  final bool? loading;
  final Color? color;

  const SmallOrdinaryButton({
    Key? key,
    required this.text,
    this.onPressed,
    this.loading,
    this.uppercase = true,
    this.color,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = context.uiKitTheme;
    final textStyle = theme?.boldTextTheme.caption1Bold;

    return ElevatedButton(
      style: theme?.smallOrdinaryButtonStyle.copyWith(
        backgroundColor: MaterialStateProperty.resolveWith((states) {
          return states.contains(MaterialState.disabled) ? ColorsFoundation.darkNeutral300 : color ?? Colors.white;
        }),
      ),
      onPressed: onPressed,
      child: Text(
        uppercase ? text.toUpperCase() : text,
        style: textStyle?.copyWith(color: color == Colors.white ? Colors.black : Colors.white),
      ),
    ).loadingWrap(loading ?? false);
  }
}
