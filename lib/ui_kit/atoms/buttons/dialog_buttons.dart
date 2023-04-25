import 'package:flutter/material.dart';
import 'package:shuffle_uikit/shuffle_uikit.dart';

abstract class DialogButton extends StatelessWidget implements ButtonFactory {
  const DialogButton({
    Key? key,
  }) : super(key: key);

  factory DialogButton.black({
    required String text,
    VoidCallback? onPressed,
    bool small = false,
  }) =>
      _BlackDialogButton(
        textColor: Colors.white,
        small: small,
        text: text,
        onPressed: onPressed,
      );

  factory DialogButton.white({
    required String text,
    VoidCallback? onPressed,
    bool small = false,
  }) =>
      _WhiteDialogButton(
        textColor: Colors.black,
        small: small,
        text: text,
        onPressed: onPressed,
      );

  // @override
  // Widget build(BuildContext context) {
  //   final theme = context.uiKitTheme;
  //   final textStyle = small ? theme?.boldTextTheme.caption1 : theme?.boldTextTheme.bodyUpperCase;
  //   return ElevatedButton(
  //     style: style,
  //     onPressed: onPressed,
  //     child: Text(
  //       text.toUpperCase(),
  //       style: textStyle?.copyWith(color: textColor),
  //     ),
  //   );
  // }
}

class _WhiteDialogButton extends DialogButton {
  final String text;
  final Color textColor;
  final VoidCallback? onPressed;
  final bool small;

  const _WhiteDialogButton({
    required this.text,
    required this.textColor,
    required this.small,
    this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    final theme = context.uiKitTheme;
    final textStyle = small ? theme?.boldTextTheme.caption1 : theme?.boldTextTheme.bodyUpperCase;
    return ElevatedButton(
      style: ButtonStyle(
        fixedSize: MaterialStateProperty.resolveWith((states) {
          if (small) return const Size.fromHeight(28);
          return const Size.fromHeight(48);
        }),
        backgroundColor: MaterialStateProperty.resolveWith((states) {
          if (states.contains(MaterialState.disabled)) {
            return ColorsFoundation.disabledColor;
          } else {
            return Colors.white;
          }
        }),
        shape: MaterialStateProperty.resolveWith(
          (states) => RoundedRectangleBorder(borderRadius: BorderRadiusFoundation.all24),
        ),
        foregroundColor: MaterialStateProperty.resolveWith((states) => Colors.black),
      ),
      onPressed: onPressed,
      child: Text(
        text.toUpperCase(),
        style: textStyle?.copyWith(color: textColor),
      ),
    );
  }
}

class _BlackDialogButton extends DialogButton {
  final String text;
  final Color textColor;
  final VoidCallback? onPressed;
  final bool small;

  const _BlackDialogButton({
    required this.text,
    required this.textColor,
    required this.small,
    this.onPressed,
  });
  @override
  Widget build(BuildContext context) {
    final theme = context.uiKitTheme;
    final textStyle = small ? theme?.boldTextTheme.caption1 : theme?.boldTextTheme.bodyUpperCase;
    return ElevatedButton(
      style: ButtonStyle(
        fixedSize: MaterialStateProperty.resolveWith((states) {
          if (small) return const Size.fromHeight(28);
          return const Size.fromHeight(48);
        }),
        backgroundColor: MaterialStateProperty.resolveWith((states) {
          if (states.contains(MaterialState.disabled)) {
            return ColorsFoundation.disabledColor;
          } else {
            return Colors.black;
          }
        }),
        shape: MaterialStateProperty.resolveWith(
          (states) => RoundedRectangleBorder(borderRadius: BorderRadiusFoundation.all24),
        ),
        foregroundColor: MaterialStateProperty.resolveWith((states) => Colors.white),
      ),
      onPressed: onPressed,
      child: Text(
        text.toUpperCase(),
        style: textStyle?.copyWith(color: textColor),
      ),
    );
  }
}
