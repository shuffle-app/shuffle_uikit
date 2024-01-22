import 'package:flutter/material.dart';
import 'package:shuffle_uikit/shuffle_uikit.dart';

class UiKitUserAvatar60x60 extends StatelessWidget implements UserAvatarFactory {
  final String imageUrl;
  final String userName;
  final UserTileType type;

  const UiKitUserAvatar60x60({
    Key? key,
    required this.imageUrl,
    required this.userName,
    required this.type,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const borderWidth = 2.5;

    return ImageWidget(
      link: imageUrl,
      width: 0.1875.sw,
      height: 0.1875.sw,
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
      errorWidget: switch (type) {
        UserTileType.ordinary => UiKitProUserAccountAvatarWrapper.disabled(
            borderWidth: borderWidth,
            child: _Placeholder(
              text: userName.split(' ').length > 1
                  ? userName.split(' ').fold('', (previousValue, element) => previousValue + element.characters.first)
                  : userName.characters.first,
            )),
        UserTileType.premium => UiKitPremiumUserAccountAvatarWrapper.enabled(
            borderWidth: borderWidth,
            child: _Placeholder(
              text: userName.split(' ').length > 1
                  ? userName.split(' ').fold('', (previousValue, element) => previousValue + element.characters.first)
                  : userName.characters.first,
            )),
        UserTileType.influencer => UiKitInfluencerUserAccountAvatarWrapper.enabled(
            borderWidth: borderWidth,
            child: _Placeholder(
              text: userName.split(' ').length > 1
                  ? userName.split(' ').fold('', (previousValue, element) => previousValue + element.characters.first)
                  : userName.characters.first,
            )),
        UserTileType.pro => UiKitProUserAccountAvatarWrapper.enabled(
          borderWidth: borderWidth,
          child: _Placeholder(
            text: userName.split(' ').length > 1
                ? userName.split(' ').fold('', (previousValue, element) => previousValue + element.characters.first)
                : userName.characters.first,
          ),
        )
      },
    );
  }
}

class _Placeholder extends StatelessWidget {
  final String text;

  const _Placeholder({
    Key? key,
    required this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final textTheme = context.uiKitTheme?.boldTextTheme;

    return Text(
      text,
      style: textTheme?.title2.copyWith(
        color: ColorsFoundation.mutedText,
      ),
    // ).paddingSymmetric(
    //   horizontal: EdgeInsetsFoundation.horizontal14,
    //   vertical: EdgeInsetsFoundation.vertical20,
    );
  }
}
