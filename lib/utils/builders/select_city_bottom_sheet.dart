import 'package:flutter/material.dart';
import 'package:shuffle_uikit/shuffle_uikit.dart';

selectCityBottomSheet(
  BuildContext context, {
  ValueChanged<String>? onSelectCity,
  List<String?>? cites,
  String? selectedCity,
}) {
  final theme = context.uiKitTheme;
  final boldTextTheme = theme?.boldTextTheme;
  final itemCount = cites?.length ?? 1;
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
      isWidgetScrollable: true,
      topPadding: topPadding,
      child: Column(
        children: [
          Text(
            S.of(context).SelectCity,
            style: boldTextTheme?.subHeadline,
          ).paddingAll(EdgeInsetsFoundation.all16),
          if (cites == null || cites.isEmpty)
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
                // padding: EdgeInsets.only(bottom: MediaQuery.viewInsetsOf(context).bottom),
                itemCount: itemCount,
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () {
                      onSelectCity?.call(cites[index] ?? '');
                      context.pop();
                    },
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        if (index == 0)
                          Divider(thickness: 2.h, color: theme?.colorScheme.surface2).paddingOnly(
                            bottom: SpacingFoundation.verticalSpacing16,
                          ),
                        Row(
                          children: [
                            if (selectedCity != null && selectedCity.isNotEmpty)
                              UiKitRadio(
                                selected: cites[index] == selectedCity,
                              ).paddingOnly(right: SpacingFoundation.horizontalSpacing8),
                            Text(
                              cites[index] ?? '',
                              style: boldTextTheme?.caption1Medium,
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
                    ),
                  );
                },
              ).paddingSymmetric(vertical: SpacingFoundation.verticalSpacing16),
            )
        ],
      ),
    ),
  );
}
