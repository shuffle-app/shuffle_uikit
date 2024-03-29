import 'dart:math';

import 'package:flutter/material.dart';
import 'package:shuffle_uikit/shuffle_uikit.dart';

class UiKitExpansionTile extends StatefulWidget {
  final BaseUiKitButtonIconData leadingIconData;
  final String title;
  final List<Widget> children;
  final bool? initiallyExpanded;

  const UiKitExpansionTile({
    Key? key,
    required this.leadingIconData,
    required this.title,
    required this.children,
    this.initiallyExpanded,
  }) : super(key: key);

  @override
  State<UiKitExpansionTile> createState() => _UiKitExpansionTileState();
}

class _UiKitExpansionTileState extends State<UiKitExpansionTile> {
  late bool expanded = widget.initiallyExpanded ?? false;
  final animDuration = const Duration(milliseconds: 250);

  @override
  Widget build(BuildContext context) {
    final theme = context.uiKitTheme;
    final colorScheme = theme?.colorScheme;
    final boldTextTheme = theme?.boldTextTheme;

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
              ImageWidget(
                iconData: widget.leadingIconData.iconData,
                link: widget.leadingIconData.iconPath,
                color: colorScheme?.inverseSurface,
              ),
              SpacingFoundation.horizontalSpace12,
              Expanded(
                child: Text(
                  widget.title,
                  style: boldTextTheme?.title2,
                ),
              ),
              AnimatedContainer(
                duration: animDuration,
                transformAlignment: Alignment.center,
                transform: Transform.rotate(angle: expanded ? pi : 0).transform,
                child: ImageWidget(
                  iconData: ShuffleUiKitIcons.chevrondown,
                  color: colorScheme?.inverseSurface,
                ),
              ),
            ],
          ).paddingSymmetric(horizontal: EdgeInsetsFoundation.horizontal16),
          SpacingFoundation.verticalSpace16,
          AnimatedContainer(
            clipBehavior: Clip.hardEdge,
            color: colorScheme?.surface1,
            duration: animDuration,
            padding: EdgeInsets.symmetric(
              horizontal: EdgeInsetsFoundation.horizontal32,
              vertical: EdgeInsetsFoundation.vertical16,
            ),
            height: expanded ? widget.children.length * 72 : 0,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                ...widget.children
                    .map((e) => [
                          SpacingFoundation.verticalSpace16,
                          e,
                          SpacingFoundation.verticalSpace16,
                        ])
                    .expand((element) => element)
                    .toList(),
                const Divider(
                  height: 2,
                  thickness: 2,
                  color: ColorsFoundation.surface2,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
