import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:shuffle_uikit/foundation/shuffle_ui_kit_foundation.dart';
import 'package:shuffle_uikit/themes/ui_kit_theme_data.dart';

class PlaceTagWidget extends StatelessWidget {
  final String title;
  final String icon;
  final Color? textColor;
  final bool showSpacing;

  const PlaceTagWidget({
    Key? key,
    required this.title,
    required this.icon,
    this.textColor,
    this.showSpacing = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Builder(
      builder: (context) {
        final textStyle = Theme.of(context).extension<UiKitThemeData>()?.boldTextTheme;
        return Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            if (showSpacing) SpacingFoundation.horizontalSpace12,
            SvgPicture.asset(
              icon,
              package: 'shuffle_uikit',
            ),
            SpacingFoundation.horizontalSpace4,
            Text(
              title,
              style: textStyle?.caption2.copyWith(
                color: textColor ?? ColorsFoundation.solidGreyText,
              ),
            )
          ],
        );
      },
    );
  }
}
