import 'package:flutter/material.dart';
import 'package:shuffle_uikit/shuffle_uikit.dart';

class UiKitTagSelector extends StatelessWidget {
  final List<String> tags;
  final double maxHeight;
  final bool showTextField;

  // final ValueChanged<List<String>>? onTagsSelected;
  final ValueChanged<String>? onNotFoundTagCallback;
  final ValueChanged<String>? onRemoveTagCallback;

  late final TextEditingController controller = TextEditingController();

  // ..addListener(_onTypedTagName);
  // late final ValueNotifier<Set<String>> searchListNotifier = ValueNotifier(
  //     <String>{});
  late final ValueNotifier<Set<String>> selectedListNotifier = ValueNotifier(tags.toSet());

  // <String>{});

  // late final List<String> searchedList = List.empty(growable: true);

  // void _onTypedTagName() {
  //   final text = controller.text.trim();
  //   if (text.isEmpty) return;
  // searchListNotifier.value = tags
  //     .where((element) =>
  // !selectedListNotifier.value.contains(element) &&
  //     element.toLowerCase().contains(text.toLowerCase()))
  //     .toSet();
  // }

  UiKitTagSelector({
    Key? key,
    required this.tags,
     this.maxHeight = double.infinity,
     this.showTextField = true,
    this.onRemoveTagCallback,
    this.onNotFoundTagCallback,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final boldTextTheme = context.uiKitTheme?.boldTextTheme;

    return ValueListenableBuilder<Set<String>>(
        valueListenable: selectedListNotifier,
        builder: (context, selectedTags, child) => UiKitCardWrapper(
            color: ColorsFoundation.surface3,
            borderRadius: BorderRadiusFoundation.all16,
            border: const BorderSide(
              width: 1,
              color: Colors.white,
            ),
            child: Column(mainAxisSize: MainAxisSize.min, crossAxisAlignment: CrossAxisAlignment.stretch, children: [
              if (selectedTags.isNotEmpty)
                ConstrainedBox(
                    constraints: BoxConstraints(maxHeight: maxHeight),
                    child: SingleChildScrollView(
                        child: Wrap(
                      spacing: SpacingFoundation.horizontalSpacing8,
                      runSpacing: SpacingFoundation.verticalSpacing8,
                      children: selectedTags
                              .map<Widget>(
                                (e) => UiKitCompactTextCard(
                                  showRemoveButton: true,
                                  text: e,
                                  onTap: () {
                                    onRemoveTagCallback?.call(e);
                                  },
                                ),
                              )
                              .toList() ??
                          [],
                    )))
              else
                SizedBox(width: double.infinity,),
              if (showTextField)
              ConstrainedBox(
                  constraints: BoxConstraints(maxHeight: 40.h),
                  child: TextField(
                    scrollPadding: EdgeInsets.zero,
                    controller: controller,
                    style: boldTextTheme?.caption1Bold,
                    // maxLines: (selectedChips?.length ?? 0) + 1,
                    maxLines: 1,
                    onSubmitted: (string) {
                      if (string.replaceAll(RegExp(r'^[a-z0-9-]+$'), '').isEmpty) {
                        onNotFoundTagCallback?.call(string);
                      } else {
                        SnackBarUtils.show(message: 'allowed caracters are a-z, 0-9 and -', context: context);
                      }
                    },
                  ))
              // UiKitInputFieldWithChips(
              //     // onRemoveChip: onRemoveTagCallback,
              //     controller: controller,
              //     // selectedChips: selectedTags.toList(),
              //     onNotFoundTagCallback: onNotFoundTagCallback)
            ]).paddingAll(EdgeInsetsFoundation.all8))
        // SpacingFoundation.verticalSpace24,
        // ValueListenableBuilder(
        //   valueListenable: searchListNotifier,
        //   builder: (context, searchedTags, child) {
        //     return Wrap(
        //       spacing: SpacingFoundation.horizontalSpacing8,
        //       runSpacing: SpacingFoundation.verticalSpacing8,
        //       children: searchedTags
        //           .map<Widget>((e) =>
        //           UiKitCompactTextCard(
        //             text: e,
        //             onTap: () {
        //               controller.clear();
        //               if (selectedListNotifier.value.contains(e)) return;
        //               selectedListNotifier.value = {...selectedListNotifier.value, e};
        //               onTagsSelected?.call(selectedListNotifier.value.toList());
        //               if (searchListNotifier.value.contains(e)) {
        //                 final list = Set<String>.from(searchListNotifier.value,);
        //                 list.remove(e);
        //                 searchListNotifier.value = list;
        //               }
        //             },
        //           ))
        //           .toList(),
        //     );
        //   },
        // ),
        // ],
        );
  }
}
