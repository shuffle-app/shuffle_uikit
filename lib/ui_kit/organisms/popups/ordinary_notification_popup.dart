import 'package:flutter/material.dart';
import 'package:shuffle_uikit/shuffle_uikit.dart';

class OrdinaryNotificationPopUp extends BaseNotificationPopup {
  final Widget? primaryActionWidget;
  final Widget? dismissActionWidget;

  const OrdinaryNotificationPopUp({
    Key? key,
    required NotificationPopupRequiredData requiredData,
    this.dismissActionWidget,
    this.primaryActionWidget,
  }) : super(
          key: key,
          requiredData: requiredData,
        );

  @override
  Widget build(BuildContext context) {
    final titleStyle = context.uiKitTheme?.boldTextTheme.body.copyWith(color: context.uiKitTheme?.colorScheme.inverseSurface);

    return BlurredCardWithBorder(
      border: requiredData.gradientBorder ? GradientFoundation.gradientBorder : null,
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
                      textAlign: requiredData.textAlign,
                    ),
              ),
            ],
          ),
          SpacingFoundation.verticalSpace8,
          primaryActionWidget ?? const SizedBox(),
          SpacingFoundation.verticalSpace8,
          dismissActionWidget ?? const SizedBox(),
        ],
      ),
    );
  }
}
