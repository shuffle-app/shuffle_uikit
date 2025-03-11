import 'package:flutter/material.dart';
import 'package:shuffle_uikit/shuffle_uikit.dart';

Future<void> influencerTopTitleBottomSheet(
  BuildContext context, {
  VoidCallback? onTap,
  ValueChanged<String>? onSelectTopTap,
  required ValueNotifier<String?> selectedItem,
  VoidCallback? onAddNewTap,
  ValueNotifier<List<String>>? tops,
}) async {
  final theme = context.uiKitTheme;
  final topPadding = ((1.sw <= 380 ? 0.54.sh : 0.6.sh) - (tops?.value.length ?? 0) * 0.08.sh);

  return showUiKitGeneralFullScreenDialog(
    context,
    GeneralDialogData(
      topPadding: topPadding > 0.0 ? topPadding : 0.0,
      useRootNavigator: false,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          SpacingFoundation.verticalSpace16,
          Text(
            S.of(context).YourTOPs,
            style: theme?.boldTextTheme.subHeadline,
          ),
          SpacingFoundation.verticalSpace16,
          Divider(thickness: 2.h, color: theme?.colorScheme.surface2),
          SpacingFoundation.verticalSpace16,
          GestureDetector(
            onTap: onAddNewTap,
            child: Row(
              children: [
                Expanded(
                  child: Text(
                    S.of(context).AddNew,
                    style: theme?.boldTextTheme.caption1Medium,
                  ),
                ),
                ImageWidget(
                  width: 13.w,
                  height: 13.w,
                  iconData: ShuffleUiKitIcons.plus,
                  color: theme?.colorScheme.inversePrimary,
                )
              ],
            ),
          ),
          SpacingFoundation.verticalSpace16,
          Divider(thickness: 2.h, color: theme?.colorScheme.surface2),
          if (tops != null && tops.value.isNotEmpty)
            ValueListenableBuilder(
              valueListenable: tops,
              builder: (_, tops, __) => ListView.builder(
                shrinkWrap: true,
                itemCount: tops.length,
                physics: NeverScrollableScrollPhysics(),
                itemBuilder: (context, index) => ValueListenableBuilder(
                  valueListenable: selectedItem,
                  builder: (_, selectedItem, __) => GestureDetector(
                    onTap: () => onSelectTopTap?.call(tops[index]),
                    child: Column(
                      children: [
                        Row(
                          children: [
                            UiKitRadio(selected: tops[index] == selectedItem),
                            SpacingFoundation.horizontalSpace8,
                            Expanded(
                              child: Text(
                                tops[index],
                                style: theme?.boldTextTheme.caption1Medium,
                              ),
                            ),
                          ],
                        ).paddingOnly(top: SpacingFoundation.verticalSpacing16),
                        Divider(thickness: 2.h, color: theme?.colorScheme.surface2).paddingOnly(
                          top: SpacingFoundation.verticalSpacing16,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          SpacingFoundation.verticalSpace24,
          Row(
            children: [
              Expanded(
                child: ValueListenableBuilder(
                  valueListenable: selectedItem,
                  builder: (_, selectedItem, __) => context.gradientButton(
                    data: BaseUiKitButtonData(
                      text: S.current.Save.toUpperCase(),
                      onPressed: (selectedItem != null && selectedItem.trim().isNotEmpty) ? onTap : null,
                    ),
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
