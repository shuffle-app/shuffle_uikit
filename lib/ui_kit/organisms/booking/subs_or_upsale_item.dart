import 'package:flutter/material.dart';
import 'package:shuffle_uikit/shuffle_uikit.dart';

class SubsOrUpsaleItem extends StatefulWidget {
  final String? titleOrPrice;
  final String? actualLimit;
  final String? limit;
  final String? description;
  final String? photoLink;
  final Function() removeItem;
  final Function()? onEdit;

  const SubsOrUpsaleItem({
    super.key,
    this.description,
    this.limit,
    this.titleOrPrice,
    this.photoLink,
    this.actualLimit,
    required this.removeItem,
    this.onEdit,
  });

  @override
  State<SubsOrUpsaleItem> createState() => _SubsOrUpsaleItemState();
}

class _SubsOrUpsaleItemState extends State<SubsOrUpsaleItem> {
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
                onTap: widget.onEdit,
                child: ShaderMask(
                  shaderCallback: (bounds) {
                    return LinearGradient(
                      colors: [theme?.colorScheme.primary ?? Colors.white, Colors.transparent],
                      stops: const [0.83, 1.0],
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                    ).createShader(bounds);
                  },
                  blendMode: BlendMode.dstIn,
                  child: UiKitCardWrapper(
                    width: 124.w,
                    borderRadius: BorderRadiusFoundation.all12,
                    child: ImageWidget(
                      height: 1.sw <= 380 ? 90.h : 60.h,
                      link: widget.photoLink,
                      fit: BoxFit.fill,
                    ),
                  ),
                ).paddingOnly(
                  top: 4,
                  right: 4,
                ),
              ),
              Positioned(
                top: 0,
                right: 0,
                child: context.outlinedButton(
                  hideBorder: true,
                  data: BaseUiKitButtonData(
                    onPressed: widget.removeItem,
                    iconInfo: BaseUiKitButtonIconData(
                      iconData: ShuffleUiKitIcons.x,
                      size: 12,
                    ),
                  ),
                ),
              ),
              if (widget.limit != null && widget.limit!.isNotEmpty)
                Positioned(
                  bottom: 4.h,
                  left: 4.w,
                  child: Text(
                    '${widget.actualLimit ?? 0}/${widget.limit!}',
                    style: theme?.boldTextTheme.caption3Medium,
                  ),
                )
            ],
          ),
          SpacingFoundation.verticalSpace2,
          Text(
            widget.titleOrPrice ?? '',
            style: theme?.boldTextTheme.caption3Medium,
          ),
          SpacingFoundation.verticalSpace2,
          Text(
            widget.description ?? '',
            style: theme?.regularTextTheme.caption4,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          ),
        ],
      ),
    );
  }
}
