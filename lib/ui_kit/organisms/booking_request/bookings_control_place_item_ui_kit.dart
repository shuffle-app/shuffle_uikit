import 'package:flutter/cupertino.dart';
import 'package:shuffle_uikit/shuffle_uikit.dart';

class BookingsControlPlaceItemUiKit extends StatelessWidget {
  final String? title;
  final String? imageUrl;
  final String? description;
  final VoidCallback? onTap;
  const BookingsControlPlaceItemUiKit({
    super.key,
    this.title,
    this.imageUrl,
    this.description,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final theme = context.uiKitTheme;

    return UiKitCardWrapper(
      borderRadius: BorderRadiusFoundation.all24r,
      color: theme?.colorScheme.surface1,
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          context.userAvatar(
            size: UserAvatarSize.x40x40,
            type: UserTileType.ordinary,
            userName: title ?? '',
            imageUrl: imageUrl,
          ),
          SpacingFoundation.horizontalSpace8,
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title ?? '',
                  style: theme?.boldTextTheme.caption1Bold,
                ),
                Text(
                  description ?? '',
                  style: theme?.boldTextTheme.caption1Medium.copyWith(color: ColorsFoundation.mutedText),
                ),
              ],
            ),
          ),
          SpacingFoundation.horizontalSpace8,
          SizedBox(
            width: 0.125.sw,
            height: 0.125.sw,
            child: context.button(
              data: BaseUiKitButtonData(
                onPressed: onTap,
                backgroundColor: theme?.colorScheme.surface3,
                iconInfo: BaseUiKitButtonIconData(
                  iconData: CupertinoIcons.chevron_forward,
                  color: theme?.colorScheme.headingTypography,
                  padding: 0,
                ),
              ),
            ),
          ),
        ],
      ).paddingAll(EdgeInsetsFoundation.all12),
    );
  }
}
