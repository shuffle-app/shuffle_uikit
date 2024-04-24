import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:shuffle_uikit/shuffle_uikit.dart';

class UiKitTagSelector extends StatelessWidget {
  final List<String> tags;
  final double maxHeight;
  final bool showTextField;
  final BorderRadius? borderRadius;
  final bool isDarkBackground;
  final ValueChanged<String>? onNotFoundTagCallback;
  final ValueChanged<String>? onRemoveTagCallback;
  final void Function(String)? onTagSelected;

  TextEditingController? controller;
  late final FocusNode focusNode = FocusNode()..addListener(_focusListener);

  // late final ValueNotifier<Set<String>> selectedListNotifier = ValueNotifier(tags.toSet());
  // late final ValueNotifier<bool> hasFocusNotifier = ValueNotifier(false);
  late final ValueNotifier<TagsSelectorUiModel> uiNotifier =
      ValueNotifier(TagsSelectorUiModel(tags: tags.toSet(), hasFocus: false));

  UiKitTagSelector({
    Key? key,
    required this.tags,
    this.maxHeight = double.infinity,
    this.showTextField = true,
    this.onRemoveTagCallback,
    this.onNotFoundTagCallback,
    this.onTagSelected,
    this.borderRadius,
    this.controller,
  })  : isDarkBackground = false,
        super(key: key) {
    controller ??= TextEditingController();
  }

  UiKitTagSelector.darkBackground({
    Key? key,
    required this.tags,
    this.maxHeight = double.infinity,
    this.showTextField = true,
    this.onRemoveTagCallback,
    this.onNotFoundTagCallback,
    this.onTagSelected,
    this.borderRadius,
    this.controller,
  })  : isDarkBackground = true,
        super(key: key) {
    controller ??= TextEditingController();
  }

  _focusListener() {
    uiNotifier.value = uiNotifier.value.copyWith(hasFocus: focusNode.hasFocus);
  }

  @override
  Widget build(BuildContext context) {
    final theme = context.uiKitTheme;
    final boldTextTheme = context.uiKitTheme?.boldTextTheme;

    return ValueListenableBuilder<TagsSelectorUiModel>(
      valueListenable: uiNotifier,
      builder: (context, uiModel, child) => UiKitCardWrapper(
        color: isDarkBackground ? theme?.colorScheme.primary : theme?.colorScheme.surface3,
        borderRadius: borderRadius ?? BorderRadiusFoundation.all16,
        border: uiModel.hasFocus
            ? BorderSide(
                width: 1,
                color: theme?.colorScheme.inversePrimary ?? Colors.white,
              )
            : null,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            if (uiModel.tags.isNotEmpty)
              ConstrainedBox(
                constraints: BoxConstraints(maxHeight: maxHeight, minHeight: 24.h),
                child: SingleChildScrollView(
                  child: Wrap(
                    spacing: SpacingFoundation.horizontalSpacing8,
                    runSpacing: SpacingFoundation.verticalSpacing8,
                    children: uiModel.tags
                        .map<Widget>(
                          (e) => UiKitCompactTextCard(
                            showRemoveButton: onRemoveTagCallback != null ? true : false,
                            text: e,
                            onTap: () {
                              onRemoveTagCallback?.call(e);
                              onTagSelected?.call(e);
                            },
                          ),
                        )
                        .toList(),
                  ),
                ),
              )
            else
              const SizedBox(width: double.infinity),
            if (showTextField)
              ConstrainedBox(
                constraints: BoxConstraints(maxHeight: kIsWeb ? 60 : 40.h, minHeight: kIsWeb ? 20 : 10.h),
                child: TextField(
                  focusNode: focusNode,
                  decoration: const InputDecoration.collapsed(hintText: ''),
                  scrollPadding: EdgeInsets.zero,
                  controller: controller,
                  style: boldTextTheme?.caption1Bold,
                  // maxLines: (selectedChips?.length ?? 0) + 1,
                  maxLines: 1,
                  onSubmitted: (string) {
                    if (string.replaceAll(RegExp(r'^[a-z0-9-]+$'), '').isEmpty) {
                      onNotFoundTagCallback?.call(string);
                    } else {
                      SnackBarUtils.show(
                        message: S.of(context).AllowedCaracters('a-z, 0-9 and -'),
                        context: context,
                      );
                    }
                  },
                ),
              ).paddingSymmetric(vertical: SpacingFoundation.verticalSpacing8),
          ],
        ).paddingAll(EdgeInsetsFoundation.all8),
      ),
    );
  }
}

class TagsSelectorUiModel {
  final Set<String> tags;
  final bool hasFocus;

  TagsSelectorUiModel({
    required this.tags,
    required this.hasFocus,
  });

  TagsSelectorUiModel copyWith({
    Set<String>? tags,
    bool? hasFocus,
  }) =>
      TagsSelectorUiModel(
        tags: tags ?? this.tags,
        hasFocus: hasFocus ?? this.hasFocus,
      );
}
