import 'package:flutter/material.dart';
import 'package:shuffle_uikit/shuffle_uikit.dart';

class AdditionalActionNotificationPopUp extends BaseNotificationPopup {
  final Widget? primaryActionWidget;
  final Widget? secondaryActionWidget;
  final Widget? dismissActionWidget;
  const AdditionalActionNotificationPopUp({
    Key? key,
    required NotificationPopupRequiredData requiredData,
    this.primaryActionWidget,
    this.secondaryActionWidget,
    this.dismissActionWidget,
    bool? hasShadow,
  }) : super(
          key: key,
          requiredData: requiredData,
          hasShadow: hasShadow,
        );

  @override
  Widget build(BuildContext context) {
    final titleStyle = context.uiKitTheme?.boldTextTheme.body;

    return BlurredCardWithBorder(
      hasShadow: hasShadow,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Row(
            mainAxisSize: MainAxisSize.max,
            children: [
              requiredData.icon,
              SpacingFoundation.horizontalSpace12,
              Expanded(
                child: requiredData.customTitle ??
                    Text(
                      requiredData.titleString ?? '',
                      style: titleStyle,
                      textAlign: TextAlign.left,
                    ),
              ),
            ],
          ),
          Row(
            mainAxisSize: MainAxisSize.max,
            children: [
              Expanded(
                child: primaryActionWidget ?? const SizedBox(),
              ),
              SpacingFoundation.horizontalSpace8,
              Expanded(
                child: secondaryActionWidget ?? const SizedBox(),
              ),
            ],
          ),
          SpacingFoundation.verticalSpace8,
          dismissActionWidget ?? const SizedBox(),
        ],
      ),
    );
  }
}
