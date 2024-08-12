import 'package:flutter/material.dart';
import 'package:shuffle_uikit/shuffle_uikit.dart';

class SubsOrUpsaleItem extends StatelessWidget {
  final String? titleOrPrice;
  final String? actualLimit;
  final String? limit;
  final String? description;
  final String? photoLink;
  final VoidCallback? removeItem;
  final Function()? onEdit;

  const SubsOrUpsaleItem({
    super.key,
    this.description,
    this.limit,
    this.titleOrPrice,
    this.photoLink,
    this.actualLimit,
    this.removeItem,
    this.onEdit,
  });

  @override
  Widget build(BuildContext context) {
    final theme = context.uiKitTheme;

    return SizedBox(
      width: 124.w,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Stack(
            alignment: Alignment.topRight,
            children: [
              GestureDetector(
                onTap: onEdit,
                child: UiKitCardWrapper(
                  width: 124.w,
                  borderRadius: BorderRadiusFoundation.all12,
                  child: ImageWidget(
                    height: 1.sw <= 380 ? 90.h : 60.h,
                    link: photoLink,
                    fit: BoxFit.fill,
                  ),
                ).paddingOnly(
                  top: 4,
                  right: 4,
                ),
              ),
              Container(
                decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                      color: theme?.colorScheme.surface ?? Colors.black,
                      spreadRadius: 8,
                      blurRadius: 7,
                      offset: Offset(0, 1.sw <= 380 ? 92.h : 62.h),
                    ),
                  ],
                ),
              ),
              Positioned(
                top: 0,
                right: 0,
                child: context.outlinedButton(
                  hideBorder: true,
                  data: BaseUiKitButtonData(
                    onPressed: removeItem,
                    iconInfo: BaseUiKitButtonIconData(
                      iconData: ShuffleUiKitIcons.x,
                      size: 12,
                    ),
                  ),
                ),
              ),
              if (limit != null && limit!.isNotEmpty)
                Positioned(
                  bottom: 4.h,
                  left: 4.w,
                  child: Text(
                    '${actualLimit ?? 0}/${limit!}',
                    style: theme?.boldTextTheme.caption3Medium,
                  ),
                )
            ],
          ),
          SpacingFoundation.verticalSpace2,
          Text(
            titleOrPrice ?? '',
            style: theme?.boldTextTheme.caption3Medium,
          ),
          SpacingFoundation.verticalSpace2,
          Text(
            description ?? '',
            style: theme?.regularTextTheme.caption4,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          ),
        ],
      ),
    );
  }
}
