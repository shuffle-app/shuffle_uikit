import 'package:flutter/material.dart';
import 'package:shuffle_uikit/shuffle_uikit.dart';

class UserTileSpecialityAnimation extends StatefulWidget {
  const UserTileSpecialityAnimation({super.key});

  @override
  State<UserTileSpecialityAnimation> createState() => _UserTileSpecialityAnimationState();
}

class _UserTileSpecialityAnimationState extends State<UserTileSpecialityAnimation> with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(vsync: this, duration: const Duration(milliseconds: 4500), upperBound: 2.4);
    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final widgets = [
      context.userTile(
          data: BaseUiKitUserTileData(
              avatarUrl: GraphicsFoundation.instance.png.avatars.avatar1.path,
              username: 'stald',
              name: 'Sladge Hammer',
              type: UserTileType.influencer,
              speciality: 'Sport expert',
              showBadge: true)),
      context.userTile(
          data: BaseUiKitUserTileData(
              avatarUrl: GraphicsFoundation.instance.png.avatars.avatar4.path,
              username: 'toffy',
              name: 'Lidsley Toffy',
              speciality: 'Entertainment specialist',
              type: UserTileType.influencer,
              showBadge: true)),
      context.userTile(
          data: BaseUiKitUserTileData(
              avatarUrl: GraphicsFoundation.instance.png.avatars.avatar3.path,
              username: 'saisr',
              speciality: 'Coffee expert',
              name: 'Carter Sairis',
              type: UserTileType.influencer,
              showBadge: true))
    ];

    return AnimatedBuilder(
        animation: _controller,
        builder: (context, child) {
          return AnimatedSwitcher(
            duration: const Duration(milliseconds: 800),
            child: widgets[_controller.value.round()],
          );
        }).paddingOnly(bottom: SpacingFoundation.verticalSpacing4);
  }
}
