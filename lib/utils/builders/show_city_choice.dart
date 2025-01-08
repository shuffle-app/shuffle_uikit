import 'package:flutter/material.dart';
import 'package:shuffle_uikit/shuffle_uikit.dart';

void showCitiesOverlay({
  required BuildContext context,
  OverlayEntry? overlayEntry,
  ValueChanged<String>? onCityTapped,
  List<String> cities = const [],
  String? selectedCity,
}) {
  final theme = context.uiKitTheme;
  RenderBox renderBox = context.findRenderObject() as RenderBox;
  Offset position = renderBox.localToGlobal(Offset.zero);

  overlayEntry = OverlayEntry(
    builder: (context) => Positioned(
        top: (position.dy / 2) + 10.h,
        right: 10.w,
        child: Material(
          color: Colors.transparent,
          child: Container(
            decoration: BoxDecoration(
              color: theme?.colorScheme.surface5,
              borderRadius: BorderRadiusFoundation.all16,
              boxShadow: [
                BoxShadow(
                  color: Colors.white.withOpacity(0.3),
                  blurRadius: 5.0,
                  spreadRadius: 5.0,
                ),
              ],
            ),
            padding: EdgeInsets.symmetric(
              horizontal: SpacingFoundation.horizontalSpacing24,
              vertical: SpacingFoundation.verticalSpacing12,
            ),
            child: TapRegion(
              onTapOutside: (event) {
                hideCitiesOverlay(overlayEntry);
              },
              child: SizedBox(
                  height: 0.5.sh,
                  width: 150,
                  child: ListView(
                    shrinkWrap: true,
                    children: cities.map(
                      (city) {
                        return InkWell(
                          onTap: () {
                            onCityTapped?.call(city);
                            hideCitiesOverlay(overlayEntry);
                          },
                          child: Row(
                            children: [
                              Visibility(
                                visible: selectedCity == city,
                                maintainSize: true,
                                maintainAnimation: true,
                                maintainState: true,
                                child: const UiKitRadio(selected: true)
                                    .paddingOnly(right: SpacingFoundation.horizontalSpacing12),
                              ),
                              Text(
                                city,
                                style: theme?.boldTextTheme.labelLarge,
                              ),
                            ],
                          ).paddingSymmetric(vertical: SpacingFoundation.verticalSpacing12),
                        );
                      },
                    ).toList(),
                  )),
            ),
          ),
        )),
  );
  Overlay.of(context).insert(overlayEntry);
}

void hideCitiesOverlay(OverlayEntry? overlayEntry) {
  overlayEntry?.remove();
  overlayEntry = null;
}
