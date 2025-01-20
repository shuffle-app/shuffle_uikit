import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:shuffle_uikit/shuffle_uikit.dart';

class UiKitSuggestionField extends StatelessWidget {
  const UiKitSuggestionField({
    super.key,
    required this.options,
    this.hintText,
    this.allOptions,
    this.initialValue,
    this.fillColor,
    this.borderRadius,
    this.onFieldSubmitted,
    this.onTagSelected,
    this.showAllOptions = false,
  });

  final Future<List<String>> Function(String) options;
  final Iterable<String>? allOptions;
  final bool showAllOptions;
  final String? hintText;
  final TextEditingValue? initialValue;
  final Color? fillColor;
  final BorderRadius? borderRadius;
  final ValueChanged<String>? onFieldSubmitted;
  final ValueChanged<String>? onTagSelected;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (_, constraints) {
      return Autocomplete<String>(
        initialValue: initialValue,
        fieldViewBuilder: (_, controller, focusNode, onSubmitted) => UiKitInputFieldRightIcon(
          controller: controller,
          focusNode: focusNode,
          hintText: hintText,
          fillColor: fillColor,
          borderRadius: borderRadius ?? BorderRadiusFoundation.max,
          onIconPressed: () {
            controller.clear();
            onSubmitted.call();
            onFieldSubmitted?.call('');
          },
          onFieldSubmitted: (selection) {
            onSubmitted.call();
            onFieldSubmitted?.call(selection);
          },
        ),
        // onSelected: (String selection) {
        //   log('we selected $selection', name: 'UiKitSuggestionField');
        //   onFieldSubmitted?.call(selection);
        // },
        optionsViewBuilder: (_, onSelected, options) => Align(
          alignment: Alignment.topLeft,
          child: SizedBox(
            width: constraints.maxWidth,
            child: Material(
              borderRadius: borderRadius ?? BorderRadiusFoundation.max,
              child: UiKitTagSelector(
                onTagSelected: (option) {
                  log('we selected option $option', name: 'UiKitSuggestionField');
                  onSelected.call(option);
                  if (onTagSelected != null) {
                    onTagSelected?.call(option);
                  } else {
                    onFieldSubmitted?.call(option);
                  }
                },
                tags: options.toList(),
                showTextField: false,
              ),
            ),
          ),
        ),
        optionsBuilder: (editingValue) async {
          if (editingValue.text == '') {
            if (showAllOptions) return options.call('');

            return const Iterable<String>.empty();
          }

          final result = options.call(editingValue.text).then((options) {
            return options.where((String option) {
              return option.toLowerCase().contains(editingValue.text.toLowerCase());
            });
          });

          return result;
        },
      );
    });
  }
}
