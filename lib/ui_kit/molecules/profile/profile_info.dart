import 'package:flutter/material.dart';
import 'package:shuffle_uikit/ui_kit_external.dart';

class ProfileInfo extends StatelessWidget {
  final String nickname;
  final int followers;

  const ProfileInfo({
    Key? key,
    required this.nickname,
    required this.followers,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final boldTextTheme = context.uiKitTheme?.boldTextTheme;
    final fallBackStyle = Theme.of(context).textTheme.bodyMedium;
    TextStyle? nickNameStyle = boldTextTheme?.bodyUpperCase ?? fallBackStyle;
    TextStyle? followersCountStyle = boldTextTheme?.title2 ?? fallBackStyle;
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        RichText(
          text: TextSpan(
            children: [
              TextSpan(
                text: nickname,
                style: nickNameStyle,
              ),
              TextSpan(
                text: '\nFollowers\n',
                style: boldTextTheme?.caption1Medium.copyWith(color: ColorsFoundation.darkNeutral900) ?? fallBackStyle,
              ),
              TextSpan(
                text: '2 650',
                style: followersCountStyle,
              ),
            ],
          ),
          textAlign: TextAlign.center,
        ),
        SpacingFoundation.verticalSpace12,
        context.button(
          text: 'FOLLOW',
          onPressed: () {},
        ),
      ],
    );
  }
}
