import 'package:flutter/material.dart';
import 'package:shuffle_uikit/shuffle_uikit.dart';

class BoxIconButton extends StatefulWidget implements ButtonFactory {
  final Widget? icon;
  final BaseUiKitButtonIconData? iconInfo;
  final VoidCallback? onPressed;
  final Color? backgroundColor;
  final bool? initialValue;
  final bool? isSelectable;

  const BoxIconButton({
    super.key,
    this.icon,
    this.iconInfo,
    this.onPressed,
    this.backgroundColor,
    this.initialValue,
    this.isSelectable,
  }) : assert(iconInfo != null || icon != null,
            'Either iconInfo or icon must be provided');

  @override
  State<BoxIconButton> createState() => _BoxIconButtonState();

  @override
  Widget build(BuildContext context) {
    return this;
  }
}

class _BoxIconButtonState extends State<BoxIconButton> {
  late bool isSelectable;
  late bool isSelected;

  @override
  void initState() {
    isSelectable = widget.isSelectable ?? false;
    isSelected = widget.initialValue ?? false;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final theme = context.uiKitTheme;

    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: () {
          widget.onPressed;
          if (isSelectable) {
            setState(
              () {
                isSelected = !isSelected;
              },
            );
          }
        },
        borderRadius: BorderRadiusFoundation.all8,
        child: Ink(
          decoration: BoxDecoration(
            borderRadius: BorderRadiusFoundation.all8,
            color:isSelected? theme?.colorScheme.darkNeutral700 : (widget.backgroundColor ?? theme?.colorScheme.surface1),
          ),
          child: ImageWidget(
            iconData: widget.iconInfo?.iconData,
            link: widget.iconInfo?.iconPath,
            height: widget.iconInfo?.size,
            fit: BoxFit.fitHeight,
            color: widget.iconInfo?.color ?? theme?.colorScheme.inverseSurface,
          ).paddingAll(EdgeInsetsFoundation.all6),
        ),
      ),
    );
  }
}
