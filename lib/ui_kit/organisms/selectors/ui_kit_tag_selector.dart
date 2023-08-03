import 'package:flutter/material.dart';
import 'package:shuffle_uikit/shuffle_uikit.dart';

class UiKitTagSelector extends StatelessWidget {
  final List<String> tags;
  final ValueChanged<List<String>>? onTagsSelected;
  final ValueChanged<String>? onNotFoundTagCallback;

  late final TextEditingController controller = TextEditingController()
    ..addListener(_onTypedTagName);
  late final ValueNotifier<Set<String>> searchListNotifier = ValueNotifier(
      <String>{});
  late final ValueNotifier<Set<String>> selectedListNotifier = ValueNotifier(
      <String>{});

  late final List<String> searchedList = List.empty(growable: true);

  void _onTypedTagName() {
    final text = controller.text.trim();
    if (text.isEmpty) return;
    searchListNotifier.value = tags
        .where((element) =>
    !selectedListNotifier.value.contains(element) &&
        element.toLowerCase().contains(text.toLowerCase()))
        .toSet();
  }

  UiKitTagSelector({
    Key? key,
    required this.tags,
    this.onTagsSelected,
    this.onNotFoundTagCallback,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        ValueListenableBuilder<Set<String>>(
          valueListenable: selectedListNotifier,
          builder: (context, selectedTags, child) {
            return UiKitInputFieldWithChips(
              onRemoveChip: (title){
                final temp = selectedListNotifier.value;
                temp.remove(title);
                selectedListNotifier.value = temp;
              },
                controller: controller,
                selectedChips: selectedTags.toList(),
                onNotFoundTagCallback: onNotFoundTagCallback
            );
          },
        ),
        SpacingFoundation.verticalSpace24,
        ValueListenableBuilder(
          valueListenable: searchListNotifier,
          builder: (context, searchedTags, child) {
            return Wrap(
              spacing: SpacingFoundation.horizontalSpacing8,
              runSpacing: SpacingFoundation.verticalSpacing8,
              children: searchedTags
                  .map<Widget>((e) =>
                  UiKitCompactTextCard(
                    text: e,
                    onTap: () {
                      controller.clear();
                      if (selectedListNotifier.value.contains(e)) return;
                      selectedListNotifier.value = {...selectedListNotifier.value, e};
                      onTagsSelected?.call(selectedListNotifier.value.toList());
                      if (searchListNotifier.value.contains(e)) {
                        final list = Set<String>.from(searchListNotifier.value,);
                        list.remove(e);
                        searchListNotifier.value = list;
                      }
                    },
                  ))
                  .toList(),
            );
          },
        ),
      ],
    );
  }
}
