import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:shuffle_uikit/shuffle_uikit.dart';

class UiKitUserAvatar20x20 extends StatelessWidget implements UserAvatarFactory {
  final String imageUrl;
  final String userName;
  final UserTileType type;

  const UiKitUserAvatar20x20({
    super.key,
    required this.imageUrl,
    required this.type,
    required this.userName,
  });

  @override
  Widget build(BuildContext context) {
    final theme = context.uiKitTheme;
    final borderWidth = 1.0.w;
    final isLightTheme = theme?.themeMode == ThemeMode.light;

    return ImageWidget(
      link: imageUrl,
      width: kIsWeb ? 40 : 0.0625.sw,
      height: kIsWeb ? 40 : 0.0625.sw,
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
                      color: isLightTheme
                          ? ColorsFoundation.darkNeutral900.withOpacity(0.4)
                          : Colors.white.withOpacity(0.4),
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
              backgroundColor: imageUrl.isEmpty ? null : Colors.black,
              child: child,
            );
          case UserTileType.premium:
            return UiKitPremiumUserAccountAvatarWrapper.enabled(
              borderWidth: borderWidth,
              backgroundColor: imageUrl.isEmpty ? null : Colors.black,
              child: child,
            );
          case UserTileType.influencer:
            return UiKitInfluencerUserAccountAvatarWrapper.enabled(
              borderWidth: borderWidth,
              backgroundColor: imageUrl.isEmpty ? null : Colors.black,
              child: child,
            );
        }
      },
      errorWidget: switch (type) {
        UserTileType.ordinary => UiKitProUserAccountAvatarWrapper.disabled(
            borderWidth: borderWidth,
            backgroundColor: imageUrl.isEmpty ? null : Colors.black,
            child: _PlaceHolder(
              text: userName.split(' ').length > 1
                  ? userName
                      .split(' ')
                      .fold('', (previousValue, element) => previousValue + (element.characters.firstOrNull ?? ''))
                  : userName.characters.firstOrNull ?? 'N',
            )),
        UserTileType.premium => UiKitPremiumUserAccountAvatarWrapper.enabled(
            borderWidth: borderWidth,
            backgroundColor: imageUrl.isEmpty ? null : Colors.black,
            child: _PlaceHolder(
              text: userName.split(' ').length > 1
                  ? userName
                      .split(' ')
                      .fold('', (previousValue, element) => previousValue + (element.characters.firstOrNull ?? ''))
                  : userName.characters.firstOrNull ?? 'N',
            )),
        UserTileType.influencer => UiKitInfluencerUserAccountAvatarWrapper.enabled(
            borderWidth: borderWidth,
            backgroundColor: imageUrl.isEmpty ? null : Colors.black,
            child: _PlaceHolder(
              text: userName.split(' ').length > 1
                  ? userName
                      .split(' ')
                      .fold('', (previousValue, element) => previousValue + (element.characters.firstOrNull ?? ''))
                  : userName.characters.firstOrNull ?? 'N',
            )),
        UserTileType.pro => UiKitProUserAccountAvatarWrapper.enabled(
            borderWidth: borderWidth,
          backgroundColor: imageUrl.isEmpty ? null : Colors.black,
            child: _PlaceHolder(
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

class _PlaceHolder extends StatelessWidget {
  final String text;

  const _PlaceHolder({
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    final textTheme = context.uiKitTheme?.boldTextTheme;

    return Text(
      text.length > 2 ? text.substring(0, 2).toUpperCase() : text.toUpperCase(),
      maxLines: 1,
      style: textTheme?.caption3Medium.copyWith(color: ColorsFoundation.mutedText, fontSize: 8.w),
    );
  }
}
