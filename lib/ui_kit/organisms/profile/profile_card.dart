import 'package:flutter/material.dart';
import 'package:shuffle_uikit/shuffle_uikit.dart';
import 'package:shuffle_uikit/ui_kit/organisms/profile/profile_card_body.dart';

class ProfileCard extends StatelessWidget {
  final String? nickname;
  final String? name;
  final String? description;
  final String? avatarUrl;
  final int? followers;
  final VoidCallback? onFollow;
  final ValueChanged<int>? onDonate;
  final bool showSupportShuffle;
  final List<String>? interests;
  final List<String>? matchingInterests;
  final List<UiKitStats>? profileStats;
  final ProfileStats? proStats;
  final List<Widget>? profileWidgets;
  final Widget? badge;
  final ProfileCardType? profileType;
  final List<UiKitTag>? tags;
  final VoidCallback? onCustomDonate;
  final VoidCallback? onViewAllAchievements;
  final List<UiKitAchievementsModel> achievements;
  final UserTileType userTileType;
  final VoidCallback? onShare;
  final List<String>? socialLinks;
  final String? speciality;
  final Widget? profileCardBody;
  final ValueChanged<String?>? onSocialLinksTap;

  const ProfileCard({
    super.key,
    this.nickname,
    this.profileStats,
    this.profileWidgets,
    this.description,
    this.avatarUrl,
    this.name,
    this.badge,
    this.onShare,
    this.followers,
    this.onFollow,
    this.onDonate,
    this.proStats,
    this.onCustomDonate,
    this.showSupportShuffle = false,
    this.interests,
    this.matchingInterests,
    this.profileType,
    this.tags,
    this.userTileType = UserTileType.ordinary,
    this.onViewAllAchievements,
    this.achievements = const [],
    this.socialLinks,
    this.speciality,
    this.profileCardBody,
    this.onSocialLinksTap,
  });

  @override
  Widget build(BuildContext context) {
    final child = profileCardBody ??
        ProfileCardBody(
            description: description,
            avatarUrl: avatarUrl,
            interests: interests,
            matchingInterests: matchingInterests,
            canFollow: followers != null && onFollow != null,
            name: name,
            userTileType: userTileType,
            nickname: nickname ?? '',
            followers: followers,
            onFollow: onFollow,
            profileType: profileType,
            tags: tags,
            profileStats: profileStats,
            proStats: proStats,
            profileWidgets: profileWidgets,
            showSupportShuffle: showSupportShuffle,
            onDonate: onDonate,
            onCustomDonate: onCustomDonate,
            onViewAllAchievements: onViewAllAchievements,
            achievements: achievements,
            socialLinks: socialLinks,
            speciality: speciality,
            onShare: onShare);
    if (badge != null) {
      return Stack(
        fit: StackFit.passthrough,
        children: [
          child.paddingOnly(
            top: EdgeInsetsFoundation.vertical4,
            right: EdgeInsetsFoundation.horizontal4,
          ),
          Align(
            alignment: Alignment.topRight,
            child: badge,
          ),
        ],
      );
    }

    return child;
  }
}

enum ProfileCardType { personal, company }
