import 'package:flutter/material.dart';
import 'package:shuffle_uikit/shuffle_uikit.dart';
import 'package:shuffle_uikit/ui_kit/atoms/profile/profile_description.dart';
import 'package:url_launcher/url_launcher_string.dart';

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
  final ProfileStats? proStats;
  final List<UiKitTag>? tags;
  final List<Widget>? profileWidgets;
  final List<UiKitStats>? profileStats;
  final bool showSupportShuffle;
  final ValueChanged<int>? onDonate;
  final VoidCallback? onCustomDonate;
  final VoidCallback? onViewAllAchievements;
  final List<UiKitAchievementsModel> achievements;
  final UserTileType userTileType;
  final VoidCallback? onShare;
  final List<String>? socialLinks;
  final String? speciality;

  const ProfileCardBody({
    super.key,
    required this.userTileType,
    this.profileType,
    this.canFollow,
    this.nickname,
    this.profileWidgets,
    this.profileStats,
    this.proStats,
    this.name,
    this.onShare,
    this.tags,
    this.description,
    this.avatarUrl,
    this.interests,
    this.matchingInterests,
    this.followers,
    this.onFollow,
    this.onDonate,
    this.onCustomDonate,
    this.showSupportShuffle = false,
    this.onViewAllAchievements,
    this.achievements = const [],
    this.socialLinks,
    this.speciality,
  });

  @override
  Widget build(BuildContext context) {
    final theme = context.uiKitTheme;

    return UiKitCardWrapper(
      color: theme?.colorScheme.surface1,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        // crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          /// Frame 359 in Figma
          Row(
            mainAxisSize: MainAxisSize.max,
            children: [
              if (canFollow ?? false)
                context.userAvatar(
                    size: UserAvatarSize.x60x60,
                    type: userTileType,
                    userName: name ?? '',
                    imageUrl: avatarUrl,
                    showAchievements: false)
              else
                context.userAvatar(
                    size: UserAvatarSize.x48x48,
                    type: userTileType,
                    userName: name ?? '',
                    imageUrl: avatarUrl,
                    showAchievements: false),
              if (canFollow ?? false) SpacingFoundation.horizontalSpace16 else SpacingFoundation.horizontalSpace12,
              Expanded(
                child: profileType == ProfileCardType.personal
                    ? PersonalProfileInfo(
                        name: name,
                        nickname: nickname ?? '',
                      )
                    : CompanyProfileInfo(
                        companyName: name,
                        tags: tags ?? [],
                      ),
              ),
              if (onShare != null)
                GestureDetector(
                  onTap: onShare,
                  child: Icon(
                    ShuffleUiKitIcons.share,
                    color: theme?.colorScheme.darkNeutral800,
                  ),
                )
            ],
          ).paddingSymmetric(horizontal: EdgeInsetsFoundation.all16),
          SpacingFoundation.verticalSpace16,
          if (speciality != null || (socialLinks != null && socialLinks!.isNotEmpty)) ...[
            Row(
              children: [
                Expanded(
                  child: GradientableWidget(
                    gradient: GradientFoundation.defaultLinearGradient,
                    child: Text(
                      speciality ?? '',
                      style: theme?.boldTextTheme.caption2Medium.copyWith(color: Colors.white),
                    ),
                  ),
                ),
                if (socialLinks != null)
                  for (var (index, icon) in socialLinks!.map((e) => e.icon).toList().indexed)
                    context
                        .smallOutlinedButton(
                            data: BaseUiKitButtonData(
                                iconWidget: ImageWidget(
                                  iconData: icon,
                                  color: theme?.colorScheme.inversePrimary,
                                ),
                                onPressed: () {
                                  launchUrlString(socialLinks![index], mode: LaunchMode.externalApplication);
                                }))
                        .paddingOnly(left: SpacingFoundation.horizontalSpacing6)
              ],
            ).paddingSymmetric(horizontal: EdgeInsetsFoundation.all16),
            SpacingFoundation.verticalSpace16,
          ],
          if (onFollow != null) ...[
            context
                .button(data: BaseUiKitButtonData(text: S.of(context).Follow.toUpperCase(), onPressed: onFollow))
                .paddingSymmetric(horizontal: EdgeInsetsFoundation.all16),
            SpacingFoundation.verticalSpace16
          ],
          if (followers != null && followers! > 0) ...[
            RichText(
                textAlign: onFollow != null ? TextAlign.center : TextAlign.start,
                text: TextSpan(children: [
                  TextSpan(text: '${followers} ', style: theme?.boldTextTheme.caption1Bold),
                  TextSpan(
                      text: S.of(context).Followers.toLowerCase(),
                      style: theme?.regularTextTheme.caption1.copyWith(color: ColorsFoundation.mutedText)),
                ])).paddingSymmetric(horizontal: EdgeInsetsFoundation.all16),
            SpacingFoundation.verticalSpace16
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
                      theme?.colorScheme.surface1 ?? Colors.transparent,
                      (theme?.colorScheme.surface1 ?? Colors.transparent).withOpacity(0)
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
                        theme?.colorScheme.surface1 ?? Colors.transparent,
                        (theme?.colorScheme.surface1 ?? Colors.transparent).withOpacity(0)
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
          ).paddingSymmetric(horizontal: EdgeInsetsFoundation.all16),

          if (description != null) ...[
            SpacingFoundation.verticalSpace16,
            ProfileDescription(
              text: description ?? '',
            ).paddingSymmetric(horizontal: EdgeInsetsFoundation.all16)
          ],
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
            ).paddingSymmetric(horizontal: EdgeInsetsFoundation.all16),
          ] else if(proStats!= null)
            for(var stat in proStats!.getUiKitCards(context))
              ...[
                stat.paddingSymmetric(vertical: SpacingFoundation.verticalSpacing2,horizontal: SpacingFoundation.horizontalSpacing16)
              ],

          if (profileWidgets != null) ...[
            SpacingFoundation.verticalSpace16,
            Row(
              mainAxisSize: MainAxisSize.max,
              children: [
                Expanded(
                  child: profileWidgets!.first,
                ),
                SpacingFoundation.horizontalSpace16,
                Expanded(
                  child: profileWidgets!.last,
                ),
              ],
            ).paddingSymmetric(horizontal: EdgeInsetsFoundation.all16),
            SpacingFoundation.verticalSpace16,
          ],
        ],
      ).paddingOnly(top: EdgeInsetsFoundation.all16),
      // ).paddingLTRB(EdgeInsetsFoundation.all16, EdgeInsetsFoundation.all16, EdgeInsetsFoundation.all16, 0),
    );
  }
}
