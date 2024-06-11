import 'package:flutter/material.dart';
import 'package:shuffle_uikit/shuffle_uikit.dart';

class PropertiesSearchInput extends StatelessWidget {
  const PropertiesSearchInput(
      {super.key,
      required this.options,
      required this.showAllOptions,
      this.hintText,
      this.initialValue,
      this.onFieldSubmitted,
      this.borderRadius,
      this.fillColor});

  final Future<List<String>> Function(String) options;
  final bool showAllOptions;
  final String? hintText;
  final TextEditingValue? initialValue;
  final ValueChanged<String>? onFieldSubmitted;
  final BorderRadius? borderRadius;
  final Color? fillColor;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        return Autocomplete<String>(
          initialValue: initialValue,
          fieldViewBuilder: (_, controller, focusNode, onSubmitted) =>
              ListenableBuilder(
            listenable: controller,
            builder: (context, child) {
              if (controller.text.isEmpty) {
                return UiKitInputFieldRightIcon(
                  borderRadius: BorderRadiusFoundation.all12,
                  icon: const Icon(ShuffleUiKitIcons.chevrondown),
                  controller: controller,
                  focusNode: focusNode,
                  hintText: S.current.SearchOrAddTag,
                  onFieldSubmitted: (selection) {
                    onSubmitted.call();
                  },
                );
              } else {
                return UiKitInputFieldRightIcon(
                  borderRadius: BorderRadiusFoundation.all12,
                  icon: const Icon(ShuffleUiKitIcons.chevronup),
                  controller: controller,
                  focusNode: focusNode,
                  hintText: S.current.SearchOrAddTag,
                  onFieldSubmitted: (selection) {
                    onSubmitted.call();
                  },
                );
              }
            },
          ),
          optionsViewBuilder: (_, onSelected, options) => UiKitCardWrapper(
            borderRadius: BorderRadiusFoundation.all12,
            color: context.uiKitTheme?.colorScheme.surface2,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: options.map(
                (e) {
                  return UiKitHoverAnimationTile(
                    isFirst: options.toList().indexOf(e) == 0,
                    isLast: options.toList().last == e,
                    title: e,
                    onTap: (title) {
                      onFieldSubmitted?.call(title);
                    },
                  );
                },
              ).toList(),
            ),
          ),
          optionsBuilder: (editingValue) async {
            if (editingValue.text == '') {
              if (showAllOptions) return options.call('');

              return const Iterable<String>.empty();
            }

            final result = options.call(editingValue.text).then((options) {
              return options.where((String option) {
                return option
                    .toLowerCase()
                    .contains(editingValue.text.toLowerCase());
              });
            });

            return result;
          },
        );
      },
    );
  }
}
