import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:shuffle_uikit/shuffle_uikit.dart';

class UiKitVideoReactionTile extends StatelessWidget {
  final String? authorAvatarUrl;
  final String? authorName;
  final UserTileType? authorType;
  final DateTime? reactionDate;
  final DateTime? eventDate;
  final String? eventName;
  final String? placeName;
  final VoidCallback? onPlaceNameTapped;
  final VoidCallback? onSeeMorePopOverCallback;
  final bool Function()? canNavigateToPublicProfile;

  const UiKitVideoReactionTile({
    super.key,
    this.authorAvatarUrl,
    this.authorType,
    this.authorName,
    this.reactionDate,
    this.eventDate,
    this.eventName,
    this.placeName,
    this.onPlaceNameTapped,
    this.canNavigateToPublicProfile,
    this.onSeeMorePopOverCallback,
  });

  void _showPopOver(BuildContext context) {
    final boldTextTheme = context.uiKitTheme?.boldTextTheme;
    final colorScheme = context.uiKitTheme?.colorScheme;

    showUiKitPopover(
      context,
      buttonText: S.current.SeeMore,
      showButton: true,
      customMinHeight: 0.175.sh,
      buttonFit: ButtonFit.fitWidth,
      title: RichText(
        text: TextSpan(
          children: [
            TextSpan(
              text: S.current.PremiumAccount,
              style: boldTextTheme?.title2.copyWith(
                color: colorScheme?.surface,
              ),
            ),
            TextSpan(
              text: '\n ${S.current.CantSeePublicProfileMessage}',
              style: boldTextTheme?.body.copyWith(
                color: colorScheme?.surface,
              ),
            ),
          ],
        ),
        textAlign: TextAlign.center,
      ),
      onPop: onSeeMorePopOverCallback,
    );
  }

  void _authorTapHandler(BuildContext context) {
    final skipPopOver = canNavigateToPublicProfile?.call() ?? false;
    if (!skipPopOver) _showPopOver(context);
  }

  @override
  Widget build(BuildContext context) {
    final boldTextTheme = context.uiKitTheme?.boldTextTheme;

    return Row(
      mainAxisSize: MainAxisSize.max,
      children: [
        GestureDetector(
          onTap: () => _authorTapHandler(context),
          child: context.userAvatar(
            size: UserAvatarSize.x48x48,
            type: authorType ?? UserTileType.ordinary,
            userName: authorName ?? '',
            imageUrl: authorAvatarUrl,
          ),
        ),
        SpacingFoundation.horizontalSpace12,
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisSize: MainAxisSize.min,
            children: [
              RichText(
                text: TextSpan(
                  children: [
                    TextSpan(
                      text: authorName,
                      style: boldTextTheme?.caption1Bold,
                      recognizer: TapGestureRecognizer()..onTap = () => _authorTapHandler(context),
                    ),
                    if (reactionDate != null)
                      TextSpan(
                        text: '  ${formatDateTimeDifferenceWithMonthName(reactionDate!)}',
                        style: boldTextTheme?.caption1Bold.copyWith(color: Colors.white38),
                      ),
                  ],
                ),
              ),
              if (eventName != null) SpacingFoundation.verticalSpace2,
              if (eventName != null)
                RichText(
                  text: TextSpan(
                    children: [
                      TextSpan(
                        text: eventName!,
                        style: boldTextTheme?.caption1Bold,
                      ),
                      if (eventDate != null)
                        TextSpan(
                          text: '  ${formatDateTimeDifferenceWithMonthName(eventDate!)}',
                          style: boldTextTheme?.caption1Bold.copyWith(color: Colors.white38),
                        ),
                    ],
                  ),
                ),
              if (placeName != null) ...[
                SpacingFoundation.verticalSpace2,
                GestureDetector(
                  onTap: onPlaceNameTapped,
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: UiKitPlaceTag(
                      placeName: placeName ?? '',
                    ),
                  ),
                ),
              ],
            ],
          ),
        ),
      ],
    );
  }
}
