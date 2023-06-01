import 'package:flutter/material.dart';
import 'package:shuffle_uikit/shuffle_uikit.dart';

class UiKitTagSelector extends StatelessWidget {
  final List<String> tags;
  final ValueChanged<List<String>>? onTagsSelected;

  late final TextEditingController controller = TextEditingController()..addListener(_onTypedTagName);
  ValueNotifier<List<String>> searchListNotifier = ValueNotifier(List.empty(growable: true));
  ValueNotifier<List<String>> selectedListNotifier = ValueNotifier(List.empty(growable: true));

  List<String> searchedList = List.empty(growable: true);

  void _onTypedTagName() {
    final text = controller.text;
    if (text.isEmpty) return;
    searchListNotifier.value = tags
        .where((element) => !selectedListNotifier.value.contains(element) && element.toLowerCase().contains(text.toLowerCase()))
        .toList(growable: true);
  }

  UiKitTagSelector({
    Key? key,
    required this.tags,
    this.onTagsSelected,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        ValueListenableBuilder<List<String>>(
          valueListenable: selectedListNotifier,
          builder: (context, selectedTags, child) {
            return UiKitInputFieldWithChips(
              controller: controller,
              selectedChips: selectedTags,
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
                  .map<Widget>((e) => UiKitCompactTextCard(
                        text: e,
                        onTap: () {
                          if (selectedListNotifier.value.contains(e)) return;
                          selectedListNotifier.value = [...selectedListNotifier.value, e];
                          onTagsSelected?.call(selectedListNotifier.value);
                          if (searchListNotifier.value.contains(e)) {
                            final list = List<String>.from(searchListNotifier.value, growable: true);
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
