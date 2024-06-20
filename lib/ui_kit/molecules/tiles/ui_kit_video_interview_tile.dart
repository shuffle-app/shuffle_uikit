import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:shuffle_uikit/shuffle_uikit.dart';

class UiKitVideoInterviewTile extends StatelessWidget {
  const UiKitVideoInterviewTile(
      {super.key,
      this.imagePath,
      this.onPlayTap,
      this.userImage,
      this.userName,
      this.userNickname, this.title});

  final String? imagePath;
  final VoidCallback? onPlayTap;
  final String? userImage;
  final String? userName;
  final String? userNickname;
  final String? title;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 0.09.sh,
      width: 1.sw,
      child: Row(
        children: [
          Stack(
            alignment: Alignment.center,
            children: [
              ClipRRect(
                borderRadius: BorderRadiusFoundation.all12,
                child: ImageWidget(
                  width: 0.30.sw,
                  height: 0.09.sh,
                  cardColor: Colors.red,
                  link: imagePath ?? GraphicsFoundation.instance.png.place.path,
                  fit: BoxFit.cover,
                ),
              ),
              BackdropFilter(
                filter: ImageFilter.blur(
                  sigmaX: 0.6,
                  sigmaY: 0.6,
                  tileMode: TileMode.clamp,
                ),
                child: UiKitCardWrapper(
                  borderRadius: BorderRadiusFoundation.all40,
                  color: ColorsFoundation.surface.withOpacity(0.30),
                  child: Material(
                    color: Colors.transparent,
                    child: InkWell(
                      onTap: onPlayTap,
                      child: Ink(
                        child: Icon(
                          ShuffleUiKitIcons.playfill,
                          color: ColorsFoundation.lightSurface,
                          size: 16.sp,
                        ).paddingSymmetric(
                          horizontal: SpacingFoundation.horizontalSpacing8,
                          vertical: EdgeInsetsFoundation.horizontal4,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
          SpacingFoundation.horizontalSpace16,
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                title??  'Great interview with the owner',
                  style: context.uiKitTheme?.boldTextTheme.caption2Bold,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    UiKitUserAvatar24x24(
                        imageUrl: userImage ??
                            GraphicsFoundation
                                .instance.png.avatars.avatar1.path,
                        userName: userName ?? 'Alice',
                        type: UserTileType.influencer),
                    SpacingFoundation.horizontalSpace8,
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Text(
                                userName ?? 'Alice Mary',
                                style: context
                                    .uiKitTheme?.regularTextTheme.caption4,
                                overflow: TextOverflow.ellipsis,
                              ),
                              SpacingFoundation.horizontalSpace8,
                              SizedBox(
                                height: 12,
                                width: 12,
                                child: InfluencerAccountMark(),
                              )
                            ],
                          ),
                          SpacingFoundation.verticalSpace2,
                          Text(
                            '@${userNickname ?? 'alice_mary'}',
                            style: context.uiKitTheme?.regularTextTheme.caption4
                                .copyWith(color: ColorsFoundation.mutedText),
                            overflow: TextOverflow.ellipsis,
                          ),
                        ],
                      ),
                    )
                  ],
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
