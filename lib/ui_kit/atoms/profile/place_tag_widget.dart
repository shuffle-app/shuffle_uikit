import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:shuffle_uikit/foundation/shuffle_ui_kit_foundation.dart';
import 'package:shuffle_uikit/utils/extentions/context_theme_extension.dart';
import 'package:simple_gradient_text/simple_gradient_text.dart';

class UiKitTagWidget extends StatelessWidget {
  final String title;
  final String icon;
  final Color? textColor;
  final bool showSpacing;
  final bool showGradient;

  const UiKitTagWidget({
    Key? key,
    required this.title,
    required this.icon,
    this.textColor,
    this.showGradient = false,
    this.showSpacing = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final textStyle = context.uiKitTheme?.boldTextTheme.caption2.copyWith(
      color: textColor ?? ColorsFoundation.darkNeutral900,
    );
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        if (showSpacing) SpacingFoundation.horizontalSpace12,
        SvgPicture.asset(
          icon,
          package: 'shuffle_uikit',
        ),
        SpacingFoundation.horizontalSpace4,
        if (showGradient)
          GradientText(
            title,
            colors: GradientFoundation.gradientBorder.gradient.colors,
            gradientType: GradientType.radial,
            radius: 2,
            style: textStyle,
          ),
        if (!showGradient)
          Text(
            title,
            style: textStyle,
          )
      ],
    );
  }
}
