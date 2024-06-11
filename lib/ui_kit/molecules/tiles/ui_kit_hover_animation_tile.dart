import 'package:flutter/material.dart';
import 'package:shuffle_uikit/shuffle_uikit.dart';

class UiKitHoverAnimationTile extends StatefulWidget {
  const UiKitHoverAnimationTile({
    super.key,
    required this.title,
    required this.onTap,
    this.isLast,
    this.isFirst,
  });

  final String title;
  final ValueChanged<String> onTap;
  final bool? isLast;
  final bool? isFirst;

  @override
  State<UiKitHoverAnimationTile> createState() =>
      _UiKitHoverAnimationTileState();
}

class _UiKitHoverAnimationTileState extends State<UiKitHoverAnimationTile> {
  bool isHover = false;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final uiKitTheme = context.uiKitTheme;

    return DecoratedBox(
      decoration: BoxDecoration(
        color: isHover
            ? ColorsFoundation.onHover.withOpacity(0.08)
            : uiKitTheme?.colorScheme.surface1,
        border: Border.symmetric(
          horizontal: BorderSide(
              color: ((widget.isFirst ?? false) || (widget.isLast ?? false))
                  ? Colors.transparent
                  : uiKitTheme?.colorScheme.darkNeutral500.withOpacity(0.24) ??
                      Colors.transparent),
        ),
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: () => widget.onTap.call(widget.title),
          onHover: (value) {
            setState(() {
              isHover = value;
            });
          },
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                widget.title,
                style: uiKitTheme?.regularTextTheme.body
                    .copyWith(color: uiKitTheme.colorScheme.bodyTypography),
              ),
              if (isHover)
                context.boxIconButton(
                  data: BaseUiKitButtonData(
                    onPressed: () {
                      widget.onTap.call(widget.title);
                    },
                    backgroundColor: ColorsFoundation.success.withOpacity(0.3),
                    iconInfo: BaseUiKitButtonIconData(
                        iconData: ShuffleUiKitIcons.plus,
                        color: ColorsFoundation.onHover,
                        size: 16.sp),
                  ),
                )
              else
                Icon(
                  ShuffleUiKitIcons.plus,
                  size: 16.sp,
                  color: Colors.transparent,
                ).paddingAll(EdgeInsetsFoundation.all6),
            ],
          ).paddingSymmetric(
              horizontal: EdgeInsetsFoundation.horizontal16,
              vertical: EdgeInsetsFoundation.vertical12),
        ),
      ),
    );
  }
}
