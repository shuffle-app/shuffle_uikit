import 'package:flutter/material.dart';
import 'package:shuffle_uikit/shuffle_uikit.dart';

selectedBranchOrPlaceBottomSheet(
  BuildContext context, {
  ValueChanged<String>? onSelectItem,
  List<BottomSheetItemUiModel?>? items,
  String? selectedItem,
  String? title,
}) {
  final theme = context.uiKitTheme;
  final boldTextTheme = theme?.boldTextTheme;
  final itemCount = items?.length ?? 1;
  final firstBranchIndex = items?.indexWhere((item) => item?.isBranch ?? false) ?? -1;

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
      isWidgetScrollable: true,
      topPadding: topPadding,
      child: Column(
        children: [
          Text(
            S.of(context).CreateLinkWith,
            style: boldTextTheme?.subHeadline,
          ).paddingOnly(
            top: SpacingFoundation.verticalSpacing16,
            left: SpacingFoundation.horizontalSpacing16,
            right: SpacingFoundation.horizontalSpacing16,
          ),
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
                  final item = items[index];

                  return Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      if (items.indexOf(item) == firstBranchIndex) ...[
                        Divider(thickness: 2.h, color: theme?.colorScheme.surface2).paddingOnly(
                          top: SpacingFoundation.verticalSpacing16,
                          left: SpacingFoundation.horizontalSpacing16,
                          right: SpacingFoundation.horizontalSpacing16,
                        ),
                        SpacingFoundation.verticalSpace16,
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              S.of(context).Branches,
                              style: boldTextTheme?.caption1Bold,
                            ).paddingSymmetric(horizontal: SpacingFoundation.horizontalSpacing16),
                          ],
                        ),
                      ],
                      if (index == 0 && !(items.indexOf(item) == firstBranchIndex))
                        Divider(thickness: 2.h, color: theme?.colorScheme.surface2).paddingOnly(
                          top: SpacingFoundation.verticalSpacing16,
                          left: SpacingFoundation.horizontalSpacing16,
                          right: SpacingFoundation.horizontalSpacing16,
                        ),
                      GestureDetector(
                        onTap: () {
                          onSelectItem?.call(items[index]?.title ?? '');
                          context.pop();
                        },
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            if (selectedItem != null && selectedItem.isNotEmpty)
                              UiKitRadio(
                                selected: item?.title == selectedItem,
                              ).paddingOnly(right: SpacingFoundation.horizontalSpacing8),
                            if (item?.image != null && !(item?.isBranch ?? false))
                              context
                                  .userAvatar(
                                    size: UserAvatarSize.x20x20,
                                    type: UserTileType.ordinary,
                                    imageUrl: item?.image,
                                    userName: '',
                                  )
                                  .paddingOnly(right: SpacingFoundation.horizontalSpacing8),
                            Flexible(
                              child: Text(
                                item?.title ?? '',
                                style: boldTextTheme?.caption1Medium,
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                          ],
                        ).paddingOnly(
                          top: SpacingFoundation.verticalSpacing24,
                          left: SpacingFoundation.horizontalSpacing16,
                          right: SpacingFoundation.horizontalSpacing16,
                        ),
                      ),
                    ],
                  );
                },
              ),
            )
        ],
      ),
    ),
  );
}

class BottomSheetItemUiModel {
  final String? title;
  final String? image;
  final bool isBranch;

  BottomSheetItemUiModel({
    this.title,
    this.image,
    this.isBranch = false,
  });
}
