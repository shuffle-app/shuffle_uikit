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
    double calculatedWidth = SizesFoundation.screenWidth;
    final boldTextTheme = context.uiKitTheme?.boldTextTheme;

    return Container(
      clipBehavior: Clip.hardEdge,
      decoration: BoxDecoration(
        color: ColorsFoundation.surface3,
        borderRadius: BorderRadiusFoundation.all24,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.max,
        children: [
          Expanded(
            flex: 3,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Center(
                  child: CircularAvatar(
                    avatarUrl: avatarUrl ?? '',
                    height: calculatedWidth * 0.1875,
                  ),
                ),
                SpacingFoundation.verticalSpace4,
                Text(
                  '@$userNickName',
                  style: boldTextTheme?.caption1Bold,
                  textAlign: TextAlign.center,
                ),
                SpacingFoundation.verticalSpace2,
                Text(
                  userName ?? '',
                  style: boldTextTheme?.caption1Bold
                      .copyWith(color: ColorsFoundation.darkNeutral900, fontWeight: FontWeight.w400, fontSize: 13.w),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ),
          SpacingFoundation.horizontalSpace8,
          Expanded(
            flex: 5,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              mainAxisSize: MainAxisSize.max,
              children: [
                Container(
                  height: calculatedWidth * 0.0875,
                  decoration:
                      BoxDecoration(gradient: GradientFoundation.findSomeoneGradient, borderRadius: BorderRadiusFoundation.all24),
                  child: Center(
                    child: Text(
                      '$userPoints points',
                      style: boldTextTheme?.caption1Bold.copyWith(fontSize: 13.w, color: Colors.black),
                    ),
                  ),
                ),
                SpacingFoundation.verticalSpace16,
                Center(
                  child: Text(
                    '${sameInterests} same interests',
                    style: boldTextTheme?.caption1Bold
                        .copyWith(fontSize: 13.w, color: ColorsFoundation.darkNeutral900, fontWeight: FontWeight.w500),
                    textAlign: TextAlign.center,
                  ),
                ),
                SpacingFoundation.verticalSpace16,
                SizedBox(
                  height: calculatedWidth * 0.08,
                  width: calculatedWidth,
                  child: context.smallButton(
                      data: BaseUiKitButtonData(onPressed: onMessage, text: 'Message', fit: ButtonFit.fitWidth)),
                ),
              ],
            ),
          ),
        ],
      ).paddingAll(EdgeInsetsFoundation.all16),
    );
  }
}
