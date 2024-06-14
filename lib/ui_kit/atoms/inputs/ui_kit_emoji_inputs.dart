import 'package:emoji_picker_flutter/emoji_picker_flutter.dart';
import 'package:flutter/foundation.dart' as foundation;
import 'package:flutter/material.dart';
import 'package:shuffle_uikit/shuffle_uikit.dart';

class UiKitEmojiInputs extends StatefulWidget {
  const UiKitEmojiInputs({super.key});

  @override
  State<UiKitEmojiInputs> createState() => _UiKitEmojiInputsState();
}

class _UiKitEmojiInputsState extends State<UiKitEmojiInputs> {
  bool showEmojiPicker = false;
  final TextEditingController textEditingController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SpacingFoundation.verticalSpace12,
        UiKitInputFieldNoFill(
          controller: textEditingController,
          label: '',
        ),
        SpacingFoundation.verticalSpace12,
        TextButton(
          child: Text(
            'Show emoji picker',
            style: context.uiKitTheme?.regularTextTheme.title2,
          ),
          onPressed: () {
            setState(() {
              showEmojiPicker = !showEmojiPicker;
            });
          },
        ),
        showEmojiPicker
            ? EmojiPicker(
                onEmojiSelected: (Category? category, Emoji emoji) {},
                onBackspacePressed: () {},
                textEditingController: textEditingController,
                config: Config(
                  height: 256,
                  checkPlatformCompatibility: true,
                  emojiViewConfig: EmojiViewConfig(
                    emojiSizeMax: 28 * (foundation.defaultTargetPlatform == TargetPlatform.iOS ? 1.20 : 1.0),
                  ),
                  swapCategoryAndBottomBar: false,
                  skinToneConfig: const SkinToneConfig(),
                  categoryViewConfig: const CategoryViewConfig(),
                  bottomActionBarConfig: const BottomActionBarConfig(),
                  searchViewConfig: const SearchViewConfig(),
                ),
              )
            : SpacingFoundation.none,
      ],
    );
  }
}
