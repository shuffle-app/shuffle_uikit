import 'package:flutter/material.dart';
import 'package:shuffle_uikit/shuffle_uikit.dart';

class UiKitDonationCard extends StatelessWidget {
  const UiKitDonationCard({
    super.key,
    required this.number,
    required this.username,
    required this.userTileType,
    required this.name,
    required this.sum,
    this.points,
    this.avatarUrl,
    this.isStarEnabled,
  });

  final int number;
  final String username;
  final String name;
  final String sum;
  final String? points;
  final bool? isStarEnabled;
  final UserTileType userTileType;
  final String? avatarUrl;

  @override
  Widget build(BuildContext context) {
    final boldTextTheme = context.uiKitTheme?.boldTextTheme;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Row(
          children: [
            SizedBox(width: 30.w, child: Text('#$number', style: boldTextTheme?.subHeadline)),
            SpacingFoundation.horizontalSpace12,
            context.userAvatar(size: UserAvatarSize.x40x40, type: userTileType, userName: name, imageUrl: avatarUrl),
            SpacingFoundation.horizontalSpace8,
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('@$username', style: boldTextTheme?.caption1Bold),
                    SpacingFoundation.horizontalSpace4,
                    if (isStarEnabled != null && isStarEnabled!)
                      GradientableWidget(
                        gradient: GradientFoundation.starLinearGradient,
                        child: ImageWidget(
                          rasterAsset: GraphicsFoundation.instance.png.star2,
                          height: 16.h,
                          fit: BoxFit.cover,
                          color: Colors.white,
                        ),
                      ),
                  ],
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      width: 90.w,
                      child: Text(
                        name,
                        style: boldTextTheme?.caption1Medium.copyWith(
                          color: ColorsFoundation.darkNeutral900,
                        ),
                      ),
                    ),
                    SpacingFoundation.horizontalSpace12,
                    Text('$sum \$', style: boldTextTheme?.body),
                  ],
                ),
              ],
            ),
          ],
        ),
        SpacingFoundation.verticalSpace12,
        if (points != null)
          Container(
            decoration: BoxDecoration(
              gradient: GradientFoundation.donationLinearGradient,
              borderRadius: BorderRadiusFoundation.all24,
            ),
            child: Center(
              child: Text(
                '+ ${S.current.FindSomeoneCardPoints(int.tryParse(points?.replaceAll(' ', '') ?? '0') ?? 0)}',
                style: boldTextTheme?.caption1Bold.copyWith(color: Colors.black),
              ).paddingSymmetric(vertical: EdgeInsetsFoundation.vertical6),
            ),
          ),
      ],
    );
  }
}
