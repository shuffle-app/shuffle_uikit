import 'package:flutter/material.dart';
import 'package:shuffle_uikit/shuffle_uikit.dart';
import 'package:shuffle_uikit/ui_kit/atoms/profile/profile_avatar.dart';
import 'package:shuffle_uikit/ui_kit/atoms/profile/profile_description.dart';
import 'package:shuffle_uikit/ui_kit/molecules/profile/profile_info.dart';
import 'package:shuffle_uikit/ui_kit/molecules/profile/profile_interests.dart';

class ProfileCard extends StatelessWidget {
  final VisitingProfileData profileData;

  const ProfileCard({
    Key? key,
    required this.profileData,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    /// todo add description to Confluence document
    return CardWrapper(
      padding: UiKitEdgeInsets.all16,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          /// Frame 359 in Figma
          Row(
            mainAxisSize: MainAxisSize.max,
            children: [
              ProfileAvatar(avatarLink: profileData.avatarUrl),
              UiKitSpacing.horizontalSpace16,
              ProfileInfo(
                nickname: profileData.nickname,
                followers: profileData.followers,
              ),
            ],
          ),
          UiKitSpacing.verticalSpace16,
          ProfileDescription(
            text: profileData.description,
          ),
          UiKitSpacing.verticalSpace16,
          ProfileInterests(
            userInterests: [profileData.interests.first],
            profileInterests: profileData.interests,
          ),
        ],
      ),
    );
  }
}
