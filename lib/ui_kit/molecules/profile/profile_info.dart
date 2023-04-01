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
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        RichText(
          text: TextSpan(
            children: [
              TextSpan(
                text: nickname,
                style: Theme.of(context).textTheme.titleLarge,
              ),
              TextSpan(
                text: '\nFollowers\n',
                style: Theme.of(context).textTheme.labelSmall?.copyWith(
                      color: UiKitColors.solidGreyText,
                    ),
              ),
              TextSpan(
                text: '2 650',
                style: Theme.of(context).textTheme.titleLarge,
              ),
            ],
          ),
          textAlign: TextAlign.center,
        ),
        UiKitSpacing.verticalSpace12,
        GeneralPurposeButton(
          text: 'FOLLOW',
          onPressed: () {},
          color: Colors.white,
        ),
      ],
    );
  }
}
