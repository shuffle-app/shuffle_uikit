import 'package:flutter/material.dart';
import 'package:shuffle_uikit/shuffle_uikit.dart';

class UiKitVoiceListenCard extends StatelessWidget {
  const UiKitVoiceListenCard(
      {super.key,
      this.userImage,
      this.userName,
      this.userNickname,
      this.duration});

  final String? userImage;
  final String? userName;
  final String? userNickname;
  final Duration? duration;

  @override
  Widget build(BuildContext context) {
    return UiKitCardWrapper(
      padding: EdgeInsets.all(EdgeInsetsFoundation.all16),
      child: Row(
        children: [
          context.outlinedButton(
            padding: EdgeInsets.all(EdgeInsetsFoundation.all10),
            data: BaseUiKitButtonData(
              onPressed: () {},
              iconInfo: BaseUiKitButtonIconData(
                  iconData: ShuffleUiKitIcons.playfill, size: 24.sp),
            ),
          ),
          SpacingFoundation.horizontalSpace16,
          Expanded(
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      '${formatDuration(duration)} ${S.current.Voice}',
                      style: context.uiKitTheme?.boldTextTheme.caption3Medium,
                    ),
                    Material(
                      color: Colors.transparent,
                      child: InkWell(
                        onTap: () {},
                        child: Ink(
                          child: Text(
                            S.current.ViewAll,
                            style: context
                                .uiKitTheme?.boldTextTheme.caption3Medium,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                SpacingFoundation.verticalSpace4,
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
