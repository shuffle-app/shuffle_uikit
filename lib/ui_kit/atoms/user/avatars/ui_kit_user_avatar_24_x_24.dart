import 'package:flutter/material.dart';
import 'package:shuffle_uikit/shuffle_uikit.dart';

class UiKitUserAvatar24x24 extends StatelessWidget implements UserAvatarFactory {
  final String imageUrl;
  final String userName;
  final UserTileType type;

  const UiKitUserAvatar24x24({
    Key? key,
    required this.imageUrl,
    required this.userName,
    required this.type,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final borderWidth = 1.5.w;

    return ImageWidget(
      link: imageUrl,
      width: 0.075.sw,
      height: 0.075.sw,
      fit: BoxFit.cover,
      cardColor: Colors.transparent,
      imageBuilder: (context, child, frame, syncLoaded) {
        switch (type) {
          case UserTileType.ordinary:
            return DecoratedBox(
                decoration: BoxDecoration(
                  borderRadius: BorderRadiusFoundation.max,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.white.withOpacity(0.25),
                      blurRadius: 10,
                      spreadRadius: 3,
                      offset: Offset.zero,
                    )
                  ],
                ),
                child: ClipOval(child: child));
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
            child: _PlaceHolder(
              text: userName.split(' ').length > 1
                  ? userName.split(' ').fold('', (previousValue, element) => previousValue + element.characters.first)
                  : userName.characters.first,
            )),
        UserTileType.premium => UiKitPremiumUserAccountAvatarWrapper.enabled(
            borderWidth: borderWidth,
            child: _PlaceHolder(
              text: userName.split(' ').length > 1
                  ? userName.split(' ').fold('', (previousValue, element) => previousValue + element.characters.first)
                  : userName.characters.first,
            )),
        UserTileType.influencer => UiKitInfluencerUserAccountAvatarWrapper.enabled(
            borderWidth: borderWidth,
            child: _PlaceHolder(
              text: userName.split(' ').length > 1
                  ? userName.split(' ').fold('', (previousValue, element) => previousValue + element.characters.first)
                  : userName.characters.first,
            )),
        UserTileType.pro => UiKitProUserAccountAvatarWrapper.enabled(
            borderWidth: borderWidth,
            child: _PlaceHolder(
              text: userName.split(' ').length > 1
                  ? userName.split(' ').fold('', (previousValue, element) => previousValue + element.characters.first)
                  : userName.characters.first,
            ),
          )
      },
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
      text,
      style: textTheme?.caption3Medium.copyWith(
        color: ColorsFoundation.mutedText,
      ),
    );
  }
}
