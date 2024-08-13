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
  final bool isSubs;

  const SubsOrUpsaleItem({
    super.key,
    this.description,
    this.limit,
    this.titleOrPrice,
    this.photoLink,
    this.actualLimit,
    this.removeItem,
    this.onEdit,
    this.isSubs = true,
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
                child: GradientableWidget(
                  blendMode: BlendMode.dstIn,
                  gradient: LinearGradient(
                    colors: [theme?.colorScheme.primary ?? Colors.white, Colors.transparent],
                    stops: const [0.80, 1.0],
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                  ),
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
            style: isSubs
                ? theme?.regularTextTheme.caption4.copyWith(
                    fontSize: 9.w,
                    fontWeight: FontWeight.w600,
                  )
                : theme?.boldTextTheme.caption3Medium,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
          SpacingFoundation.verticalSpace2,
          Text(
            description ?? '',
            style: theme?.regularTextTheme.caption4Regular,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          ),
        ],
      ),
    );
  }
}
