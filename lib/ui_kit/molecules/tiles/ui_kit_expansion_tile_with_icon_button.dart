import 'dart:math';

import 'package:flutter/material.dart';
import 'package:shuffle_uikit/shuffle_uikit.dart';

class UiKitExpansionTileWithIconButton extends StatefulWidget {
  const UiKitExpansionTileWithIconButton({
    super.key,
    required this.title,
    this.onTap,
    required this.children,
    this.initiallyExpanded,
  });

  final String title;
  final VoidCallback? onTap;
  final List<PropertiesTypeAnimatedButton> children;
  final bool? initiallyExpanded;

  @override
  State<UiKitExpansionTileWithIconButton> createState() =>
      _UiKitExpansionTileWithIconButtonState();
}

class _UiKitExpansionTileWithIconButtonState
    extends State<UiKitExpansionTileWithIconButton> {
  late bool expanded = widget.initiallyExpanded ?? false;
  final animDuration = const Duration(milliseconds: 250);

  @override
  Widget build(BuildContext context) {
    final theme = context.uiKitTheme;
    final colorScheme = theme?.colorScheme;
    final regularTextTheme = theme?.regularTextTheme;
    return GestureDetector(
      onTap: () {
        setState(() {
          expanded = !expanded;
        });
      },
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Row(
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SpacingFoundation.horizontalSpace12,
              Expanded(
                child: Text(
                  widget.title,
                  style: regularTextTheme?.title2,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
              context.boxIconButton(
                data: BaseUiKitButtonData(
                  onPressed: widget.onTap,
                  backgroundColor: ColorsFoundation.primary200.withOpacity(0.3),
                  iconInfo:
                      BaseUiKitButtonIconData(iconData: ShuffleUiKitIcons
                          .plus,color: ColorsFoundation.primary200),
                ),
              ),
              SpacingFoundation.horizontalSpace16,
              AnimatedContainer(
                duration: animDuration,
                transformAlignment: Alignment.center,
                transform: Transform.rotate(angle: expanded ? pi : 0).transform,
                child: ImageWidget(
                  iconData: ShuffleUiKitIcons.chevrondown,
                  color: colorScheme?.darkNeutral900,
                ),
              ),
            ],
          ).paddingSymmetric(horizontal: EdgeInsetsFoundation.horizontal16),
          SpacingFoundation.verticalSpace16,
          AnimatedContainer(
            duration: animDuration,
            height: expanded ? widget.children.length * .06.sh : 0,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                ...widget.children
                    .map((e) => [
                          e,
                        ])
                    .expand((element) => element),
              ],
            ).paddingOnly(
                left: EdgeInsetsFoundation.horizontal32,
                right: EdgeInsetsFoundation.horizontal16),
          ),
        ],
      ),
    );
  }
}
