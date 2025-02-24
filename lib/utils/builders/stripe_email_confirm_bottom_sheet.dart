import 'package:flutter/material.dart';
import 'package:shuffle_uikit/shuffle_uikit.dart';

stripeEmailConfirmBottomSheet(BuildContext context, {required TextEditingController emailController}) {
  final bool isBigScreen = 1.sw > 380;
  final theme = context.uiKitTheme;
  final boldTextTheme = theme?.boldTextTheme;

  return showUiKitGeneralFullScreenDialog(
      context,
      GeneralDialogData(
          isWidgetScrollable: true,
          topPadding: isBigScreen ? 0.47.sh : 0.43.sh,
          child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            SpacingFoundation.verticalSpace16,
            Align(
                alignment: Alignment.center,
                child: Text(
                  'Stripe ${S.current.Account.toLowerCase()}',
                  style: boldTextTheme?.title1,
                  textAlign: TextAlign.center,
                )),
            SpacingFoundation.verticalSpace16,
            Text(
              S.current.RegistrationStripeExplanation,
              style: boldTextTheme?.subHeadline,
            ),
            SpacingFoundation.verticalSpace16,
            Text(
              S.current.ConfirmOrEditX(S.current.Email.toLowerCase()),
              style: theme?.regularTextTheme.body,
            ),
            UiKitInputFieldNoFill(
                controller: emailController, label: S.current.Email, keyboardType: TextInputType.emailAddress),
            SpacingFoundation.verticalSpace16,
            context.gradientButton(
                padding: EdgeInsets.symmetric(vertical: SpacingFoundation.verticalSpacing16),
                data: BaseUiKitButtonData(
                    fit: ButtonFit.fitWidth, text: S.current.Go, onPressed: () => context.pop(result: true)))
          ]).paddingSymmetric(horizontal: SpacingFoundation.horizontalSpacing16)));
}
