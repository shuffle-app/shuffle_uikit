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
    final uiKitTheme = context.uiKitTheme;
    return Autocomplete<String>(
      initialValue: initialValue,
      fieldViewBuilder: (_, controller, focusNode, onSubmitted) => ListenableBuilder(
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
        child: ListView.separated(
          padding: EdgeInsets.zero,
          separatorBuilder: (_, __) =>
              Divider(height: 1, thickness: 1, color: uiKitTheme?.colorScheme.darkNeutral500.withOpacity(0.24)),
          itemCount: options.length,
          itemBuilder: (context, index) {
            final e = options.elementAt(index);
            return UiKitHoverAnimationTile(
              title: e,
              onTap: (title) {
                FocusManager.instance.primaryFocus?.unfocus();
                onFieldSubmitted?.call(title);
              },
            );
          },
        ),
      ).paddingOnly(right: 0.7.sw, bottom: 0.5.sw),
      optionsBuilder: (editingValue) async {
        if (editingValue.text == '') {
          if (showAllOptions) return options.call('');

          return const Iterable<String>.empty();
        }

        final Future<Iterable<String>> result = options.call(editingValue.text).then((options) {
          final ops = options.where((String option) {
            return option.toLowerCase().contains(editingValue.text.toLowerCase());
          });
          if (ops.isEmpty) {
            return [editingValue.text];
          } else {
            return ops;
          }
        });

        return result;
      },
    );
  }
}
