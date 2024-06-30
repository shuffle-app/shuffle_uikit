import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:shuffle_uikit/shuffle_uikit.dart';

class UiKitRespectEventCard extends StatelessWidget {
  final List<String> images;
  final String title;
  final List<RespectFromUser> respectFromUsers;
  final List<UiKitTag> properties;

  const UiKitRespectEventCard({
    super.key,
    required this.images,
    required this.title,
    required this.respectFromUsers,
    required this.properties,
  });

  @override
  Widget build(BuildContext context) {
    final boldTextTheme = context.uiKitTheme?.boldTextTheme;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      mainAxisSize: MainAxisSize.min,
      children: [
        Stack(
          clipBehavior: Clip.none,
          children: [
            UiKitPhotoSlider(
              width: 1.sw,
              media: images.map((e) => UiKitMediaPhoto(link: e)).toList(),
            ),
            Positioned(
              bottom: -SpacingFoundation.verticalSpacing24,
              left: 0,
              child: UiKitUsersRespectCard(
                users: respectFromUsers,
              ),
            ),
          ],
        ),
        SpacingFoundation.verticalSpace24,
        Text(
          title,
          style: boldTextTheme?.caption1Bold,
        ),
        SpacingFoundation.verticalSpace4,
        UiKitTagsWidget(
          baseTags: properties.where((element) => element.unique == false).toList(),
          uniqueTags: properties.where((element) => element.unique).toList(),
        ),
      ],
    );
  }
}

class UiKitUsersRespectCard extends StatelessWidget {
  final List<RespectFromUser> users;

  const UiKitUsersRespectCard({
    super.key,
    required this.users,
  });

  @override
  Widget build(BuildContext context) {
    final regularTextTheme = context.uiKitTheme?.regularTextTheme;

    return Container(
      height: 1.sw < 380 ? 0.0525.sh : 0.0425.sh,
      width: users.length == 1 ? 0.0625.sw + 0.18.sw : (0.0625.sw * (users.length-1)),
      padding: EdgeInsets.all(EdgeInsetsFoundation.all4),
      clipBehavior: Clip.hardEdge,
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.2),
        borderRadius: BorderRadiusFoundation.max,
      ),
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 18, sigmaY: 18),
        child: Stack(
          clipBehavior: Clip.none,
          children: [
            if (users.length == 1)
              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  context.userAvatar(
                    size: UserAvatarSize.x20x20,
                    type: UserTileType.ordinary,
                    userName: users.first.name,
                    imageUrl: users.first.avatarUrl,
                  ),
                  SpacingFoundation.horizontalSpace2,
                  Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        users.first.name,
                        style: regularTextTheme?.caption4,
                      ),
                      GradientableWidget(
                        gradient: GradientFoundation.defaultLinearGradient,
                        child: Text(
                          S.current.Respect.toUpperCase(),
                          style: regularTextTheme?.caption4.copyWith(color: Colors.white),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            if (users.length > 1 && users.length < 4)
              ...users.map((e) {
                final leftOffset = users.indexOf(e) * (0.0625.sw * 0.6);
                return Positioned(
                  left: leftOffset,
                  child: context.userAvatar(
                    size: UserAvatarSize.x20x20,
                    type: UserTileType.ordinary,
                    userName: e.name,
                    imageUrl: e.avatarUrl,
                  ),
                );
              }),
            if (users.length >= 4)
              ...users.sublist(0, 3).map((e) {
                final leftOffset = users.indexOf(e) * (0.0625.sw * 0.6);
                return Positioned(
                  left: leftOffset,
                  child: context.userAvatar(
                    size: UserAvatarSize.x20x20,
                    type: UserTileType.ordinary,
                    userName: e.name,
                    imageUrl: e.avatarUrl,
                  ),
                );
              }),
            if (users.length >= 4)
              Positioned(
                left: 0.0625.sw * 0.6 * 3,
                child: Container(
                  height: 0.0625.sw,
                  width: 0.0625.sw,
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    shape: BoxShape.circle,
                  ),
                  child: Center(
                    child: Text(
                      '+${users.length - 3}',
                      style: regularTextTheme?.caption4.copyWith(color: ColorsFoundation.mutedText),
                    ),
                  ),
                ),
              ),
            if (users.length >= 4)
              Align(
                alignment: Alignment.centerRight,
                child: GradientableWidget(
                  gradient: GradientFoundation.defaultLinearGradient,
                  child: Text(
                    S.current.Respect.toUpperCase(),
                    style: regularTextTheme?.caption4.copyWith(color: Colors.white),
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
