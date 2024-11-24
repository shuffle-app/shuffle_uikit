import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:shuffle_uikit/shuffle_uikit.dart';
import 'package:url_launcher/url_launcher_string.dart';

class ProPublicProfileCardBody extends StatelessWidget {
  final DateTime? registrationDate;
  final String? name;
  final String? nickname;
  final String? avatarUrl;
  final String? phone;
  final String? email;
  final VoidCallback? onShare;
  final VoidCallback? onFollow;
  final bool? following;
  final int followers;
  final List<String>? interests;
  final List<String>? matchingInterests;
  final ValueChanged<String>? onSocialLinksPressed;
  final List<String>? socialLinks;

  const ProPublicProfileCardBody({
    super.key,
    this.registrationDate,
    this.name,
    this.nickname,
    this.avatarUrl,
    this.onShare,
    this.onFollow,
    this.following,
    this.followers = 0,
    this.interests,
    this.matchingInterests,
    this.phone,
    this.email,
    this.onSocialLinksPressed,
    this.socialLinks,
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
                  DateFormat('MMM d, yyyy', Localizations.localeOf(context).languageCode)
                      .format(registrationDate!)
                      .replaceAll('.', '')
                      .capitalize(),
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
                    if (phone != null)
                      GestureDetector(
                          onTap: () => launchUrlString('tel:+$phone'),
                          child: Text(
                            phone!,
                            style: regularTextTheme?.caption2,
                          )),
                    if (email != null)
                      GestureDetector(
                          onTap: () => launchUrlString('mailto:$email'),
                          child: Text(
                            email!,
                            style: regularTextTheme?.caption2,
                          )),
                  ],
                ),
              ),
              if (socialLinks != null && socialLinks!.isNotEmpty && socialLinks!.length <= 2) ...[
                SpacingFoundation.horizontalSpace4,
                ...socialLinks!.map(
                  (e) {
                    return context
                        .smallOutlinedButton(
                          data: BaseUiKitButtonData(
                            onPressed: () {
                              onSocialLinksPressed?.call(e);
                            },
                            iconInfo: BaseUiKitButtonIconData(
                              iconPath: e.iconSvg,
                              iconData: e.icon,
                            ),
                          ),
                        )
                        .paddingOnly(right: e != socialLinks?.last ? SpacingFoundation.horizontalSpacing4 : 0);
                  },
                ),
                SpacingFoundation.horizontalSpace4,
              ],
            ],
          ),
          SpacingFoundation.verticalSpace16,
          if (socialLinks != null && socialLinks!.isNotEmpty && socialLinks!.length > 2)
            Wrap(
              alignment: WrapAlignment.spaceBetween,
              children: socialLinks?.map(
                    (e) {
                      return context
                          .smallOutlinedButton(
                            data: BaseUiKitButtonData(
                              onPressed: () {
                                onSocialLinksPressed?.call(e);
                              },
                              iconInfo: BaseUiKitButtonIconData(
                                iconPath: e.iconSvg,
                                iconData: e.icon,
                              ),
                            ),
                          )
                          .paddingOnly(right: e != socialLinks?.last ? SpacingFoundation.horizontalSpacing4 : 0);
                    },
                  ).toList() ??
                  [],
            ),
        ],
      ).paddingAll(EdgeInsetsFoundation.all16),
    );
  }
}
