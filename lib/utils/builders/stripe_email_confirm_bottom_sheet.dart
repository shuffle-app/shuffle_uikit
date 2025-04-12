import 'package:flutter/material.dart';
import 'package:shuffle_uikit/shuffle_uikit.dart';

stripeEmailConfirmBottomSheet(BuildContext context, {required TextEditingController emailController}) {
  final theme = context.uiKitTheme;
  final boldTextTheme = theme?.boldTextTheme;
  final bodyTextStyle = boldTextTheme?.subHeadline;
  final ValueNotifier<bool> selectedMoney = ValueNotifier(true);
  final ValueNotifier<bool> selectedCrypto = ValueNotifier(true);

  return showUiKitGeneralFullScreenDialog(
    context,
    GeneralDialogData(
      isWidgetScrollable: true,
      topPadding: .274.sw,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SpacingFoundation.verticalSpace16,
          Align(
              alignment: Alignment.center,
              child: Text(
                '${S.current.AcceptPayments} ${S.current.Online.toLowerCase()}',
                style: boldTextTheme?.title1,
                textAlign: TextAlign.center,
              )),
          SpacingFoundation.verticalSpace16,
          RichText(
              textAlign: TextAlign.center,
              softWrap: true,
              text: TextSpan(children: [
                TextSpan(text: '${S.current.WantTo} ', style: bodyTextStyle),
                WidgetSpan(
                    alignment: PlaceholderAlignment.baseline,
                    baseline: TextBaseline.alphabetic,
                    child: GradientableWidget(
                        gradient: GradientFoundation.defaultLinearGradient,
                        child: Text(
                          '${S.current.AcceptPayments.toLowerCase()} ',
                          style: bodyTextStyle?.copyWith(color: Colors.white),
                        ))),
                TextSpan(text: '${S.current.ForYourBooking.toLowerCase()} ', style: bodyTextStyle),
                WidgetSpan(
                    alignment: PlaceholderAlignment.baseline,
                    baseline: TextBaseline.alphabetic,
                    child: GradientableWidget(
                        gradient: GradientFoundation.defaultLinearGradient,
                        child: Text(
                          '${S.current.Online.toLowerCase()}?',
                          style: bodyTextStyle?.copyWith(color: Colors.white),
                        )))
              ])),
          SpacingFoundation.verticalSpace16,
          Text(
            S.current.YouNeedSelectMethods,
            style: theme?.regularTextTheme.body,
            textAlign: TextAlign.center,
            softWrap: true,
          ),
          SpacingFoundation.verticalSpace16,
          RichText(
              textAlign: TextAlign.center,
              softWrap: true,
              text: TextSpan(children: [
                TextSpan(text: '${S.current.If} ', style: bodyTextStyle),
                WidgetSpan(
                    alignment: PlaceholderAlignment.baseline,
                    baseline: TextBaseline.alphabetic,
                    child: GradientableWidget(
                        gradient: GradientFoundation.adBannerGradient,
                        child: Text(
                          '${S.current.Not.toLowerCase()}, ',
                          style: bodyTextStyle?.copyWith(color: Colors.white),
                        ))),
                TextSpan(text: '${S.current.Just.toLowerCase()} ', style: bodyTextStyle),
                WidgetSpan(
                    alignment: PlaceholderAlignment.baseline,
                    baseline: TextBaseline.alphabetic,
                    child: GradientableWidget(
                        gradient: GradientFoundation.defaultLinearGradient,
                        child: Text(
                          '${S.current.Close.toLowerCase()} ',
                          style: bodyTextStyle?.copyWith(color: Colors.white),
                        ))),
                TextSpan(text: S.current.ThisBottom.toLowerCase(), style: bodyTextStyle),
              ])),
          SpacingFoundation.verticalSpace16,
          Row(
            children: [
              Transform.scale(
                scale: 1.22,
                child: AnimatedBuilder(
                  animation: selectedMoney,
                  builder: (context, _) => UiKitCheckbox(
                    isActive: selectedMoney.value,
                    onChanged: () {
                      selectedMoney.value = !selectedMoney.value;
                      if (!selectedMoney.value && !selectedCrypto.value) {
                        selectedCrypto.value = true;
                      }
                    },
                  ),
                ),
              ),
              SpacingFoundation.horizontalSpace12,
              Text(
                S.current.ForMoney,
                style: boldTextTheme?.labelLarge,
              ),
            ],
          ),
          SpacingFoundation.verticalSpace16,
          Row(
            children: [
              Transform.scale(
                scale: 1.22,
                child: AnimatedBuilder(
                  animation: selectedCrypto,
                  builder: (context, _) => UiKitCheckbox(
                    isActive: selectedCrypto.value,
                    onChanged: () {
                      selectedCrypto.value = !selectedCrypto.value;
                      if (!selectedCrypto.value && !selectedMoney.value) {
                        selectedMoney.value = true;
                      }
                    },
                  ),
                ),
              ),
              SpacingFoundation.horizontalSpace12,
              Text(
                S.current.ForCrypto,
                style: boldTextTheme?.labelLarge,
              ),
            ],
          ),
          SpacingFoundation.verticalSpace16,
          Text(
            S.current.ConfirmOrEditX(S.current.Email.toLowerCase()),
            style: theme?.regularTextTheme.body,
          ),
          SpacingFoundation.verticalSpace16,
          UiKitInputFieldNoFill(
              controller: emailController, label: S.current.Email, keyboardType: TextInputType.emailAddress),
          SpacingFoundation.verticalSpace16,
          context.gradientButton(
            padding: EdgeInsets.symmetric(vertical: SpacingFoundation.verticalSpacing16),
            data: BaseUiKitButtonData(
              fit: ButtonFit.fitWidth,
              text: S.current.Go,
              onPressed: () => context.pop(result: true),
            ),
          )
        ],
      ).paddingSymmetric(horizontal: SpacingFoundation.horizontalSpacing16),
    ),
  ).then((v) {
    selectedMoney.dispose();
    selectedCrypto.dispose();
    return v;
  });
}
