import 'package:flutter/material.dart';
import 'package:shuffle_uikit/shuffle_uikit.dart';

class FillForFeedWidget extends StatelessWidget {
  final VoidCallback? onIconTap;
  final VoidCallback? onTapOutside;
  final bool isPinned;

  const FillForFeedWidget({
    super.key,
    this.onIconTap,
    this.isPinned = false,
    this.onTapOutside,
  });

  @override
  Widget build(BuildContext context) {
    final theme = context.uiKitTheme;

    return Positioned.fill(
      child: ClipRRect(
        borderRadius: BorderRadiusFoundation.all24,
        child: ColoredBox(
          color: ColorsFoundation.neutral48,
          child: Center(
            child: TapRegion(
              onTapOutside: (event) => onTapOutside?.call(),
              child: SizedBox(
                width: 60,
                height: 60,
                child: context.button(
                  data: BaseUiKitButtonData(
                    borderColor: theme?.colorScheme.headingTypography,
                    onPressed: onIconTap,
                    backgroundColor: theme?.colorScheme.surface3,
                    fit: ButtonFit.hugContent,
                    iconInfo: BaseUiKitButtonIconData(
                      padding: EdgeInsets.all(14),
                      iconPath: isPinned
                          ? GraphicsFoundation.instance.svg.pinnedOff.path
                          : GraphicsFoundation.instance.svg.pin.path,
                      color: theme?.colorScheme.headingTypography,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
