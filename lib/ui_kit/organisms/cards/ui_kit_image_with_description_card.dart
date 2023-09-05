import 'package:flutter/material.dart';
import 'package:shuffle_uikit/shuffle_uikit.dart';

class UiKitImageWithDescriptionCard extends StatelessWidget {
  final String title;
  final String imageUrl;
  final String? subtitle;
  final List<UiKitTag> tags;

  const UiKitImageWithDescriptionCard({
    Key? key,
    required this.title,
    required this.imageUrl,
    this.tags = const [],
    this.subtitle,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final width = 0.50625 * 1.sw;

    print(width);
    final imageHeight = width * 1.02469 * 0.48192;
    final textTheme = context.uiKitTheme?.boldTextTheme;

    return UiKitCardWrapper(
      width: width,
      borderRadius: BorderRadiusFoundation.all16,
      color: ColorsFoundation.surface2,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          ClipRRect(
            borderRadius: BorderRadiusFoundation.all8,
            child: ImageWidget(
              height: imageHeight,
              fit: BoxFit.cover,
              link: imageUrl,
            ),
          ),
          SpacingFoundation.verticalSpace8,
          Text(
            title,
            style: textTheme?.caption1Bold,
          ),
          SpacingFoundation.verticalSpace4,
          Text(
            subtitle ?? '',
            style: textTheme?.caption2Bold.copyWith(color: ColorsFoundation.darkNeutral900),
          ),
          SpacingFoundation.verticalSpace2,
          Wrap(
            spacing: SpacingFoundation.horizontalSpacing4,
            runSpacing: SpacingFoundation.verticalSpacing4,
            children: tags
                .map<Widget>(
                  (e) => UiKitTagWidget(
                    title: e.title,
                    icon: e.iconPath,
                    textColor: ColorsFoundation.darkNeutral900,
                  ),
                )
                .toList(),
          )
        ],
      ).paddingAll(EdgeInsetsFoundation.all12),
    );
  }
}
