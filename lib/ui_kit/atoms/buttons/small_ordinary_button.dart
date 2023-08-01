import 'package:flutter/material.dart';
import 'package:shuffle_uikit/shuffle_uikit.dart';

class SmallOrdinaryButton extends StatelessWidget implements ButtonFactory {
  final String text;
  final VoidCallback? onPressed;
  final bool uppercase;
  final bool? loading;

  const SmallOrdinaryButton({
    Key? key,
    required this.text,
    this.onPressed,
    this.loading,
    this.uppercase = true,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = context.uiKitTheme;
    final textStyle = theme?.boldTextTheme.caption1Bold;

    return ElevatedButton(
      style: theme?.smallOrdinaryButtonStyle,
      onPressed: onPressed,
      child: loading ?? false
          ? const AdaptiveLoader()
          : Text(
              uppercase ? text.toUpperCase() : text,
              style: textStyle?.copyWith(color: Colors.black),
            ),
    );
  }
}
