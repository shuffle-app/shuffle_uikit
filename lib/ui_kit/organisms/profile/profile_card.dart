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
  final Widget? badge;
  final ProfileCardType? profileType;
  final List<UiKitTag>? tags;
  final VoidCallback? onViewAllAchievements;
  final List<UiKitAchievementsModel> achievements;

  const ProfileCard({
    Key? key,
    this.nickname,
    this.profileStats,
    this.description,
    this.avatarUrl,
    this.name,
    this.badge,
    this.followers,
    this.onFollow,
    this.onDonate,
    this.showSupportShuffle = false,
    this.interests,
    this.matchingInterests,
    this.profileType,
    this.tags,
    this.onViewAllAchievements,
    this.achievements = const [],
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final child = ProfileCardBody(
      description: description,
      avatarUrl: avatarUrl,
      interests: interests,
      matchingInterests: matchingInterests,
      canFollow: followers != null && onFollow != null,
      name: name,
      nickname: nickname ?? '',
      followers: followers,
      onFollow: onFollow,
      profileType: profileType,
      tags: tags,
      profileStats: profileStats,
      showSupportShuffle: showSupportShuffle,
      onDonate: onDonate,
      onViewAllAchievements: onViewAllAchievements,
      achievements: achievements,
    );
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
