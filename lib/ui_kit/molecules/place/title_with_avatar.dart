import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:shuffle_uikit/shuffle_uikit.dart';

class TitleWithAvatar extends StatelessWidget {
  final String? title;
  final String? avatarUrl;
  final double? horizontalMargin;
  final Widget? trailing;

  const TitleWithAvatar({
    Key? key,
    this.title,
    this.avatarUrl,
    this.horizontalMargin,
    this.trailing,
  }) : super(key: key);

  //TODO: сделать единый билдер названия с аватаром в зависимости от типа что нам нужно так что надо переделать с добавлением фабричных методов создания разных карточек

  @override
  Widget build(BuildContext context) {
    final textStyle = context.uiKitTheme?.boldTextTheme.title2;
    final isLightTheme = context.uiKitTheme?.themeMode == ThemeMode.light;

    return Row(
      mainAxisSize: MainAxisSize.max,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        if (avatarUrl != null) ...[
          DecoratedBox(
              decoration: BoxDecoration(
                borderRadius: BorderRadiusFoundation.max,
                boxShadow: [
                  BoxShadow(
                    color:
                        isLightTheme ? ColorsFoundation.darkNeutral900.withOpacity(0.4) : Colors.white.withOpacity(0.4),
                    blurRadius: 10,
                    spreadRadius: 3,
                    offset: Offset.zero,
                  )
                ],
              ),
              child: CircularAvatar(
                height: 48.sp,
                avatarUrl: avatarUrl ?? '',
              )),
          SpacingFoundation.horizontalSpace12,
        ],
        if (title != null)
          Expanded(
            child: AutoSizeText(
              title ?? '',
              style: textStyle,
              maxLines: 4,
              minFontSize: 18.w,

              /// (20.w - 18.w) / 2 крашит PlaceComponent
              stepGranularity: 18.w / 2,
            ),
          ),
        if (trailing != null) ...[
          SpacingFoundation.horizontalSpace12,
          trailing!,
        ],
      ],
    ).paddingSymmetric(horizontal: horizontalMargin ?? 0);
  }
}
