import 'package:flutter/material.dart';
import 'package:shuffle_uikit/shuffle_uikit.dart';

class RowWithAddPhoto extends StatelessWidget {
  final String link;
  final VoidCallback onPhotoDeleted;
  final VoidCallback onAddPhoto;

  const RowWithAddPhoto({
    super.key,
    this.link = '',
    required this.onPhotoDeleted,
    required this.onAddPhoto,
  });

  @override
  Widget build(BuildContext context) {
    final theme = context.uiKitTheme;

    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          S.of(context).Photo,
          style: theme?.regularTextTheme.labelSmall,
        ),
        SpacingFoundation.horizontalSpace8,
        link.isNotEmpty
            ? Stack(
                alignment: Alignment.topRight,
                children: [
                  UiKitCardWrapper(
                    borderRadius: BorderRadiusFoundation.all8,
                    child: ImageWidget(
                      height: 40.h,
                      link: link,
                    ),
                  ).paddingAll(8),
                  context.outlinedButton(
                    hideBorder: true,
                    data: BaseUiKitButtonData(
                      onPressed: onPhotoDeleted,
                      iconInfo: BaseUiKitButtonIconData(
                        iconData: ShuffleUiKitIcons.x,
                        size: 12,
                      ),
                    ),
                  ),
                ],
              )
            : Expanded(
                child: Text(
                  S.of(context).PleaseAddPhoto,
                  style: theme?.regularTextTheme.labelSmall.copyWith(
                    color: ColorsFoundation.error,
                  ),
                ),
              ),
        const Spacer(),
        context.outlinedButton(
          data: BaseUiKitButtonData(
            onPressed: onAddPhoto,
            iconInfo: BaseUiKitButtonIconData(
              iconData: ShuffleUiKitIcons.cameraplus,
              size: 15.h,
            ),
          ),
        )
      ],
    );
  }
}
