import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:shuffle_uikit/shuffle_uikit.dart';

class UiKitDropDownList<T extends Object> extends StatelessWidget {
  final List<DropdownMenuItem<T>> items;
  final T? selectedItem;
  final void Function(T?)? onChanged;
  final double? width;
  final double? height;

  const UiKitDropDownList({
    super.key,
    required this.items,
    this.selectedItem,
    this.onChanged,
    this.width,
    this.height,
  });

  @override
  Widget build(BuildContext context) {
    final theme = context.uiKitTheme;
    final colorScheme = theme?.colorScheme;
    final boldTextTheme = theme?.boldTextTheme;

    return UiKitCardWrapper(
      borderRadius: BorderRadiusFoundation.all40,
      color: colorScheme?.surface1,
      width: width ?? 0.3.sw,
      height: height ?? 0.05.sh,
      child: DropdownButtonHideUnderline(
        child: DropdownButton2<T>(
          style: boldTextTheme?.caption1Medium.copyWith(overflow: TextOverflow.ellipsis),
          alignment: Alignment.bottomCenter,
          value: selectedItem,
          onChanged: onChanged,
          isExpanded: true,
          iconStyleData: IconStyleData(
            icon: ImageWidget(
              iconData: ShuffleUiKitIcons.chevrondown,
              color: colorScheme?.inverseSurface,
              fit: BoxFit.cover,
              width: 16,
              height: 16,
            ).paddingOnly(left: EdgeInsetsFoundation.horizontal8),
          ),
          items: items,
          dropdownStyleData: DropdownStyleData(
            width: width ?? 0.3.sw,
            elevation: 0,
            decoration: BoxDecoration(
              color: colorScheme?.surface1,
            ),
          ),
        ).paddingSymmetric(
          vertical: EdgeInsetsFoundation.vertical6,
          horizontal: EdgeInsetsFoundation.horizontal12,
        ),
      ),
    );
  }
}
