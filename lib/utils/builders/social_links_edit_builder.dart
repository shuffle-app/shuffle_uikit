import 'package:flutter/material.dart';
import 'package:shuffle_uikit/shuffle_uikit.dart';

Future<List<String>> socialLinksEditBuilder(BuildContext context, {List<String> socialLinks = const []}) async {
  final theme = context.uiKitTheme;
  final TextEditingController instagramController = TextEditingController(
      text: socialLinks.firstWhere((link) => link.contains('instagram'),
          orElse: () => 'https://instagram.com/your_username'));
  final TextEditingController twitterController = TextEditingController(
      text: socialLinks.firstWhere((link) => link.contains('twitter'),
          orElse: () => 'https://twitter.com/your_username'));
  final TextEditingController whatsappController = TextEditingController(
      text: socialLinks.firstWhere((link) => link.contains('wa.me'), orElse: () => 'https://wa.me/your_phone_number'));
  final TextEditingController telegramController = TextEditingController(
      text: socialLinks.firstWhere((link) => link.contains('t.me'), orElse: () => 'https://t.me/your_username'));
  final controllers = [instagramController, twitterController, whatsappController, telegramController];

  return showUiKitGeneralFullScreenDialog(
    context,
    GeneralDialogData(
        topPadding: 0.4.sh,
        child: Column(
          children: [
            SpacingFoundation.horizontalSpace8,
            Text(
              'Edit links',
              style: theme?.boldTextTheme.subHeadline,
            ),
            SpacingFoundation.horizontalSpace16,
            for (var (index, controller) in controllers.indexed)
              UiKitInputFieldNoFill(
                contentPadding: EdgeInsets.symmetric(horizontal: SpacingFoundation.horizontalSpacing6),
                controller: controller,
                validator: (text) {
                  if (controller.text.isEmpty) {
                    return 'Please enter a link';
                  }
                  switch (index) {
                    case 0:
                      if (!controller.text.contains('instagram.com')) {
                        return 'Please enter a valid instagram link';
                      }
                      break;
                    case 1:
                      if (!controller.text.contains('twitter.com')) {
                        return 'Please enter a valid twitter link';
                      }
                      break;
                    case 2:
                      if (!controller.text.contains('wa.me')) {
                        return 'Please enter a valid whatsapp link';
                      }
                      break;
                    case 3:
                      if (!controller.text.contains('t.me')) {
                        return 'Please enter a valid telegram link';
                      }
                      break;
                  }
                  return null;
                },
                label: 'URL',
                prefixIcon: ImageWidget(
                  svgAsset: controller.text.icon,
                  color: theme?.colorScheme.inversePrimary,
                ),
              ).paddingOnly(bottom: SpacingFoundation.verticalSpacing16),
            context.gradientButton(
                data: BaseUiKitButtonData(
                    fit: ButtonFit.fitWidth,
                    text: S.current.Save,
                    onPressed: () {
                      context.pop(
                          result: [
                        telegramController.text,
                        instagramController.text,
                        twitterController.text,
                        whatsappController.text
                      ].where((element) => element.isNotEmpty).toList());
                    }))
          ],
        ).paddingSymmetric(horizontal: SpacingFoundation.horizontalSpacing16)),
  );
}
