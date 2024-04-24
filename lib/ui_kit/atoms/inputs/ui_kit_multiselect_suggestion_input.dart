import 'package:flutter/material.dart';
import 'package:shuffle_uikit/shuffle_uikit.dart';

class UiKitMultiSelectSuggestionField extends StatelessWidget {
  const UiKitMultiSelectSuggestionField({
    super.key,
    required this.options,
    this.borderRadius,
    this.onOptionSelected,
    this.onOptionUnselected,
    this.initialOptions = const [],
  });

  final Future<List<String>> Function(String) options;
  final ValueChanged<String>? onOptionSelected;
  final ValueChanged<String>? onOptionUnselected;
  final BorderRadius? borderRadius;
  final List<String> initialOptions;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (_, constraints) {
      return Autocomplete<String>(
          fieldViewBuilder: (_, controller, focusNode, onSubmitted) =>
              UiKitInputFieldRightIcon(
                controller: controller,
                focusNode: focusNode,
                borderRadius: borderRadius ?? BorderRadiusFoundation.max,
                onFieldSubmitted: (selection) {
                  onSubmitted.call();
                  controller.clear();
                },
              ),
          optionsViewBuilder: (_, onSelected, options) {
            return Align(
              alignment: Alignment.topLeft,
              child: SizedBox(
                width: constraints.maxWidth,
                child: Material(
                  borderRadius: borderRadius ?? BorderRadiusFoundation.max,
                  child: UiKitTagSelector(
                    onTagSelected: (option) {
                      onOptionSelected?.call(option);
                    },
                    tags: options.toList(),
                    showTextField: false,
                  ),
                ),
              ),
            );
          },
          optionsBuilder: (editingValue) => options.call(editingValue.text));
    });
  }
}
