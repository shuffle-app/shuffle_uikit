import 'package:flutter/material.dart';
import 'package:shuffle_uikit/shuffle_uikit.dart';

class PersonalProfileInfo extends StatelessWidget {
  final String nickname;
  final String? name;
  final TextStyle? nicknameStyle;
  final TextStyle? nameStyle;
  final int? followers;
  final AnimationController? controller;

  const PersonalProfileInfo({
    super.key,
    required this.nickname,
    this.name,
    this.followers,
    this.controller,
    this.nicknameStyle,
    this.nameStyle,
  });

  @override
  Widget build(BuildContext context) {
    final theme = context.uiKitTheme;
    final boldTextTheme = theme?.boldTextTheme;
    final regularTextTheme = theme?.regularTextTheme;
    final fallBackStyle = Theme.of(context).textTheme.bodyMedium;
    TextStyle? nameTextStyle = nameStyle ?? boldTextTheme?.subHeadline ?? fallBackStyle;
    TextStyle? nickNameStyle =
        nicknameStyle ?? boldTextTheme?.caption1Medium.copyWith(color: theme?.colorScheme.darkNeutral500) ?? fallBackStyle;

    return Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: name == null ? CrossAxisAlignment.stretch : CrossAxisAlignment.start,
      children: [
        RichText(
          text: TextSpan(
            children: [
              TextSpan(
                text: name ?? nickname,
                style: nameTextStyle,
              ),
              TextSpan(
                text: '\n@$nickname',
                style: nickNameStyle,
              ),
            ],
          ),
          textAlign: name == null ? TextAlign.center : TextAlign.start,
        ),
        //TODO add Music Specialist

        if (controller != null && followers != null) ...[
          SpacingFoundation.verticalSpace8,
          GradientableWidget(
              gradient: GradientFoundation.defaultLinearGradient,
              child: Text('Music Specialist', style: boldTextTheme?.caption2Medium.copyWith(color: Colors.white))),
          SpacingFoundation.verticalSpace8,
          UiKitScaleAnimation(
            scale: 0.3,
            controller: controller!,
            alignment: Alignment.centerLeft,
            child: RichText(
              text: TextSpan(
                children: [
                  TextSpan(text: '${followers} ', style: boldTextTheme?.caption1Bold),
                  TextSpan(
                      text: S.of(context).Followers.toLowerCase(),
                      style: regularTextTheme?.caption1.copyWith(color: ColorsFoundation.mutedText)),
                ],
              ),
              textAlign: name == null ? TextAlign.center : TextAlign.start,
            ),
          )
        ]
      ],
    );
  }
}
