import 'package:flutter/material.dart';
import 'package:gradient_borders/box_borders/gradient_box_border.dart';
import 'package:shuffle_uikit/shuffle_uikit.dart';

class OutlinedGradientButton extends StatelessWidget implements ButtonFactory {
  final String text;
  final VoidCallback? onPressed;
  final GradientBoxBorder gradientBorder;
  final bool? loading;
  final ButtonFit? fit;

  const OutlinedGradientButton({
    Key? key,
    required this.text,
    required this.gradientBorder,
    this.onPressed,
    this.loading,
    this.fit,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = context.uiKitTheme;
    final colorScheme = theme?.colorScheme;
    final textWidget = GradientableWidget(
      gradient: gradientBorder.gradient,
      child: Text(
        (loading ?? false) ? '' : text.toUpperCase(),
        style: theme?.boldTextTheme.bodyUpperCase.copyWith(color: Colors.white),
        textAlign: TextAlign.center,
      ),
    );

    return Material(
      color: Colors.transparent,
      clipBehavior: Clip.hardEdge,
      shape: RoundedRectangleBorder(
        side: BorderSide.merge(gradientBorder.bottom, gradientBorder.top),
        borderRadius: BorderRadiusFoundation.max,
      ),
      child: InkWell(
        onTap: loading ?? false ? null : onPressed,
        child: Ink(
          padding: EdgeInsets.symmetric(
            vertical: EdgeInsetsFoundation.vertical16,
            horizontal: EdgeInsetsFoundation.horizontal44,
          ),
          decoration: BoxDecoration(
            border: gradientBorder,
            borderRadius: BorderRadiusFoundation.max,
          ),
          child: (fit == ButtonFit.fitWidth ? Center(child: textWidget) : textWidget).loadingWrap(
            loading ?? false,
            color: colorScheme?.inverseSurface,
          ),
        ),
      ),
    );
  }
}
