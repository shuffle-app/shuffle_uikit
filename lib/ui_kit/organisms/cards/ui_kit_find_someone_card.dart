import 'package:flutter/material.dart';
import 'package:shuffle_uikit/shuffle_uikit.dart';

class UiKitFindSomeoneCard extends StatelessWidget {
  final String? avatarUrl;
  final String? userNickName;
  final String? userName;

  final int? userPoints;
  final String? sameInterests;
  final VoidCallback? onMessage;

  const UiKitFindSomeoneCard({
    super.key,
    this.avatarUrl,
    this.userNickName,
    this.userName,
    this.userPoints,
    this.sameInterests,
    this.onMessage,
  });

  @override
  Widget build(BuildContext context) {
    final boldTextTheme = context.uiKitTheme?.boldTextTheme;

    return LayoutBuilder(
      builder: (context, size) {
        final calculatedHeight = size.maxWidth * 0.55;

        return Material(
          color: ColorsFoundation.surface3,
          borderRadius: BorderRadiusFoundation.all24,
          clipBehavior: Clip.hardEdge,
          child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Row(
                children: [
                  CircularAvatar(
                    avatarUrl: avatarUrl ?? '',
                    name: '',
                    height: calculatedHeight * 0.25,
                  ),
                  Expanded(
                    child: Text(
                      userNickName ?? '',
                    ),
                  ),
                  Expanded(
                    child: Text(
                      userName ?? '',
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  Container(
                    decoration: BoxDecoration(
                      gradient: GradientFoundation.attentionCard,
                    ),
                    child: Text(
                      userPoints.toString(),
                      style: boldTextTheme?.caption2Medium
                          .copyWith(color: ColorsFoundation.darkNeutral900),
                    ),
                  ),
                  const Spacer(),
                  GestureDetector(onTap: onMessage, child: Text('Message')),
                ],
              ),
            ],
          ).paddingAll(EdgeInsetsFoundation.all16),
        );
      },
    );
  }
}
