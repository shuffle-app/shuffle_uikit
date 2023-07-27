import 'package:flutter/material.dart';
import 'package:shuffle_uikit/shuffle_uikit.dart';

class UiKitFindSomeoneCard extends StatelessWidget {
  final String? avatarUrl;
  final String? userNickName;
  final String? userName;
  final int? userPoints;
  final int? sameInterests;
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
    double calculatedWidth = MediaQuery.of(context).size.width;
    final boldTextTheme = context.uiKitTheme?.boldTextTheme;

    return Material(
      color: ColorsFoundation.surface3,
      borderRadius: BorderRadiusFoundation.all24,
      clipBehavior: Clip.hardEdge,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    CircularAvatar(
                      avatarUrl: avatarUrl ?? '',
                      height: calculatedWidth * 0.2,
                    ),
                    Text(
                      '@$userNickName',
                      style: boldTextTheme?.caption2Bold,
                    ),
                    SpacingFoundation.verticalSpace4,
                    Text(
                      userName ?? '',
                      style: boldTextTheme?.caption2Bold
                          .copyWith(color: Colors.grey),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Container(
                      height: calculatedWidth * 0.12,
                      width: calculatedWidth * 0.8,
                      decoration: BoxDecoration(
                          gradient: GradientFoundation.findSomeoneGradient,
                          borderRadius: BorderRadiusFoundation.all24),
                      child: Center(
                        child: Text('$userPoints  points',
                            style: boldTextTheme?.caption2Bold
                                .copyWith(fontSize: 15.w, color: Colors.black)),
                      ),
                    ),
                    SpacingFoundation.verticalSpace12,
                    Center(
                      child: Text('${sameInterests} same interests',
                          style: boldTextTheme?.caption2Bold
                              .copyWith(fontSize: 15.w, color: Colors.grey)),
                    ),
                    SpacingFoundation.verticalSpace12,
                    context.button(
                        data: BaseUiKitButtonData(
                            onPressed: onMessage,
                            text: 'MESSAGE',
                            fit: ButtonFit.fitWidth)),
                  ],
                ),
              ),
            ],
          ),
        ],
      ).paddingSymmetric(vertical: 10, horizontal: 5),
    );
  }
}
