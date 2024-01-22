import 'package:flutter/material.dart';
import 'package:shuffle_uikit/shuffle_uikit.dart';

class UiKitUserAvatar20x20 extends StatelessWidget implements UserAvatarFactory {
  final String imageUrl;
  final String userName;
  final UserTileType type;

  const UiKitUserAvatar20x20({
    Key? key,
    required this.imageUrl,
    required this.type,
    required this.userName,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const borderWidth = 1.0;

    return ImageWidget(
      link: imageUrl,
      width: 0.0625.sw,
      height: 0.0625.sw,
      fit: BoxFit.cover,
      imageBuilder: (context, child, frame, syncLoaded) {
        switch (type) {
          case UserTileType.ordinary:
            return ClipOval(child: child);
          case UserTileType.pro:
            return UiKitProUserAccountAvatarWrapper.enabled(
              borderWidth: borderWidth,
              child: child,
            );
          case UserTileType.premium:
            return UiKitPremiumUserAccountAvatarWrapper.enabled(
              borderWidth: borderWidth,
              child: child,
            );
          case UserTileType.influencer:
            return UiKitInfluencerUserAccountAvatarWrapper.enabled(
              borderWidth: borderWidth,
              child: child,
            );
        }
      },
      errorWidget: UiKitProUserAccountAvatarWrapper.disabled(
        borderWidth: borderWidth,
        child: _PlaceHolder(
          text: userName.split(' ').length > 1
              ? userName.split(' ').fold('', (previousValue, element) => previousValue + element.characters.first)
              : userName,
        ),
      ),
    );
  }
}

class _PlaceHolder extends StatelessWidget {
  final String text;

  const _PlaceHolder({
    Key? key,
    required this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final textTheme = context.uiKitTheme?.boldTextTheme;

    return Text(
      text.toUpperCase(),
      style: textTheme?.caption3Medium.copyWith(
        color: ColorsFoundation.mutedText,
      ),
    ).paddingSymmetric(
      vertical: EdgeInsetsFoundation.vertical4,
      horizontal: EdgeInsetsFoundation.horizontal2,
    );
  }
}
