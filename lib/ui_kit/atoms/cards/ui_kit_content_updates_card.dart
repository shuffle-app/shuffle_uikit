import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:shuffle_uikit/shuffle_uikit.dart';

class UiKitContentUpdatesCard extends StatelessWidget {
  final List<UiKitContentUpdateWidget> children;
  final String authorSpeciality;
  final String authorName;
  final String authorUsername;
  final String authorAvatarUrl;
  final UserTileType authorUserType;

  const UiKitContentUpdatesCard({
    Key? key,
    required this.children,
    required this.authorSpeciality,
    required this.authorName,
    required this.authorUsername,
    required this.authorAvatarUrl,
    required this.authorUserType,
  }) : super(key: key);

  double get overallHeight =>
      children.fold(0.0, (previousValue, element) => previousValue + element.height) +
      ((children.length + 2) * SpacingFoundation.verticalSpacing16) +
      0.125.sw +
      EdgeInsetsFoundation.vertical24;

  @override
  Widget build(BuildContext context) {
    final boldTextTheme = context.uiKitTheme?.boldTextTheme;
    final colorScheme = context.uiKitTheme?.colorScheme;

    return ConstrainedBox(
      constraints: BoxConstraints(
        minWidth: 1.sw - EdgeInsetsFoundation.horizontal32,
        maxWidth: 1.sw,
        maxHeight: overallHeight,
      ),
      child: Stack(
        clipBehavior: Clip.none,
        fit: StackFit.expand,
        children: [
          Container(
            width: 1.sw,
            height: overallHeight,
            clipBehavior: Clip.hardEdge,
            decoration: BoxDecoration(
              gradient: GradientFoundation.shunyGreyGradientInverted,
              borderRadius: BorderRadiusFoundation.all24,
            ),
            child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 50, sigmaY: 50),
            ),
          ),
          Column(
            children: [
              context.userTile(
                data: BaseUiKitUserTileData(
                  name: authorName,
                  username: authorUsername,
                  avatarUrl: authorAvatarUrl,
                  type: authorUserType,
                  noMaterialOverlay: true,
                ),
              ),
              SpacingFoundation.verticalSpace8,
              ...children.map((child) {
                final isLastChild = children.indexOf(child) == children.length - 1;

                if (!isLastChild) return child.paddingOnly(bottom: EdgeInsetsFoundation.vertical16);
                return child;
              }),
            ],
          ).paddingAll(EdgeInsetsFoundation.all16),
          Positioned(
            right: 0,
            bottom: -SpacingFoundation.verticalSpacing8,
            child: ClipRRect(
              borderRadius: BorderRadiusFoundation.max,
              child: BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 50, sigmaY: 50),
                child: ColoredBox(
                  color: ColorsFoundation.neutral16,
                  child: Text(
                    authorSpeciality,
                    style: boldTextTheme?.caption3Medium.copyWith(color: colorScheme?.darkNeutral100),
                  ).paddingSymmetric(
                    horizontal: EdgeInsetsFoundation.horizontal8,
                    vertical: EdgeInsetsFoundation.vertical4,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
