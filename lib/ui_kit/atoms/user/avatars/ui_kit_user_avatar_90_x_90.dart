import 'package:flutter/material.dart';
import 'package:shuffle_uikit/shuffle_uikit.dart';

class UiKitUserAvatar90x90 extends StatelessWidget implements UserAvatarFactory {
  final String imageUrl;
  final String userName;
  final UserTileType type;

  const UiKitUserAvatar90x90({
    super.key,
    required this.imageUrl,
    required this.userName,
    required this.type,
  });

  @override
  Widget build(BuildContext context) {
    final borderWidth = 3.0.w;
    final isLightTheme = context.uiKitTheme?.themeMode == ThemeMode.light;

    return ImageWidget(
      link: imageUrl,
      width: 0.335.sw,
      height: 0.335.sw,
      fit: BoxFit.cover,
      cardColor: Colors.transparent,
      imageBuilder: (context, child, frame, syncLoaded) {
        switch (type) {
          case UserTileType.ordinary:
            return DecoratedBox(
                decoration: BoxDecoration(
                  borderRadius: BorderRadiusFoundation.all20,
                  boxShadow: [
                    BoxShadow(
                      color: isLightTheme
                          ? ColorsFoundation.darkNeutral900.withOpacity(0.4)
                          : Colors.white.withOpacity(0.4),
                      blurRadius: 10,
                      spreadRadius: 3,
                      offset: Offset.zero,
                    )
                  ],
                ),
                child: ClipRRect(borderRadius: BorderRadiusFoundation.all20, child: child));
          case UserTileType.pro:
            return UiKitProUserAccountAvatarWrapper.enabled(
              borderWidth: borderWidth,
              borderRadius: BorderRadiusFoundation.all20,
              backgroundColor: imageUrl.isEmpty ? null : Colors.black,
              child: child,
            );
          case UserTileType.premium:
            return UiKitPremiumUserAccountAvatarWrapper.enabled(
              borderWidth: borderWidth,
              borderRadius: BorderRadiusFoundation.all20,
              backgroundColor: imageUrl.isEmpty ? null : Colors.black,
              child: child,
            );
          case UserTileType.influencer:
            return UiKitInfluencerUserAccountAvatarWrapper.enabled(
              borderWidth: borderWidth,
              borderRadius: BorderRadiusFoundation.all20,
              backgroundColor: imageUrl.isEmpty ? null : Colors.black,
              child: child,
            );
        }
      },
      errorWidget: switch (type) {
        UserTileType.ordinary => UiKitProUserAccountAvatarWrapper.disabled(
            borderWidth: borderWidth,
            backgroundColor: imageUrl.isEmpty ? null : Colors.black,
            child: _Placeholder(
              text: userName.split(' ').length > 1
                  ? userName
                      .split(' ')
                      .fold('', (previousValue, element) => previousValue + (element.characters.firstOrNull ?? ''))
                  : userName.characters.firstOrNull ?? 'N',
            )),
        UserTileType.premium => UiKitPremiumUserAccountAvatarWrapper.enabled(
            borderWidth: borderWidth,
            backgroundColor: imageUrl.isEmpty ? null : Colors.black,
            child: _Placeholder(
              text: userName.split(' ').length > 1
                  ? userName
                      .split(' ')
                      .fold('', (previousValue, element) => previousValue + (element.characters.firstOrNull ?? ''))
                  : userName.characters.firstOrNull ?? 'N',
            )),
        UserTileType.influencer => UiKitInfluencerUserAccountAvatarWrapper.enabled(
            borderWidth: borderWidth,
            backgroundColor: imageUrl.isEmpty ? null : Colors.black,
            child: _Placeholder(
              text: userName.split(' ').length > 1
                  ? userName
                      .split(' ')
                      .fold('', (previousValue, element) => previousValue + (element.characters.firstOrNull ?? ''))
                  : userName.characters.firstOrNull ?? 'N',
            )),
        UserTileType.pro => UiKitProUserAccountAvatarWrapper.enabled(
            borderWidth: borderWidth,
          backgroundColor: imageUrl.isEmpty ? null : Colors.black,
            child: _Placeholder(
              text: userName.split(' ').length > 1
                  ? userName
                      .split(' ')
                      .fold('', (previousValue, element) => previousValue + (element.characters.firstOrNull ?? ''))
                  : userName.characters.firstOrNull ?? 'N',
            ),
          )
      },
    );
  }
}

class _Placeholder extends StatelessWidget {
  final String text;

  const _Placeholder({
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    final textTheme = context.uiKitTheme?.boldTextTheme;

    return Text(
      text.length > 2 ? text.substring(0, 2).toUpperCase() : text.toUpperCase(),
      style: textTheme?.titleLarge.copyWith(
        color: ColorsFoundation.mutedText,
      ),
    );
  }
}
