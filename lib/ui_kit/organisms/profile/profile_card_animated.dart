import 'package:flutter/material.dart';
import 'package:shuffle_uikit/shuffle_uikit.dart';

class ProfileCardAnimated extends StatefulWidget {
  final Duration animationDuration;

  const ProfileCardAnimated({super.key, this.animationDuration = const Duration(milliseconds: 500)});

  @override
  State<ProfileCardAnimated> createState() => _ProfileCardAnimatedState();
}

class _ProfileCardAnimatedState extends State<ProfileCardAnimated> with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  final nickname = 'marywill';
  final name = 'Mary Williams';
  final avatarUrl = 'assets/images/png/profile_avatar.png';
  int followers = 5321;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
        lowerBound: 0.7,
        upperBound: 0.85,
        vsync: this,
        duration: Duration(milliseconds: (widget.animationDuration.inMilliseconds).floor()));
    _controller.addStatusListener(animationListener);
    _controller.forward();
  }

  void animationListener(AnimationStatus status) {
    if (status == AnimationStatus.completed) {
      _controller.reverse();
    } else if (status == AnimationStatus.dismissed) {
      setState(() {
        followers += 1;
      });
      _controller.forward();
    }
  }

  @override
  void dispose() {
    _controller.removeStatusListener(animationListener);
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(mainAxisSize: MainAxisSize.min, crossAxisAlignment: CrossAxisAlignment.stretch, children: <Widget>[
      Row(
        mainAxisSize: MainAxisSize.max,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          context.userAvatar(
              size: UserAvatarSize.x120x120, type: UserTileType.influencer, userName: name, imageUrl: avatarUrl),
          SpacingFoundation.horizontalSpace12,
          Expanded(
              child: PersonalProfileInfo(
            name: name,
            nickname: nickname,
            followers: followers,
            controller: _controller,
          )),
        ],
      ).paddingSymmetric(horizontal: EdgeInsetsFoundation.all16),
      SpacingFoundation.verticalSpace8,
      UiKitScaleAnimation(
        controller: _controller,
        scale: 0.3,
        child: context
            .button(data: BaseUiKitButtonData(text: S.of(context).Follow.toUpperCase(), onPressed: () {}))
            .paddingSymmetric(horizontal: EdgeInsetsFoundation.all16),
      )
    ]);
  }
}
