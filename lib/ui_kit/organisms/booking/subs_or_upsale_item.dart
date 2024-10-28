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
  late final bool actualLimitIsFull;
  final bool selectedItem;
  final bool isViewMode;

  SubsOrUpsaleItem({
    super.key,
    this.description,
    this.limit,
    this.titleOrPrice,
    this.photoLink,
    this.actualLimit,
    this.removeItem,
    this.onEdit,
    this.isSubs = true,
    this.selectedItem = false,
    this.isViewMode = false,
  }) {
    if (int.tryParse(actualLimit ?? '0') == int.tryParse(limit ?? '0')) {
      actualLimitIsFull = true;
    } else {
      actualLimitIsFull = false;
    }
  }

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
                child: DecoratedBox(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadiusFoundation.all12,
                    border: selectedItem ? GradientFoundation.gradientBorder : null,
                  ),
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
                      child: actualLimitIsFull && !selectedItem
                          ? Stack(
                              children: [
                                ImageWidget(
                                  width: 124.w,
                                  height: 0.28.sw,
                                  link: photoLink,
                                  fit: BoxFit.fill,
                                ),
                                DecoratedBox(
                                  decoration: BoxDecoration(
                                    color: ColorsFoundation.darkNeutral500.withOpacity(0.5),
                                  ),
                                  child: SizedBox(
                                    width: 124.w,
                                    height: 0.28.sw,
                                  ),
                                ),
                              ],
                            )
                          : ImageWidget(
                              height: 0.28.sw,
                              link: photoLink,
                              fit: BoxFit.cover,
                            ),
                    ).paddingAll(2),
                  ),
                ),
              ),
              if (removeItem != null)
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
                ),
              if (isViewMode)
                Positioned.fill(
                  child: ColoredBox(
                    color: theme?.colorScheme.primary.withOpacity(0.5) ?? Colors.black.withOpacity(0.5),
                  ),
                ),
            ],
          ),
          SpacingFoundation.verticalSpace2,
          Text(
            titleOrPrice ?? '',
            style: isSubs
                ? theme?.regularTextTheme.caption4.copyWith(
                    fontSize: 9.w,
                    fontWeight: FontWeight.w600,
                    color: (actualLimitIsFull && !selectedItem) || isViewMode ? ColorsFoundation.mutedText : null,
                  )
                : theme?.boldTextTheme.caption3Medium.copyWith(color: isViewMode ? ColorsFoundation.mutedText : null),
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
          SpacingFoundation.verticalSpace2,
          Text(
            description ?? '',
            style: theme?.regularTextTheme.caption4Regular.copyWith(
              color: (actualLimitIsFull && !selectedItem) || isViewMode ? ColorsFoundation.mutedText : null,
            ),
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          ),
        ],
      ),
    );
  }
}
