import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:shuffle_uikit/shuffle_uikit.dart';

class UiKitTitledDescriptionGridWidget extends StatelessWidget {
  final String title;
  final String description;
  final double spacing;
  final bool showFullInfo;

  const UiKitTitledDescriptionGridWidget({
    Key? key,
    required this.title,
    required this.description,
    required this.spacing,
    this.showFullInfo = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final textTheme = context.uiKitTheme?.boldTextTheme;

    return SizedBox(
      width: (0.5.sw) - (spacing * 2),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: textTheme?.caption1Medium.copyWith(
              color: ColorsFoundation.darkNeutral900,
            ),
          ),
          SpacingFoundation.verticalSpace4,
          showFullInfo
              ? AutoSizeText(
                  description,
                  maxLines: 4,
                  minFontSize: 11,
                  overflow: TextOverflow.ellipsis,
                  style: textTheme?.caption1Bold.copyWith(
                    color: context.uiKitTheme?.colorScheme.grayForegroundColor,
                  ),
                )
              : Text(
                  description,
                  maxLines: 3,
                  overflow: TextOverflow.ellipsis,
                  style: textTheme?.caption1Bold.copyWith(
                    color: context.uiKitTheme?.colorScheme.grayForegroundColor,
                  ),
                ),
        ],
      ),
    );
  }
}
