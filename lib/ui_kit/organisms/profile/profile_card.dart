import 'package:flutter/material.dart';
import 'package:shuffle_uikit/shuffle_uikit.dart';
import 'package:shuffle_uikit/ui_kit/atoms/profile/profile_avatar.dart';
import 'package:shuffle_uikit/ui_kit/atoms/profile/profile_description.dart';

class ProfileCard extends StatelessWidget {
  final VisitingProfileData profileData;

  const ProfileCard({
    Key? key,
    required this.profileData,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CardWrapper(
      padding: EdgeInsetsFoundation.all16,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          /// Frame 359 in Figma
          Row(
            mainAxisSize: MainAxisSize.max,
            children: [
              ProfileAvatar(avatarLink: profileData.avatarUrl),
              SpacingFoundation.horizontalSpace16,
              Expanded(
                child: ProfileInfo(
                  nickname: profileData.nickname,
                  followers: profileData.followers,
                ),
              ),
            ],
          ),
          SpacingFoundation.verticalSpace16,
          ProfileDescription(
            text: profileData.description,
          ),
          SpacingFoundation.verticalSpace16,
          ProfileInterests(
            userInterests: [profileData.interests.first],
            profileInterests: profileData.interests,
          ),
        ],
      ),
    );
  }
}
