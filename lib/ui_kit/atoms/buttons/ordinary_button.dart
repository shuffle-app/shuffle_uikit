import 'package:flutter/material.dart';
import 'package:shuffle_uikit/shuffle_uikit.dart';

class OrdinaryButton extends StatelessWidget implements ButtonFactory {
  final String text;
  final VoidCallback? onPressed;
  final ButtonFit? fit;
  final bool? loading;

  const OrdinaryButton({
    Key? key,
    required this.text,
    this.onPressed,
    this.loading,
    this.fit,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = context.uiKitTheme;
    final textStyle = theme?.boldTextTheme.bodyUpperCase;
    final textWidget = Text(
      (loading ?? false) ? '' : text.toUpperCase(),
      style: textStyle?.copyWith(color: theme?.colorScheme.primary),
      textAlign: TextAlign.center,
    ).loadingWrap(loading ?? false);

    return Material(
      color: theme?.colorScheme.inversePrimary,
      borderRadius: BorderRadiusFoundation.max,
      clipBehavior: Clip.hardEdge,
      child: InkWell(
        onTap: loading ?? false ? null : onPressed,
        child: Ink(
          padding: EdgeInsets.symmetric(
            vertical: EdgeInsetsFoundation.vertical16,
            horizontal: EdgeInsetsFoundation.horizontal44,
          ),
          child: fit == ButtonFit.fitWidth ? Center(child: textWidget) : textWidget,
        ),
      ),
    );
  }
}
