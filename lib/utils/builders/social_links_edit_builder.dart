import 'package:flutter/material.dart';
import 'package:shuffle_uikit/shuffle_uikit.dart';

socialLinksEditBuilder(
  BuildContext context, {
  List<String> socialLinks = const [],
  ValueChanged<List<String>>? onSave,
}) async {
  final theme = context.uiKitTheme;
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  final TextEditingController instagramController = TextEditingController(
    text: socialLinks.firstWhere(
      (link) => link.contains('instagram'),
      orElse: () => '',
    ),
  );
  final TextEditingController twitterController = TextEditingController(
    text: socialLinks.firstWhere(
      (link) => link.contains('twitter'),
      orElse: () => '',
    ),
  );
  final TextEditingController whatsappController = TextEditingController(
    text: socialLinks.firstWhere(
      (link) => link.contains('wa.me'),
      orElse: () => '',
    ),
  );
  final TextEditingController telegramController = TextEditingController(
    text: socialLinks.firstWhere(
      (link) => link.contains('t.me'),
      orElse: () => '',
    ),
  );
  final TextEditingController faceBookController = TextEditingController(
    text: socialLinks.firstWhere(
      (link) => link.contains('facebook'),
      orElse: () => '',
    ),
  );
  final controllers = [
    instagramController,
    twitterController,
    whatsappController,
    telegramController,
    faceBookController,
  ];

  final controllersPrefix = [
    'https://instagram.com/',
    'https://twitter.com/',
    'https://wa.me/',
    'https://t.me/',
    'https://facebook.com/',
  ];

  return showUiKitGeneralFullScreenDialog(
    context,
    GeneralDialogData(
      topPadding: 0.4.sh,
      child: Form(
        key: formKey,
        child: Column(
          children: [
            SpacingFoundation.verticalSpace16,
            Text(
              S.of(context).AddLink,
              style: theme?.boldTextTheme.subHeadline,
            ),
            SpacingFoundation.verticalSpace16,
            for (var (index, controller) in controllers.indexed)
              UiKitInputFieldNoFill(
                contentPadding: EdgeInsets.symmetric(horizontal: SpacingFoundation.horizontalSpacing6),
                controller: controller,
                inputFormatters: [PrefixFormatter(prefix: controllersPrefix[index])],
                validator: (text) {
                  final currentLink = text?.split('/').last;
                  if ((currentLink?.isEmpty ?? false) && (text?.isNotEmpty ?? false)) {
                    return S.of(context).PleaseEnterLink;
                  }

                  switch (index) {
                    case 0:
                      if (!controller.text.contains('instagram.com') && controller.text.isNotEmpty) {
                        return S.of(context).PleaseEnterValidXLink('instagram');
                      }
                      break;
                    case 1:
                      if (!controller.text.contains('twitter.com') && controller.text.isNotEmpty) {
                        return S.of(context).PleaseEnterValidXLink('twitter');
                      }
                      break;
                    case 2:
                      if (!controller.text.contains('wa.me') && controller.text.isNotEmpty) {
                        return S.of(context).PleaseEnterValidXLink('whatsapp');
                      }
                      break;
                    case 3:
                      if (!controller.text.contains('t.me') && controller.text.isNotEmpty) {
                        return S.of(context).PleaseEnterValidXLink('telegram');
                      }
                      break;
                    case 4:
                      if (!controller.text.contains('facebook') && controller.text.isNotEmpty) {
                        return S.of(context).PleaseEnterValidXLink('facebook');
                      }
                      break;
                  }
                  return null;
                },
                label: 'URL',
                prefixIcon: ImageWidget(
                  iconData: controllersPrefix[index].icon,
                  link: controllersPrefix[index].iconSvg,
                  color: theme?.colorScheme.inversePrimary,
                ),
              ).paddingOnly(bottom: SpacingFoundation.verticalSpacing16),
            context.gradientButton(
              data: BaseUiKitButtonData(
                fit: ButtonFit.fitWidth,
                text: S.current.Save,
                onPressed: () {
                  if (formKey.currentState?.validate() ?? false) {
                    onSave?.call([
                      telegramController.text,
                      instagramController.text,
                      twitterController.text,
                      whatsappController.text,
                      faceBookController.text,
                    ].where((element) {
                      if (element.isNotEmpty) {
                        final currentLink = element.split('/').last;
                        if (currentLink.isNotEmpty) {
                          return true;
                        }
                      }
                      return false;
                    }).toList());
                  }
                },
              ),
            )
          ],
        ).paddingSymmetric(horizontal: SpacingFoundation.horizontalSpacing16),
      ),
    ),
  );
}
