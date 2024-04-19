import 'package:flutter/material.dart';
import 'package:shuffle_uikit/shuffle_uikit.dart';

uiKitBottomsheetSelectorBuilder(BuildContext context, {required List<ListTile> widgets}) {
  final theme = context.uiKitTheme;
  final colorScheme = theme?.colorScheme;
  final TextEditingController searchController = TextEditingController();
  final List<ListTile> searchWidgets = List.from(widgets);

  return showUiKitGeneralFullScreenDialog(
      context,
      GeneralDialogData(
          topPadding: 0.4.sh,
          isWidgetScrollable: true,
          child: StatefulBuilder(
              builder: (context, setState) => ListView(
                    children: [
                      SpacingFoundation.verticalSpace16,
                      UiKitInputFieldRightIcon(
                        autofocus: true,
                        fillColor: colorScheme?.surface3,
                        hintText: S.of(context).Search.toUpperCase(),
                        controller: searchController,
                        icon: searchController.text.isEmpty
                            ? ImageWidget(
                                svgAsset: GraphicsFoundation.instance.svg.search,
                                color: colorScheme?.bodyTypography,
                              )
                            : null,
                        onIconPressed: () {
                          if (searchController.text.isNotEmpty) searchController.clear();
                          // context.pop();
                        },
                        onChanged: (value) {
                          setState(() {
                            if (value.isEmpty) {
                              searchWidgets.clear();
                              searchWidgets.addAll(widgets);
                            } else {
                              searchWidgets
                                  .removeWhere((element) => !((element.title as Text).data?.contains(value) ?? false));
                            }
                          });
                        },
                      ),
                      SpacingFoundation.verticalSpace16,
                      ...searchWidgets,
                    ],
                  ))));
}
