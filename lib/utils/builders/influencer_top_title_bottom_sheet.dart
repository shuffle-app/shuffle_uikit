import 'package:flutter/material.dart';
import 'package:shuffle_uikit/shuffle_uikit.dart';

Future<void> influencerTopTitleBottomSheet(
  BuildContext context, {
  required TextEditingController controller,
  VoidCallback? onTap,
}) async {
  final theme = context.uiKitTheme;
  final topPadding = 1.sw <= 380 ? 0.5.sh : 0.45.sh;

  return showUiKitGeneralFullScreenDialog(
    context,
    GeneralDialogData(
      topPadding: topPadding,
      useRootNavigator: false,
      isWidgetScrollable: true,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          SpacingFoundation.verticalSpace16,
          Text(
            S.of(context).TitleYourTOP,
            style: theme?.boldTextTheme.subHeadline,
          ),
          SpacingFoundation.verticalSpacing32.heightBox,
          UiKitInputFieldNoIcon(
            minLines: 1,
            maxSymbols: 100,
            controller: controller,
            hintText: S.current.Title,
            fillColor: theme?.colorScheme.surface1,
          ),
          SpacingFoundation.verticalSpace24,
          Row(
            children: [
              Expanded(
                child: context.gradientButton(
                  data: BaseUiKitButtonData(
                    text: S.current.Save.toUpperCase(),
                    onPressed: onTap,
                  ),
                ),
              ),
            ],
          )
        ],
      ).paddingSymmetric(horizontal: SpacingFoundation.horizontalSpacing16),
    ),
  );
}
