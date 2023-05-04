import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:shuffle_uikit/ui_kit_external.dart';

/// думаю стоит перенепсти этот виджет в компонентную библиотеку разобрав его на атомы
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
        final theme = context.uiKitTheme;
        final postBodyStyle = context.uiKitTheme?.boldTextTheme.caption1Bold;
        return Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Row(
              mainAxisSize: MainAxisSize.max,
              children: [
                ClipRRect(
                  borderRadius: BorderRadiusFoundation.all24,
                  child: ImageWidget(
                    link: place.image,
                    width: 80,
                    height: 80,
                    // package: 'shuffle_uikit',
                  ),
                ),
                SpacingFoundation.horizontalSpace10,
                Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      place.title,
                      style: theme?.boldTextTheme.caption1Bold,
                    ),
                    SpacingFoundation.verticalSpace2,
                    Text(
                      place.createdAt,
                      style: theme?.boldTextTheme.caption1Medium.copyWith(
                        color: ColorsFoundation.darkNeutral900,
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
                              UiKitTagWidget(
                                title: place.stars!.toStringAsFixed(0),
                                icon: 'assets/images/svg/star.svg',
                                textColor: Colors.white,
                              ),
                            ...place.tags
                                .map<Widget>((e) => UiKitTagWidget(
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
            Text(
              place.postBody,
              style: postBodyStyle,
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
                  style: theme?.boldTextTheme.caption1Bold.copyWith(
                    color: ColorsFoundation.darkNeutral900,
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
