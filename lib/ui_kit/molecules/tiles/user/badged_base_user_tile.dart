import 'package:flutter/material.dart';
import 'package:shuffle_uikit/shuffle_uikit.dart';

class BadgedBaseUserTile extends StatelessWidget implements UserTileFactory {
  final Widget badge;
  final BaseUiKitUserTileData data;

  const BadgedBaseUserTile({
    Key? key,
    required this.badge,
    required this.data,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final boldTextTheme = context.uiKitTheme?.boldTextTheme;

    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        SpacingFoundation.verticalSpace24,
        Stack(
          fit: StackFit.passthrough,
          clipBehavior: Clip.none,
          children: [
            UiKitCardWrapper(
              color: context.uiKitTheme?.colorScheme.surface1,
              child: Row(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Container(
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.white.withOpacity(0.25),
                          blurRadius: 10,
                          spreadRadius: 0,
                          offset: Offset.zero,
                        ),
                      ],
                    ),
                    child: CircularAvatar(
                      avatarUrl: data.avatarUrl ?? '',
                      name: data.username,
                      height: 0.15.sw,
                    ),
                  ),
                  SpacingFoundation.horizontalSpace8,
                  Expanded(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Text(
                          data.name ?? '',
                          style: boldTextTheme?.subHeadline,
                        ),
                        SpacingFoundation.verticalSpace2,
                        Text(
                          data.username ?? '',
                          style: boldTextTheme?.body,
                        ),
                      ],
                    ),
                  ),
                ],
              ).paddingAll(EdgeInsetsFoundation.all16),
            ),
            Positioned(
              top: -24,
              right: 0,
              child: badge,
            ),
          ],
        ),
      ],
    );
  }
}
