import 'package:flutter/material.dart';
import 'package:shuffle_uikit/shuffle_uikit.dart';

class PersonalProfileInfo extends StatelessWidget {
  final String nickname;
  final String? name;
  final int? followers;
  final VoidCallback? onFollow;

  const PersonalProfileInfo({
    Key? key,
    required this.nickname,
    this.name,
    this.followers,
    this.onFollow,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final boldTextTheme = context.uiKitTheme?.boldTextTheme;
    final fallBackStyle = Theme.of(context).textTheme.bodyMedium;
    TextStyle? nickNameStyle = boldTextTheme?.subHeadline ?? fallBackStyle;
    TextStyle? followersCountStyle = boldTextTheme?.title2 ?? fallBackStyle;

    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: name == null ? CrossAxisAlignment.stretch : CrossAxisAlignment.start,
      children: [
        RichText(
          text: TextSpan(
            children: [
              TextSpan(
                text: name ?? nickname,
                style: nickNameStyle,
              ),
              if (followers != null) ...[
                TextSpan(
                  text: '\nFollowers\n',
                  style: boldTextTheme?.caption1Medium.copyWith(color: ColorsFoundation.darkNeutral900) ?? fallBackStyle,
                ),
                TextSpan(
                  text: followers!.toString(),
                  style: followersCountStyle,
                )
              ] else
                TextSpan(
                  text: '\n@$nickname',
                  style: boldTextTheme?.body ?? fallBackStyle,
                )
            ],
          ),
          textAlign: name == null ? TextAlign.center : TextAlign.start,
        ),
        if (onFollow != null) ...[
          SpacingFoundation.verticalSpace12,
          context.smallButton(
            data: BaseUiKitButtonData(text: 'follow'.toUpperCase(), onPressed: onFollow),
          )
        ],
      ],
    );
  }
}
