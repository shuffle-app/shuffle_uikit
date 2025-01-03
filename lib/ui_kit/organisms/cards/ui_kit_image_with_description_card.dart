import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:shuffle_uikit/shuffle_uikit.dart';

class UiKitImageWithDescriptionCard extends StatelessWidget {
  final String title;
  final String imageUrl;
  final String? subtitle;
  final IconData? subtitleIcon;
  final List<UiKitTag> tags;
  final VoidCallback? onTap;

  const UiKitImageWithDescriptionCard({
    super.key,
    required this.title,
    required this.imageUrl,
    this.tags = const [],
    this.subtitle,
    this.subtitleIcon,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final width = 0.50625 * 1.sw;

    final imageHeight = width * 1.02469 * 0.48192;
    final textTheme = context.uiKitTheme?.boldTextTheme;
    final colorScheme = context.uiKitTheme?.colorScheme;

    return InkWell(
        borderRadius: BorderRadiusFoundation.all16,
        onTap: onTap,
        child: UiKitCardWrapper(
          width: width,
          borderRadius: BorderRadiusFoundation.all16,
          color: colorScheme?.surface2,
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
              SpacingFoundation.verticalSpace4,
              SizedBox(
                  height: 26.h,
                  child: AutoSizeText(
                    title,
                    group: _autoSizeGroup,
                    maxLines: 2,
                    style: textTheme?.caption1Bold,
                  )),
              SpacingFoundation.verticalSpace4,
              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  if (subtitleIcon != null)
                    ImageWidget(
                      iconData: subtitleIcon,
                      color: ColorsFoundation.darkNeutral900,
                      width: 0.05.sw,
                      height: 0.05.sw,
                      fit: BoxFit.cover,
                    ),
                  if (subtitleIcon != null) SpacingFoundation.horizontalSpace2,
                  Text(
                    subtitle ?? '',
                    style: textTheme?.caption2Bold.copyWith(color: ColorsFoundation.darkNeutral900),
                  ),
                ],
              ),
              SpacingFoundation.verticalSpace2,
              SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Wrap(
                    spacing: SpacingFoundation.horizontalSpacing4,
                    runSpacing: SpacingFoundation.verticalSpacing4,
                    children: tags
                        .map<Widget>(
                          (e) => UiKitTagWidget(
                            tagSize: 0.05.sw,
                            title: e.title,
                            icon: e.icon,
                            textColor: ColorsFoundation.darkNeutral900,
                          ),
                        )
                        .toList(),
                  ))
            ],
          ).paddingAll(EdgeInsetsFoundation.all12),
        ));
  }
}

final AutoSizeGroup _autoSizeGroup = AutoSizeGroup();
