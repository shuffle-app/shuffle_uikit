import 'package:flutter/material.dart';
import 'package:shuffle_uikit/shuffle_uikit.dart';

class LockedInfoCard extends StatelessWidget {
  final VoidCallback goToLogin;

  const LockedInfoCard({super.key, required this.goToLogin});

  @override
  Widget build(BuildContext context) {
    final theme = context.uiKitTheme;
    final boldTextTheme = theme?.boldTextTheme;

    return context.notificationPopUp(
      dismissActionWidget: context.smallOutlinedButton(
        gradient: GradientFoundation.attentionCard,
        data: BaseUiKitButtonData(text: S.current.LogIn, onPressed: goToLogin),
      ),
      requiredData: NotificationPopupRequiredData(
          gradientBorder: true,
          customTitle: Row(
            children: [
              Expanded(
                  child: Stack(children: [
                RichText(
                    textAlign: TextAlign.center,
                    text: TextSpan(children: [
                      TextSpan(
                          text: '${S.current.Locked}\n',
                          style: boldTextTheme?.title1.copyWith(color: theme?.colorScheme.inverseSurface)),
                      TextSpan(
                          text: S.current.LogInTo,
                          style: boldTextTheme?.subHeadline.copyWith(color: Colors.transparent)),
                      TextSpan(
                          text: ' ${S.current.ToUnlock}'.toLowerCase(),
                          style: boldTextTheme?.subHeadline.copyWith(color: theme?.colorScheme.inverseSurface)),
                    ])),
                GradientableWidget(
                    gradient: GradientFoundation.defaultRadialGradient,
                    child: RichText(
                        textAlign: TextAlign.center,
                        text: TextSpan(children: [
                          TextSpan(
                              text: '${S.current.Locked}\n',
                              style: boldTextTheme?.title1.copyWith(color: Colors.transparent)),
                          TextSpan(
                              text: S.current.LogInTo, style: boldTextTheme?.subHeadline.copyWith(color: Colors.white)),
                          TextSpan(
                              text: ' ${S.current.ToUnlock}'.toLowerCase(),
                              style: boldTextTheme?.subHeadline.copyWith(color: Colors.transparent)),
                        ])))
              ])),
              SpacingFoundation.horizontalSpace12,
              Transform.rotate(
                  angle: 0.2,
                  child: ImageWidget(
                    rasterAsset: GraphicsFoundation.instance.png.key,
                    height: 53,
                  ))
            ],
          ),
          icon: Transform.rotate(
              angle: -0.2,
              child: ImageWidget(
                rasterAsset: GraphicsFoundation.instance.png.lock,
                height: 53,
              ))),
    );
  }
}
