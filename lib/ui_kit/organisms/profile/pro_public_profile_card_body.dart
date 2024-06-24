import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:shuffle_uikit/shuffle_uikit.dart';

class ProPublicProfileCardBody extends StatelessWidget {
  final DateTime? registrationDate;
  final String? name;
  final String? nickname;
  final String? avatarUrl;
  final String? phone;
  final String? email;
  final List<UiKitTag>? tags;
  final VoidCallback? onShare;
  final VoidCallback? onFollow;
  final bool? following;
  final int followers;
  final List<String>? interests;
  final List<String>? matchingInterests;
  final VoidCallback? onTelegramPressed;
  final VoidCallback? onWhatsappPressed;

  const ProPublicProfileCardBody({
    super.key,
    this.registrationDate,
    this.name,
    this.nickname,
    this.avatarUrl,
    this.tags,
    this.onShare,
    this.onFollow,
    this.following,
    this.followers = 0,
    this.interests,
    this.matchingInterests,
    this.phone,
    this.email,
    this.onTelegramPressed,
    this.onWhatsappPressed,
  });

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
          if (registrationDate != null)
            Align(
              alignment: Alignment.centerLeft,
              child: Container(
                clipBehavior: Clip.hardEdge,
                decoration: BoxDecoration(
                  color: colorScheme?.darkNeutral500.withOpacity(0.16) ??
                      ColorsFoundation.darkNeutral500.withOpacity(0.16),
                  borderRadius: BorderRadiusFoundation.all4,
                ),
                child: Text(
                  '${DateFormat('MMMd', Localizations.localeOf(context).languageCode).format(registrationDate!)}, '
                  '${DateFormat('yyyy', Localizations.localeOf(context).languageCode).format(registrationDate!)}',
                  style: regularTextTheme?.caption4Regular.copyWith(color: ColorsFoundation.darkNeutral800),
                ).paddingSymmetric(
                    vertical: EdgeInsetsFoundation.vertical2, horizontal: EdgeInsetsFoundation.horizontal4),
              ),
            ),
          SpacingFoundation.verticalSpace8,
          Row(
            mainAxisSize: MainAxisSize.max,
            children: [
              context.userAvatar(
                  size: UserAvatarSize.x60x60,
                  type: UserTileType.pro,
                  userName: name ?? '',
                  imageUrl: avatarUrl,
                  showAchievements: false),
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
                )
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
          if (interests != null)
            ProfileInterests(
              profileInterests: interests!,
              matchingInterests: matchingInterests,
            ),
          SpacingFoundation.verticalSpace16,
          Text(
            S.current.Contacts,
            style: regularTextTheme?.labelSmall.copyWith(color: ColorsFoundation.mutedText),
          ),
          SpacingFoundation.verticalSpace4,
          Row(
            mainAxisSize: MainAxisSize.max,
            children: [
              Expanded(
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Text(
                      phone ?? '',
                      style: regularTextTheme?.caption2,
                    ),
                    Text(
                      email ?? '',
                      style: regularTextTheme?.caption2,
                    ),
                  ],
                ),
              ),
              SpacingFoundation.horizontalSpace4,
              context.smallOutlinedButton(
                data: BaseUiKitButtonData(
                  onPressed: onTelegramPressed,
                  iconInfo: BaseUiKitButtonIconData(
                    iconPath: GraphicsFoundation.instance.svg.socialTelegram.path,
                  ),
                ),
              ),
              SpacingFoundation.horizontalSpace4,
              context.smallOutlinedButton(
                data: BaseUiKitButtonData(
                  onPressed: onWhatsappPressed,
                  iconInfo: BaseUiKitButtonIconData(
                    iconPath: GraphicsFoundation.instance.svg.socialWhatsapp.path,
                  ),
                ),
              ),
              SpacingFoundation.horizontalSpace4,
            ],
          ),
        ],
      ).paddingAll(EdgeInsetsFoundation.all16),
    );
  }
}
