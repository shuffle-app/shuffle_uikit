import 'package:flutter/material.dart';
import 'package:shuffle_uikit/shuffle_uikit.dart';

class UiKitDonationCard extends StatelessWidget {
  const UiKitDonationCard({
    super.key,
    required this.number,
    required this.title,
    required this.subtitle,
    required this.sum,
    this.points,
    this.isStarEnabled,
  });

  final int number;
  final String title;
  final String subtitle;
  final String sum;
  final String? points;
  final bool? isStarEnabled;

  @override
  Widget build(BuildContext context) {
    final boldTextTheme = context.uiKitTheme?.boldTextTheme;

    return Column(
      children: [
        Row(
          children: [
            Text('#$number', style: boldTextTheme?.subHeadline),
            SpacingFoundation.horizontalSpace12,
            ClipRRect(
              borderRadius: BorderRadiusFoundation.max,
              child: ImageWidget(
                rasterAsset: GraphicsFoundation.instance.png.profileAvatar,
                height: 40.h,
              ),
            ),
            SpacingFoundation.horizontalSpace8,
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(title, style: boldTextTheme?.caption1Bold),
                    SpacingFoundation.horizontalSpace4,
                    if (isStarEnabled != null && isStarEnabled!)
                      ImageWidget(
                        rasterAsset: GraphicsFoundation.instance.png.star2,
                        height: 16.h,
                        fit: BoxFit.cover,
                      ),
                  ],
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      width: 90.w,
                      child: Text(
                        subtitle,
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
          ConstrainedBox(
            constraints: BoxConstraints.expand(height: 28.h),
            child: GradientableWidget(
              gradient: GradientFoundation.donationLinearGradient,
              child: SmallGradientButton(
                text: '+ $points points',
              ),
            ),
          ),
      ],
    );
  }
}
