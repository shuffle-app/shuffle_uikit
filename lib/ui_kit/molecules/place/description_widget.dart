import 'package:flutter/material.dart';
import 'package:shuffle_uikit/shuffle_uikit.dart';

class DescriptionWidget extends StatelessWidget {
  final String description;
  final bool isHide;
  final VoidCallback? onReadMore;
  final VoidCallback? onReadLess;

  const DescriptionWidget({
    super.key,
    required this.description,
    this.onReadMore,
    this.onReadLess,
    required this.isHide,
  });

  @override
  Widget build(BuildContext context) {
    final textTheme = context.uiKitTheme?.boldTextTheme.caption1Medium;
    bool hide = isHide;

    return StatefulBuilder(
      builder: (c, s) {
        final displayShowMoreButton =
            (description.replaceAll('\n', '').characters.length *
                        6.4.w ~/
                        0.8.sw +
                    description.characters.where((p0) => p0 == '\n').length) >
                7;
        final isLightTheme =
            (context.uiKitTheme?.themeMode ?? ThemeMode.light) ==
                ThemeMode.light;

        return Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              description,
              maxLines: hide ? 7 : null,
              softWrap: true,
              overflow: hide ? TextOverflow.ellipsis : null,
              style: textTheme?.copyWith(
                color: context.uiKitTheme?.colorScheme.bodyTypography,
              ),
            ),
            if (displayShowMoreButton)
              GestureDetector(
                onTap: () {
                  s(() {
                    hide = !hide;
                    if (!hide) {
                      onReadMore?.call();
                    } else {
                      onReadLess?.call();
                    }
                  });
                },
                child: Text(
                  S.current.Read(' ${hide ? S.current.More : S.current.Less}'),
                  style: textTheme?.copyWith(
                      color: isLightTheme
                          ? ColorsFoundation.darkNeutral700
                          : ColorsFoundation.darkNeutral300),
                ),
              ).paddingOnly(top: SpacingFoundation.verticalSpacing12)
          ],
        );
      },
    );
  }
}
