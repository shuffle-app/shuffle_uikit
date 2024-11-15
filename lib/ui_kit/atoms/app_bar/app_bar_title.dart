import 'dart:io';

import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:shuffle_uikit/shuffle_uikit.dart';

class AppBarTitle extends StatelessWidget {
  final String title;
  final bool? centerTitle;
  final String? onIWidgetInfoString;
  final bool? expanded;

  const AppBarTitle({
    super.key,
    required this.title,
    this.centerTitle,
    this.onIWidgetInfoString,
    this.expanded,
  });

  @override
  Widget build(BuildContext context) {
    final theme = context.uiKitTheme;
    TextStyle? textStyle = theme?.boldTextTheme.title1 ?? Theme.of(context).primaryTextTheme.titleMedium;
    textStyle = textStyle?.copyWith(color: theme?.colorScheme.inversePrimary);

    return Expanded(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          if (expanded == false)
            AutoSizeText(
              title,
              style: textStyle?.copyWith(overflow: TextOverflow.ellipsis),
              textAlign: centerTitle ?? Platform.isIOS ? TextAlign.center : TextAlign.left,
              maxLines: 1,
            )
          else
            Flexible(
              child: Text(
                title,
                style: textStyle?.copyWith(overflow: TextOverflow.ellipsis),
                textAlign: centerTitle ?? Platform.isIOS ? TextAlign.center : TextAlign.left,
                maxLines: 2,
              ),
            ),
          if (onIWidgetInfoString != null) ...[
            SpacingFoundation.horizontalSpace4,
            Builder(
              builder: (context) {
                return GestureDetector(
                  onTap: () => showUiKitPopover(
                    context,
                    customMinHeight: 30.h,
                    showButton: false,
                    title: Text(
                      onIWidgetInfoString!,
                      style: theme?.regularTextTheme.body.copyWith(
                        color: Colors.black87,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  child: ImageWidget(
                    iconData: ShuffleUiKitIcons.info,
                    width: 16.w,
                    color: theme?.colorScheme.darkNeutral900,
                  ),
                );
              },
            ),
          ]
        ],
      ),
    );
  }
}
