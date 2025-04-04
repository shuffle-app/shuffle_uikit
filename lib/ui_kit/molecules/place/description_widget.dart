import 'package:flutter/material.dart';
import 'package:shuffle_uikit/shuffle_uikit.dart';

class DescriptionWidget extends StatelessWidget {
  final String description;
  final ValueNotifier<bool>? showTranslateButton;
  final bool isHide;
  final bool isTranslate;
  final VoidCallback? onReadMore;
  final VoidCallback? onReadLess;
  final VoidCallback? onTranslateTap;
  final ValueNotifier<bool>? isTranslateLoading;

  const DescriptionWidget({
    super.key,
    required this.description,
    this.onReadMore,
    this.onReadLess,
    required this.isHide,
    required this.isTranslate,
    this.onTranslateTap,
    this.showTranslateButton,
    this.isTranslateLoading,
  });

  @override
  Widget build(BuildContext context) {
    final textTheme = context.uiKitTheme?.boldTextTheme.caption1Medium;

    bool hide = isHide;

    return StatefulBuilder(
      builder: (c, s) {
        final displayShowMoreButton = (description.replaceAll('\n', '').characters.length * 6.4.w ~/ 0.8.sw +
                description.characters.where((p0) => p0 == '\n').length) >
            7;
        final isLightTheme = (context.uiKitTheme?.themeMode ?? ThemeMode.light) == ThemeMode.light;

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
            SpacingFoundation.verticalSpace12,
            Row(
              mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                if (displayShowMoreButton)
                  InkWell(
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
                          color: isLightTheme ? ColorsFoundation.darkNeutral700 : ColorsFoundation.darkNeutral300),
                    ),
                  ),
                const Spacer(),
                if (showTranslateButton != null)
                  ValueListenableBuilder(
                    valueListenable: showTranslateButton!,
                    builder: (_, value, __) {
                      if (value) {
                        if (isTranslateLoading != null) {
                          return ValueListenableBuilder(
                            valueListenable: isTranslateLoading!,
                            builder: (context, value, child) {
                              if (value) {
                                return SizedBox(
                                  width: 14.w,
                                  height: 14.w,
                                  child: CircularProgressIndicator(
                                    color: isLightTheme
                                        ? ColorsFoundation.darkNeutral700
                                        : ColorsFoundation.darkNeutral300,
                                    strokeWidth: 2.w,
                                  ),
                                );
                              } else {
                                return InkWell(
                                  onTap: onTranslateTap,
                                  child: Text(
                                    isTranslate ? S.of(context).Original : S.of(context).Translate,
                                    style: context.uiKitTheme?.regularTextTheme.caption4Regular.copyWith(
                                      color: isLightTheme
                                          ? ColorsFoundation.darkNeutral700
                                          : ColorsFoundation.darkNeutral300,
                                    ),
                                  ),
                                );
                              }
                            },
                          );
                        } else {
                          return InkWell(
                            onTap: onTranslateTap,
                            child: Text(
                              isTranslate ? S.of(context).Original : S.of(context).Translate,
                              style: context.uiKitTheme?.regularTextTheme.caption4Regular.copyWith(
                                color: isLightTheme ? ColorsFoundation.darkNeutral700 : ColorsFoundation.darkNeutral300,
                              ),
                            ),
                          );
                        }
                      } else {
                        return SizedBox.shrink();
                      }
                    },
                  ),
              ],
            ),
          ],
        );
      },
    );
  }
}
