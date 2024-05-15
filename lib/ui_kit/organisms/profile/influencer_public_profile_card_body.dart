import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:shuffle_uikit/shuffle_uikit.dart';

class InfluencerPublicProfileCardBody extends StatelessWidget {
  final String? name;
  final String? nickname;
  final String? description;
  final String? avatarUrl;
  final String? speciality;
  final List<Widget>? socialLinks;
  final List<String>? interests;
  final List<String>? matchingInterests;
  final VoidCallback? onShare;
  final bool? hasAchievements;
  final int followers;
  final VoidCallback? onFollow;
  final bool? following;

  const InfluencerPublicProfileCardBody({
    Key? key,
    this.name,
    this.nickname,
    this.description,
    this.avatarUrl,
    this.speciality,
    this.socialLinks,
    this.interests,
    this.matchingInterests,
    this.onShare,
    this.hasAchievements,
    this.followers = 0,
    this.onFollow,
    this.following,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = context.uiKitTheme;
    final boldTextTheme = theme?.boldTextTheme;
    final regularTextTheme = theme?.regularTextTheme;
    final colorScheme = theme?.colorScheme;

    return UiKitCardWrapper(
      color: colorScheme?.surface1,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Row(
            mainAxisSize: MainAxisSize.max,
            children: [
              context.userAvatar(
                size: UserAvatarSize.x60x60,
                type: UserTileType.influencer,
                userName: name ?? '',
                imageUrl: avatarUrl,
                showAchievements: hasAchievements ?? false,
              ),
              SpacingFoundation.horizontalSpace4,
              Expanded(
                child: PersonalProfileInfo(
                  name: name,
                  nickname: nickname ?? '',
                  nameStyle: boldTextTheme?.caption1Bold,
                  nicknameStyle: boldTextTheme?.caption1Medium.copyWith(color: colorScheme?.darkNeutral500),
                ),
              ),
              SpacingFoundation.horizontalSpace4,
              if (onShare != null)
                GestureDetector(
                  onTap: onShare,
                  child: Icon(
                    ShuffleUiKitIcons.share,
                    color: theme?.colorScheme.darkNeutral800,
                  ),
                ),
            ],
          ),
          SpacingFoundation.verticalSpace16,
          Row(
            mainAxisSize: MainAxisSize.max,
            children: [
              Expanded(
                child: GradientableWidget(
                  gradient: GradientFoundation.defaultLinearGradient,
                  child: Text(
                    speciality ?? '',
                    style: theme?.boldTextTheme.caption2Medium.copyWith(color: Colors.white),
                    maxLines: 2,
                  ),
                ),
              ),
              SpacingFoundation.horizontalSpace16,
              if (socialLinks != null)
                ...socialLinks!.map((e) {
                  final index = socialLinks!.indexOf(e);

                  return e.paddingOnly(
                    right:
                        index != socialLinks!.length - 1 ? EdgeInsetsFoundation.horizontal8 : EdgeInsetsFoundation.zero,
                  );
                }).toList(),
            ],
          ),
          SpacingFoundation.verticalSpace16,
          context.button(
            data: BaseUiKitButtonData(
              text: following == true ? S.current.UnsubscribeFromProfile : S.current.SubscribeToProfile,
              onPressed: onFollow,
            ),
          ),
          SpacingFoundation.verticalSpace16,
          RichText(
            textAlign: TextAlign.center,
            text: TextSpan(
              children: [
                TextSpan(
                  text:
                      '${NumberFormat('###,###', Localizations.localeOf(context).languageCode).format(followers).replaceAll(',', ' ')} ',
                  style: boldTextTheme?.caption1Bold.copyWith(color: colorScheme?.bodyTypography),
                ),
                TextSpan(
                  text: S.current.FollowersCount(followers),
                  style: boldTextTheme?.caption1Medium.copyWith(color: ColorsFoundation.mutedText),
                ),
              ],
            ),
          ),
          SpacingFoundation.verticalSpace16,
          if (interests != null && matchingInterests != null)
            ProfileInterests(
              profileInterests: interests!,
              matchingInterests: matchingInterests!,
            ),
          SpacingFoundation.verticalSpace16,
          if (description != null)
            Text(
              description!,
              style: boldTextTheme?.caption1Bold,
            ),
        ],
      ).paddingAll(EdgeInsetsFoundation.all16),
    );
  }
}
