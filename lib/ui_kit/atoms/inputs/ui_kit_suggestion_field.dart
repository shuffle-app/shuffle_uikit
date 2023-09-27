import 'package:flutter/material.dart';
import 'package:shuffle_uikit/shuffle_uikit.dart';

class UiKitSuggestionField extends StatelessWidget {
  const UiKitSuggestionField({
    super.key,
    required this.options,
    this.hintText,
    this.fillColor,
    this.borderRadius,
    this.onFieldSubmitted,
  });

  final List<String> options;
  final String? hintText;
  final Color? fillColor;
  final BorderRadius? borderRadius;
  final VoidCallback? onFieldSubmitted;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (_, constraints) {
      return Autocomplete<String>(
        fieldViewBuilder: (_, controller, focusNode, onSubmitted) => UiKitInputFieldNoIcon(
          controller: controller,
          node: focusNode,
          hintText: hintText,
          fillColor: fillColor,
          borderRadius: borderRadius ?? BorderRadiusFoundation.max,
          onSubmitted: (_) {
            onSubmitted.call();
            onFieldSubmitted?.call();
          },
        ),
        optionsViewBuilder: (_, onSelected, options) => Align(
          alignment: Alignment.topLeft,
          child: SizedBox(
            width: constraints.maxWidth,
            child: Material(
              borderRadius: borderRadius ?? BorderRadiusFoundation.max,
              child: UiKitTagSelector(
                onTagSelected: onSelected,
                tags: options.toList(),
                showTextField: false,
              ),
            ),
          ),
        ),
        optionsBuilder: (editingValue) {
          if (editingValue.text == '') {
            return const Iterable<String>.empty();
          }

          return options.where((String option) {
            return option.contains(editingValue.text.toLowerCase());
          });
        },
      );
    });
  }
}
