import 'package:flutter/material.dart';
import 'package:shuffle_uikit/shuffle_uikit.dart';

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
    return Builder(
      builder: (context) {
        final boldTextTheme = Theme.of(context).extension<UiKitThemeData>()?.boldTextTheme;
        final regularTextTheme = Theme.of(context).extension<UiKitThemeData>()?.regularTextTheme;
        return Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            RichText(
              text: TextSpan(
                children: [
                  TextSpan(
                    text: nickname,
                    style: boldTextTheme?.title2.copyWith(
                      color: Colors.white,
                    ),
                  ),
                  TextSpan(
                    text: '\nFollowers\n',
                    style: boldTextTheme?.caption1Medium.copyWith(
                      color: ColorsFoundation.solidGreyText,
                    ),
                  ),
                  TextSpan(
                    text: '2 650',
                    style: boldTextTheme?.title2.copyWith(
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
              textAlign: TextAlign.center,
            ),
            SpacingFoundation.verticalSpace12,
            GeneralPurposeButton(
              text: 'FOLLOW',
              onPressed: () {},
            ),
          ],
        );
      },
    );
  }
}
