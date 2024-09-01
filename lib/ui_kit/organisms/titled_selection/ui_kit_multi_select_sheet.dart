import 'package:flutter/material.dart';
import 'package:shuffle_uikit/shuffle_uikit.dart';

class UiKitMultiSelectSheet<T> extends StatelessWidget {
  final String title;
  final List<MultiSelectSheetOption<T>> options;
  final ValueChanged<MultiSelectSheetOption<T>>? onSelectionChanged;

  const UiKitMultiSelectSheet({
    Key? key,
    required this.options,
    required this.title,
    this.onSelectionChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final boldTextTheme = context.uiKitTheme?.boldTextTheme;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          title,
          style: boldTextTheme?.subHeadline,
        ),
        SpacingFoundation.verticalSpace16,
        ...options.map(
          (option) {
            final isLast = options.last.value == option.value;
            return MultiSelectSheetTile(
              option: option,
              onSelectionChanged: (value) => onSelectionChanged?.call(option.copyWith(isSelected: value)),
            ).paddingOnly(bottom: isLast ? EdgeInsetsFoundation.zero : EdgeInsetsFoundation.vertical16);
          },
        )
      ],
    );
  }
}

class MultiSelectSheetTile<T> extends StatelessWidget {
  final MultiSelectSheetOption<T> option;
  final ValueChanged<bool> onSelectionChanged;

  const MultiSelectSheetTile({
    Key? key,
    required this.option,
    required this.onSelectionChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final boldTextTheme = context.uiKitTheme?.boldTextTheme;

    return Row(
      mainAxisSize: MainAxisSize.max,
      children: [
        UiKitCheckbox(
          isActive: option.isSelected,
          onChanged: () => onSelectionChanged(!option.isSelected),
        ),
        SpacingFoundation.horizontalSpace8,
        Flexible(
          child: GestureDetector(
            onTap: () => onSelectionChanged(!option.isSelected),
            child: Text(
              option.mask,
              style: boldTextTheme?.caption1UpperCaseMedium,
            ),
          ),
        ),
      ],
    );
  }
}

class MultiSelectSheetOption<T> {
  final String mask;
  final T value;
  final bool isSelected;

  MultiSelectSheetOption({
    required this.mask,
    required this.value,
    this.isSelected = false,
  });

  MultiSelectSheetOption<T> copyWith({
    String? mask,
    T? value,
    bool? isSelected,
  }) {
    return MultiSelectSheetOption<T>(
      mask: mask ?? this.mask,
      value: value ?? this.value,
      isSelected: isSelected ?? this.isSelected,
    );
  }
}
