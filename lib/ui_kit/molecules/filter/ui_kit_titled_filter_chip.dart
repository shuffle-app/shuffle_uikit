import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';
import 'package:shuffle_uikit/shuffle_uikit.dart';

class UiKitTitledFilterChip extends StatelessWidget {
  final String title;
  final bool selected;
  final bool loading;

  final VoidCallback? onPressed;
  final dynamic icon;

  const UiKitTitledFilterChip(
      {super.key,
      required this.title,
      this.selected = false,
      this.onPressed,
      required this.icon,
      this.loading = false});

  @override
  Widget build(BuildContext context) {
    final theme = context.uiKitTheme;
    final titleStyle = theme?.boldTextTheme.caption1Bold;
    final colorScheme = theme?.colorScheme;
    final background = selected ? colorScheme?.inversePrimary : colorScheme?.surface2;
    final foreground = selected ? colorScheme?.primary : colorScheme?.inversePrimary;
    final textStyle = titleStyle?.copyWith(
      color: foreground,
    );
    final TextSpan textSpan = TextSpan(
      text: title,
      style: textStyle,
    );
    final textPainter = TextPainter(
      text: textSpan,
      textDirection: TextDirection.ltr,
    );

    textPainter.layout();

    final chipWidth = SpacingFoundation.horizontalSpacing8 +
        (SpacingFoundation.horizontalSpacing16 * 2) +
        textPainter.width +
        (40.h - SpacingFoundation.verticalSpacing14 * 2.5);

    return InkWell(
      borderRadius: BorderRadiusFoundation.max,
      onTap: onPressed,
      child: UiKitCardWrapper(
          borderRadius: BorderRadiusFoundation.max,
          color: background,
          width: chipWidth,
          clipBehavior: Clip.hardEdge,
          padding: EdgeInsets.symmetric(
              horizontal: SpacingFoundation.horizontalSpacing16, vertical: SpacingFoundation.verticalSpacing14),
          child: loading
              ? Center(
                  child: SizedBox(
                    width: 40.h,
                    child: CupertinoActivityIndicator(
                      color: colorScheme?.primary,
                      // valueColor: AlwaysStoppedAnimation(foreground),
                      // backgroundColor: Colors.transparent,
                    ),
                  ),
                )
              : Stack(
                  alignment: Alignment.centerRight,
                  // mainAxisSize: MainAxisSize.min,
                  // crossAxisAlignment: CrossAxisAlignment.center,
                  // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Positioned(
                        top: icon is IconData ? -2.h : 0,
                        left: 0,
                        bottom: 0,
                        // Transform.translate(
                        //     offset: Offset(0, icon is IconData ? -2.h : 0),
                        child: ImageWidget(
                          fit: BoxFit.fitHeight,
                          iconData: icon is IconData ? icon as IconData : null,
                          link: icon is String ? icon as String : null,
                          color: foreground,
                        )),
                    // SpacingFoundation.horizontalSpace8,
                    Text(title, style: textStyle).paddingOnly(left: SpacingFoundation.horizontalSpacing14),
                  ],
                )),
    );
  }
}
