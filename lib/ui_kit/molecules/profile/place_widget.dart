import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:shuffle_uikit/themes/ui_kit_theme_data.dart';
import 'package:shuffle_uikit/ui_kit/atoms/profile/place_post_body.dart';
import 'package:shuffle_uikit/ui_kit/atoms/profile/place_tag_widget.dart';
import 'package:shuffle_uikit/ui_models/profile/profile_post.dart';

import '../../../foundation/shuffle_ui_kit_foundation.dart';

class PlaceWidget extends StatelessWidget {
  final ProfilePlace place;

  const PlaceWidget({
    Key? key,
    required this.place,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, size) {
        final theme = Theme.of(context).extension<UiKitThemeData>();
        return Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Row(
              mainAxisSize: MainAxisSize.max,
              children: [
                ClipRRect(
                  borderRadius: BorderRadiusFoundation.all24,
                  child: Image.asset(
                    place.image,
                    width: 80,
                    height: 80,
                    package: 'shuffle_uikit',
                  ),
                ),
                SpacingFoundation.horizontalSpace10,
                Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      place.title,
                      style: theme?.boldTextTheme.caption1,
                    ),
                    SpacingFoundation.verticalSpace2,
                    Text(
                      place.createdAt,
                      style: theme?.boldTextTheme.caption1Medium.copyWith(
                        color: ColorsFoundation.solidGreyText,
                      ),
                    ),
                    SpacingFoundation.verticalSpace8,
                    SizedBox(
                      height: 16,
                      width: size.maxWidth - 90,
                      child: SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Row(
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
                      ),
                    ),
                  ],
                ),
              ],
            ),
            SpacingFoundation.verticalSpace12,
            PlacePostBody(
              text: place.postBody,
            ),
            SpacingFoundation.verticalSpace12,
            Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                SvgPicture.asset(
                  'assets/images/svg/like.svg',
                  package: 'shuffle_uikit',
                ),
                SpacingFoundation.horizontalSpace8,
                Text(
                  'Helpful',
                  style: theme?.boldTextTheme.caption1.copyWith(
                    color: ColorsFoundation.solidGreyText,
                  ),
                )
              ],
            ),
          ],
        );
      },
    );
  }
}
