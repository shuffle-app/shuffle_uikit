import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:shuffle_uikit/shuffle_uikit.dart';
import 'package:shuffle_uikit/ui_kit/atoms/profile/place_post_body.dart';
import 'package:shuffle_uikit/ui_kit/atoms/profile/place_tag_widget.dart';

class PlaceWidget extends StatelessWidget {
  final ProfilePlace place;

  const PlaceWidget({
    Key? key,
    required this.place,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Row(
          mainAxisSize: MainAxisSize.max,
          children: [
            ClipRRect(
              borderRadius: UiKitBorderRadius.all24,
              child: Image.asset(
                place.image,
                width: 80,
                height: 80,
                package: 'shuffle_uikit',
              ),
            ),
            UiKitSpacing.horizontalSpace10,
            Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  place.title,
                  style: Theme.of(context).textTheme.labelMedium,
                ),
                UiKitSpacing.verticalSpace2,
                Text(
                  place.createdAt,
                  style: Theme.of(context).textTheme.labelSmall?.copyWith(
                        color: UiKitColors.solidGreyText,
                      ),
                ),
                UiKitSpacing.verticalSpace8,
                Row(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    if (place.stars != null)
                      PlaceTagWidget(
                        title: place.stars!.toStringAsFixed(0),
                        icon: 'assets/images/svg/star.svg',
                        textColor: Colors.white,
                      ),
                    ...place.tags
                        .map<Widget>((e) => PlaceTagWidget(
                              title: e.title,
                              icon: e.icon,
                              showSpacing: place.stars != null || place.tags.indexOf(e) != 0,
                            ))
                        .toList(),
                  ],
                ),
              ],
            ),
          ],
        ),
        UiKitSpacing.verticalSpace12,
        PlacePostBody(
          text: place.postBody,
        ),
        UiKitSpacing.verticalSpace12,
        Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            SvgPicture.asset(
              'assets/images/svg/like.svg',
              package: 'shuffle_uikit',
            ),
            UiKitSpacing.horizontalSpace8,
            Text(
              'Helpful',
              style: Theme.of(context).textTheme.bodySmall?.copyWith(
                    color: UiKitColors.solidGreyText,
                  ),
            )
          ],
        ),
      ],
    );
  }
}
