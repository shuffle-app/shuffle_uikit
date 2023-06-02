import 'package:flutter/material.dart';
import 'package:shuffle_uikit/shuffle_uikit.dart';
import 'package:shuffle_uikit/ui_kit/atoms/profile/profile_avatar.dart';
import 'package:shuffle_uikit/ui_kit/atoms/profile/profile_description.dart';

class ProfileCard extends StatelessWidget {
  final String? nickname;
  final String? name;
  final String? description;
  final String? avatarUrl;
  final int? followers;
  final VoidCallback? onFollow;
  final List<String>? interests;
  final List<String>? matchingInterests;

  const ProfileCard({
    Key? key,
    this.nickname,
    this.description,
    this.avatarUrl,
    this.name,
    this.followers,
    this.onFollow,
    this.interests,
    this.matchingInterests,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return UiKitCardWrapper(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          /// Frame 359 in Figma
          Row(
            mainAxisSize: MainAxisSize.max,
            children: [
              ProfileAvatar(
                avatarLink: avatarUrl ?? '',
                name: name,
              ),
              if (followers != null && onFollow != null) SpacingFoundation.horizontalSpace16 else SpacingFoundation.horizontalSpace12,
              if (followers != null && onFollow != null)
                ProfileAvatar(avatarLink: avatarUrl ?? '')
              else
                CircularAvatar(
                  height: 48,
                  avatarUrl: avatarUrl ?? '',
                ),
              if (followers != null && onFollow != null)
                SpacingFoundation.horizontalSpace16
              else
                SpacingFoundation.horizontalSpace12,
              Expanded(
                child: ProfileInfo(
                  name: name,
                  nickname: '@${nickname ?? ''}',
                  followers: followers,
                  onFollow: onFollow,
                ),
              ),
            ],
          ),
          if (description != null) ...[
            SpacingFoundation.verticalSpace16,
            ProfileDescription(
              text: description ?? '',
            )
          ],
          SpacingFoundation.verticalSpace16,
          ProfileInterests(
            matchingInterests: matchingInterests,
            profileInterests: interests ?? [],
          ),
        ],
      ).paddingAll(EdgeInsetsFoundation.all16),
    );
  }
}
