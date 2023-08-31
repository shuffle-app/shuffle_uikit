import 'package:flutter/material.dart';
import 'package:shuffle_uikit/shuffle_uikit.dart';

class TitleWithAvatar extends StatelessWidget {
  final String? title;
  final String? avatarUrl;
  final double? horizontalMargin;

  const TitleWithAvatar({
    Key? key,
    this.title,
    this.avatarUrl,
    this.horizontalMargin,
  }) : super(key: key);

  //TODO: сделать единый билдер названия с аватаром в зависимости от типа что нам нужно так что надо переделать с добавлением фабричных методов создания разных карточек

  @override
  Widget build(BuildContext context) {
    final textStyle = context.uiKitTheme?.boldTextTheme.title2;

    return  Row(
      mainAxisSize: MainAxisSize.max,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        if (avatarUrl != null)
          CircularAvatar(
            height: 48.sp,
            avatarUrl: avatarUrl ?? '',
          ),
        if (avatarUrl != null) SpacingFoundation.horizontalSpace12,
        if (title != null)
        Flexible(child:Text(
            title ?? '',
            style: textStyle,
          )),
      ],
    ).paddingSymmetric(horizontal: horizontalMargin ?? 0);
  }
}
