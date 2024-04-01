import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:shuffle_uikit/shuffle_uikit.dart';

class UiKitMultiSelectSuggestionField extends StatefulWidget {
  const UiKitMultiSelectSuggestionField({
    super.key,
    required this.options,
    this.borderRadius,
    this.onOptionSelected,
    this.onOptionUnselected,
  });

  final Future<List<String>> Function(String) options;
  final ValueChanged<String>? onOptionSelected;
  final ValueChanged<String>? onOptionUnselected;
  final BorderRadius? borderRadius;

  @override
  State<UiKitMultiSelectSuggestionField> createState() => _UiKitMultiSelectSuggestionFieldState();
}

class _UiKitMultiSelectSuggestionFieldState extends State<UiKitMultiSelectSuggestionField> {
  List<String> selectedTags = [];

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (_, constraints) {
      return Autocomplete<String>(
        fieldViewBuilder: (_, controller, focusNode, onSubmitted) => UiKitTagSelector(
          borderRadius: widget.borderRadius,
          tags: selectedTags,
          onRemoveTagCallback: (tag) {
            setState(() {
              selectedTags.removeWhere((element) => element == tag);
            });
            widget.onOptionUnselected?.call(tag);
          },
        ),
        onSelected: (String selection) {
          log('we selected $selection', name: 'UiKitMultiSelectSuggestionField');
          setState(() {
            if (!selectedTags.contains(selection)) selectedTags.add(selection);
          });
          widget.onOptionSelected?.call(selection);
        },
        optionsViewBuilder: (_, onSelected, options) {
          log('We has options $options', name: 'UiKitMultiSelectSuggestionField');

          return Align(
            alignment: Alignment.topLeft,
            child: SizedBox(
              width: constraints.maxWidth,
              child: Material(
                borderRadius: widget.borderRadius ?? BorderRadiusFoundation.max,
                child: UiKitTagSelector(
                  onTagSelected: (option) {
                    log('we selected option $option', name: 'UiKitMultiSelectSuggestionField');
                    onSelected.call(option);
                  },
                  tags: options.toList(),
                  showTextField: false,
                ),
              ),
            ),
          );
        },
        optionsBuilder: (editingValue) async {
          if (editingValue.text == '') {
            return const Iterable<String>.empty();
          }

          return await widget.options.call(editingValue.text);
        },
      );
    });
  }
}
