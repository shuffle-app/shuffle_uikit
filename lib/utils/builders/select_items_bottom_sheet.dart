import 'package:flutter/material.dart';
import 'package:shuffle_uikit/shuffle_uikit.dart';

selectItemsBottomSheet(
  BuildContext context, {
  ValueChanged<String>? onSelectItem,
  List<String?>? items,
  String? selectedItem,
  String? title,
}) {
  final theme = context.uiKitTheme;
  final boldTextTheme = theme?.boldTextTheme;
  final itemCount = items?.length ?? 1;

  //TODO for big device
  final topPadding = itemCount <= 2
      ? 0.55.sh
      : itemCount <= 3
          ? 0.45.sh
          : itemCount <= 4
              ? 0.35.sh
              : 0.3.sh;

  return showUiKitGeneralFullScreenDialog(
    context,
    GeneralDialogData(
      isDismissible: true,
      isWidgetScrollable: true,
      topPadding: topPadding,
      child: Column(
        children: [
          Text(
            title ?? S.of(context).SelectCity,
            style: boldTextTheme?.subHeadline,
          ).paddingAll(EdgeInsetsFoundation.all16),
          if (items == null || items.isEmpty)
            Center(
              child: Text(
                S.of(context).NothingFound,
                style: boldTextTheme?.caption1Bold,
              ),
            )
          else
            Expanded(
              child: ListView.builder(
                shrinkWrap: true,
                physics: const BouncingScrollPhysics(parent: AlwaysScrollableScrollPhysics()),
                itemCount: itemCount,
                itemBuilder: (context, index) {
                  return InkWell(
                    borderRadius: BorderRadiusFoundation.all24,
                    onTap: () {
                      onSelectItem?.call(items[index] ?? '');
                      context.pop(result: items[index]);
                    },
                    child: Ink(
                        child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        if (index == 0)
                          Divider(thickness: 2.h, color: theme?.colorScheme.surface2).paddingOnly(
                            bottom: SpacingFoundation.verticalSpacing16,
                          ),
                        Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            if (selectedItem != null && selectedItem.isNotEmpty)
                              UiKitRadio(
                                selected: items[index] == selectedItem,
                              ).paddingOnly(right: SpacingFoundation.horizontalSpacing8),
                            Flexible(
                              child: Text(
                                items[index] ?? '',
                                style: boldTextTheme?.caption1Medium,
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                          ],
                        ),
                        Divider(thickness: 2.h, color: theme?.colorScheme.surface2).paddingOnly(
                          top: SpacingFoundation.verticalSpacing16,
                        ),
                      ],
                    ).paddingOnly(
                      bottom: SpacingFoundation.verticalSpacing16,
                      left: SpacingFoundation.horizontalSpacing16,
                      right: SpacingFoundation.horizontalSpacing16,
                    )),
                  );
                },
              ).paddingSymmetric(vertical: SpacingFoundation.verticalSpacing16),
            )
        ],
      ),
    ),
  );
}
