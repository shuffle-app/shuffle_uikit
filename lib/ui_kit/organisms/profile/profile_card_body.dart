import 'package:flutter/material.dart';
import 'package:shuffle_uikit/shuffle_uikit.dart';
import 'package:shuffle_uikit/ui_kit/atoms/profile/profile_avatar.dart';
import 'package:shuffle_uikit/ui_kit/atoms/profile/profile_description.dart';

class ProfileCardBody extends StatelessWidget {
  final String? nickname;
  final String? name;
  final String? description;
  final String? avatarUrl;
  final List<String>? interests;
  final int? followers;
  final VoidCallback? onFollow;
  final bool? canFollow;
  final List<String>? matchingInterests;
  final ProfileCardType? profileType;
  final List<UiKitTag>? tags;
  final List<UiKitStats>? profileStats;

  const ProfileCardBody({
    super.key,
    this.profileType,
    this.canFollow,
    this.nickname,
    this.profileStats,
    this.name,
    this.tags,
    this.description,
    this.avatarUrl,
    this.interests,
    this.matchingInterests,
    this.followers,
    this.onFollow,
  });

  @override
  Widget build(BuildContext context) {
    final theme = context.uiKitTheme;


    return UiKitCardWrapper(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          /// Frame 359 in Figma
          Row(
            mainAxisSize: MainAxisSize.max,
            children: [
              if (canFollow ?? false)
                ProfileAvatar(
                  avatarLink: avatarUrl ?? '',
                  name: name,
                )
              else
                CircularAvatar(
                  height: 48.sp,
                  avatarUrl: avatarUrl ?? '',
                  name: name,
                ),
              if (canFollow ?? false) SpacingFoundation.horizontalSpace16 else SpacingFoundation.horizontalSpace12,
              Expanded(
                child: profileType == ProfileCardType.personal
                    ? PersonalProfileInfo(
                        name: name,
                        nickname: nickname ?? '',
                        followers: followers,
                        onFollow: onFollow,
                      )
                    : CompanyProfileInfo(
                        companyName: name,
                        tags: tags ?? [],
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
          Stack(
            children: [
              ConstrainedBox(
                constraints: BoxConstraints(maxHeight: 100.h),
                child: SingleChildScrollView(
                  child: ProfileInterests(
                    matchingInterests: matchingInterests,
                    profileInterests: interests ?? [],
                  ).paddingSymmetric(vertical: SpacingFoundation.verticalSpacing16),
                ),
              ),
              Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [
                      theme?.cardColor ?? theme?.colorScheme.surface3 ?? ColorsFoundation.surface3,
                      (theme?.cardColor ?? theme?.colorScheme.surface3 ?? ColorsFoundation.surface3).withOpacity(0)
                    ],
                    tileMode: TileMode.decal,
                    end: Alignment.bottomCenter,
                    begin: Alignment.topCenter,
                  ),
                ),
                height: 16.sp,
                width: double.infinity,
              ),
              Positioned(
                bottom: 0,
                left: 0,
                right: 0,
                child: Container(
                  alignment: Alignment.bottomCenter,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: [
                        theme?.cardColor ?? theme?.colorScheme.surface3 ?? ColorsFoundation.surface3,
                        (theme?.cardColor ?? theme?.colorScheme.surface3 ?? ColorsFoundation.surface3).withOpacity(0)
                      ],
                      tileMode: TileMode.decal,
                      begin: Alignment.bottomCenter,
                      end: Alignment.topCenter,
                    ),
                  ),
                  height: 16.sp,
                ),
              ),
            ],
          ).paddingSymmetric(vertical: SpacingFoundation.verticalSpacing16),
          if (profileStats != null) ...[
            SpacingFoundation.verticalSpace16,
            Row(
              mainAxisSize: MainAxisSize.max,
              children: [
                Expanded(
                  child: UiKitStatsActionCard(stats: profileStats!.first),
                ),
                SpacingFoundation.horizontalSpace16,
                Expanded(
                  child: UiKitStatsActionCard(stats: profileStats!.last),
                ),
              ],
            ),
            SpacingFoundation.verticalSpace16,
          ],
        ],
      ).paddingLTRB(EdgeInsetsFoundation.all16, EdgeInsetsFoundation.all16, EdgeInsetsFoundation.all16, 0),
    );
  }
}
