import 'package:flutter/material.dart';
import 'package:shuffle_uikit/shuffle_uikit.dart';

Future<void> influencerTopTitleBottomSheet(
  BuildContext context, {
  required TextEditingController controller,
  VoidCallback? onTap,
  VoidCallback? onSelectTopTap,
  bool showYourTops = false,
  ValueNotifier<String?>? selectedTitle,
}) async {
  final theme = context.uiKitTheme;
  final topPadding = showYourTops ? (1.sw <= 380 ? 0.4.sh : 0.35.sh) : (1.sw <= 380 ? 0.5.sh : 0.45.sh);

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
          if (selectedTitle != null)
            ValueListenableBuilder(
              valueListenable: selectedTitle,
              builder: (_, title, __) => UiKitInputFieldNoIcon(
                minLines: 1,
                maxSymbols: 100,
                controller: controller,
                hintText: S.current.Title,
                fillColor: theme?.colorScheme.surface1,
                enabled: !(title != null && title.isNotEmpty),
              ),
            )
          else
            UiKitInputFieldNoIcon(
              minLines: 1,
              maxSymbols: 100,
              controller: controller,
              hintText: S.current.Title,
              fillColor: theme?.colorScheme.surface1,
            ),
          SpacingFoundation.verticalSpace24,
          if (showYourTops && selectedTitle != null)
            GestureDetector(
              onTap: onSelectTopTap,
              child: UiKitCardWrapper(
                width: double.infinity,
                color: theme?.colorScheme.surface3,
                borderRadius: BorderRadiusFoundation.all24r,
                child: Row(
                  children: [
                    ValueListenableBuilder(
                      valueListenable: selectedTitle,
                      builder: (_, title, __) {
                        return Text(
                          (title != null && title.isNotEmpty) ? title : S.of(context).SelectTitle,
                          style: theme?.boldTextTheme.caption1Medium,
                        );
                      },
                    ),
                    const Spacer(),
                    ImageWidget(
                      iconData: ShuffleUiKitIcons.chevronright,
                      color: theme?.colorScheme.inversePrimary,
                    ),
                  ],
                ).paddingSymmetric(
                  vertical: SpacingFoundation.verticalSpacing14,
                  horizontal: SpacingFoundation.horizontalSpacing20,
                ),
              ).paddingOnly(top: SpacingFoundation.verticalSpacing16),
            ).paddingOnly(bottom: SpacingFoundation.verticalSpacing32),
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
