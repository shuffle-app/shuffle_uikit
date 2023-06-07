import 'package:flutter/material.dart';
import 'package:shuffle_uikit/shuffle_uikit.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TitleWithAvatar extends StatelessWidget {
  final String? title;
  final String? avatarUrl;

  const TitleWithAvatar({
    Key? key,
    this.title,
    this.avatarUrl,
  }) : super(key: key);

  //TODO: сделать единый билдер названия с аватаром в зависимости от типа что нам нужно так что надо переделать с добавлением фабричных методов создания разных карточек

  @override
  Widget build(BuildContext context) {
    final textStyle = context.uiKitTheme?.boldTextTheme.title2;

    return Row(
      mainAxisSize: MainAxisSize.max,
      children: [
        if (avatarUrl != null)
          CircularAvatar(
            height: 40,
            avatarUrl: avatarUrl ?? '',
          ),
        if (avatarUrl != null) SpacingFoundation.horizontalSpace12,
        if (title != null)
          Text(
            title ?? '',
            style: textStyle,
          ),
      ],
    );
  }
}
