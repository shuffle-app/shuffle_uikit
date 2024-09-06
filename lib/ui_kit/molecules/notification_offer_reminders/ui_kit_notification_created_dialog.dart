import 'dart:ui';

import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:shuffle_uikit/shuffle_uikit.dart';

final group = AutoSizeGroup();

uiKitNotificationCreatedDialog({
  required BuildContext context,
  UiKitTag? cheap,
  String? placeTitle,
  String? placeImageUrl,
  String? iconPath,
  String? defaultNotificationImageUrl,
  String? notificationText,
  bool isNotification = true,
}) {
  final theme = context.uiKitTheme;

  return showGeneralDialog(
    context: context,
    transitionBuilder: (context, animation1, animation2, child) => BackdropFilter(
      filter: ImageFilter.blur(
        sigmaX: animation1.value * 10,
        sigmaY: animation1.value * 10,
      ),
      child: child,
    ),
    pageBuilder: (context, animation1, animation2) => FadeTransition(
      opacity: animation1,
      child: Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          UiKitCardWrapper(
            color: theme?.colorScheme.surface,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisSize: MainAxisSize.max,
              children: [
                Text(
                  S
                      .of(context)
                      .XSuccessfullyCreated(isNotification ? S.of(context).Notification : S.of(context).Reminder),
                  style: theme?.boldTextTheme.title2,
                  textAlign: TextAlign.center,
                ),
                SpacingFoundation.verticalSpace16,
                Text(
                  S.of(context).YouCanSeeYourXPromotionMenu(
                      (isNotification ? S.of(context).Notification : S.of(context).Reminder).toLowerCase()),
                  style: theme?.boldTextTheme.body,
                  textAlign: TextAlign.center,
                ),
                SpacingFoundation.verticalSpace16,
                Container(
                  height: 1.sw <= 380 ? 200.h : 155.h,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadiusFoundation.all24r,
                    boxShadow: [
                      BoxShadow(
                        color: theme?.colorScheme.inversePrimary.withOpacity(0.3) ?? Colors.white.withOpacity(0.3),
                        blurRadius: 10,
                        spreadRadius: 8,
                      )
                    ],
                    color: theme?.colorScheme.surface,
                    border: Border.all(color: Colors.white, width: 2.w),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SpacingFoundation.verticalSpace24,
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          context.userAvatar(
                            size: UserAvatarSize.x20x20,
                            type: UserTileType.ordinary,
                            userName: '',
                            imageUrl: placeImageUrl,
                          ),
                          SpacingFoundation.horizontalSpace12,
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                placeTitle ?? '',
                                style: theme?.boldTextTheme.caption2Bold,
                              ),
                              cheap?.widget ?? SpacingFoundation.none,
                            ],
                          )
                        ],
                      ),
                      SpacingFoundation.verticalSpace8,
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Flexible(
                            child: iconPath != null
                                ? ImageWidget(
                                    height: 45.h,
                                    fit: BoxFit.fill,
                                    link: iconPath,
                                  )
                                : context.userAvatar(
                                    size: UserAvatarSize.x40x40,
                                    type: UserTileType.ordinary,
                                    userName: '',
                                    imageUrl: defaultNotificationImageUrl,
                                  ),
                          ),
                          SpacingFoundation.horizontalSpace16,
                          Flexible(
                            flex: 3,
                            child: Text(
                              notificationText ?? '',
                              style: theme?.boldTextTheme.caption1Bold,
                            ),
                          ),
                        ],
                      ),
                      SpacingFoundation.verticalSpace16,
                      Row(
                        children: [
                          if (isNotification) ...[
                            Flexible(
                              child: context.smallOutlinedButton(
                                data: BaseUiKitButtonData(
                                  autoSizeGroup: group,
                                  text: S.of(context).ToFavorites,
                                  onPressed: () {},
                                ),
                              ),
                            ),
                            SpacingFoundation.horizontalSpace12,
                            Flexible(
                              child: context.smallOutlinedButton(
                                data: BaseUiKitButtonData(
                                  autoSizeGroup: group,
                                  text: S.of(context).OpenPlace,
                                  textColor: theme?.colorScheme.primary,
                                  backgroundColor: theme?.colorScheme.inversePrimary,
                                  onPressed: () {},
                                ),
                              ),
                            ),
                          ] else
                            Expanded(
                              child: context.smallOutlinedButton(
                                data: BaseUiKitButtonData(
                                  text: S.of(context).OhYeahSure,
                                  textColor: theme?.colorScheme.primary,
                                  backgroundColor: theme?.colorScheme.inversePrimary,
                                  onPressed: () {},
                                ),
                              ),
                            ),
                        ],
                      ),
                      SpacingFoundation.verticalSpace4,
                      Row(
                        children: [
                          Expanded(
                            child: context.smallOutlinedButton(
                              data: BaseUiKitButtonData(
                                text: isNotification ? S.of(context).SkipIt : S.of(context).HardToAnswer,
                                textColor: ColorsFoundation.mutedText,
                                borderColor: ColorsFoundation.mutedText,
                                onPressed: () {},
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ).paddingSymmetric(horizontal: SpacingFoundation.horizontalSpacing16),
                ),
              ],
            ).paddingAll(EdgeInsetsFoundation.all16),
          ),
          SpacingFoundation.verticalSpace12,
          context.button(
            data: BaseUiKitButtonData(
              fit: ButtonFit.fitWidth,
              text: S.of(context).Okay,
              onPressed: () {
                context.pop();
              },
            ),
          ),
        ],
      ).paddingSymmetric(horizontal: SpacingFoundation.horizontalSpacing16),
    ),
  );
}
