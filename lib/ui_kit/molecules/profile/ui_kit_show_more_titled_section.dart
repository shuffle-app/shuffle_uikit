import 'package:flutter/material.dart';
import 'package:shuffle_uikit/shuffle_uikit.dart';
import 'package:auto_size_text/auto_size_text.dart';

class UiKitShowMoreTitledSection extends StatelessWidget {
  final String title;
  final Widget content;
  final VoidCallback? onShowMore;
  final bool? underService;

  const UiKitShowMoreTitledSection({
    super.key,
    required this.title,
    required this.content,
    this.onShowMore,
    this.underService = false,
  });

  @override
  Widget build(BuildContext context) {
    final boldTextTheme = context.uiKitTheme?.boldTextTheme;
    final regularTextTheme = context.uiKitTheme?.regularTextTheme;

    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: AutoSizeText(
                title,
                maxLines: 1,
                style: boldTextTheme?.title2,
              ),
            ),
            if (onShowMore != null) SpacingFoundation.horizontalSpace16,
            if (onShowMore != null)
              context.smallOutlinedButton(
                data: BaseUiKitButtonData(
                  onPressed: onShowMore,
                  iconInfo: BaseUiKitButtonIconData(
                    iconData: ShuffleUiKitIcons.chevronright,
                    size: 16.h,
                  ),
                ),
              ),
          ],
        ).paddingSymmetric(horizontal: SpacingFoundation.horizontalSpacing16),
        SpacingFoundation.verticalSpace16,
        Stack(
          fit: StackFit.passthrough,
          clipBehavior: Clip.none,
          children: [
            UiKitCardWrapper(
              child: content.paddingAll(EdgeInsetsFoundation.all16),
            ).paddingSymmetric(horizontal: SpacingFoundation.horizontalSpacing16),
            if (underService ?? false)
              Positioned(
                bottom: -12,
                right: EdgeInsetsFoundation.horizontal16,
                child: UiKitCardWrapper(
                  color: context.uiKitTheme?.colorScheme.surface5,
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        S.current.UnderService,
                        style: regularTextTheme?.caption4Regular,
                      ),
                      SpacingFoundation.horizontalSpace4,
                      ImageWidget(
                        svgAsset: GraphicsFoundation.instance.svg.roadworks,
                        height: 16,
                        fit: BoxFit.fitHeight,
                      ),
                    ],
                  ).paddingSymmetric(
                    horizontal: EdgeInsetsFoundation.horizontal8,
                    vertical: EdgeInsetsFoundation.vertical4,
                  ),
                ),
              )
          ],
        ),
      ],
    );
  }
}
