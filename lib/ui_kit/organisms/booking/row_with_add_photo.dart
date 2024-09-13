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
        SpacingFoundation.horizontalSpace12,
        Builder(
          builder: (context) => GestureDetector(
            onTap: () => showUiKitPopover(
              context,
              customMinHeight: 30.h,
              showButton: false,
              title: Text(
                S.of(context).SupportedFormatsBooking,
                style: theme?.regularTextTheme.body.copyWith(color: Colors.black87),
                textAlign: TextAlign.center,
              ),
            ),
            child: ImageWidget(
              iconData: ShuffleUiKitIcons.info,
              width: 20.w,
              color: theme?.colorScheme.darkNeutral900,
            ),
          ),
        ),
        SpacingFoundation.horizontalSpace8,
        if (link.isNotEmpty) ...[
          Stack(
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
          ),
        ],
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
