import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:shuffle_uikit/shuffle_uikit.dart';

class UiKitTagSelector extends StatelessWidget {
  final List<String> tags;
  final double maxHeight;
  final bool showTextField;
  final BorderRadius? borderRadius;

  final ValueChanged<String>? onNotFoundTagCallback;
  final ValueChanged<String>? onRemoveTagCallback;
  final void Function(String)? onTagSelected;

  late final TextEditingController controller = TextEditingController();
  late final ValueNotifier<Set<String>> selectedListNotifier = ValueNotifier(tags.toSet());

  UiKitTagSelector({
    Key? key,
    required this.tags,
    this.maxHeight = double.infinity,
    this.showTextField = true,
    this.onRemoveTagCallback,
    this.onNotFoundTagCallback,
    this.onTagSelected,
    this.borderRadius,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = context.uiKitTheme;
    final boldTextTheme = context.uiKitTheme?.boldTextTheme;

    return ValueListenableBuilder<Set<String>>(
      valueListenable: selectedListNotifier,
      builder: (context, selectedTags, child) => UiKitCardWrapper(
        color: theme?.colorScheme.surface3,
        borderRadius: borderRadius ?? BorderRadiusFoundation.all16,
        border: const BorderSide(
          width: 1,
          color: Colors.white,
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
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
                constraints: BoxConstraints(maxHeight: kIsWeb ? 60 : 40.h),
                child: TextField(
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
              )
          ],
        ).paddingAll(EdgeInsetsFoundation.all8),
      ),
    );
  }
}
