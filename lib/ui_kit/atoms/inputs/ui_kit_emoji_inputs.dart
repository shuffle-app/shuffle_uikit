import 'package:emoji_picker_flutter/emoji_picker_flutter.dart';
import 'package:flutter/foundation.dart' as foundation;
import 'package:flutter/material.dart';
import 'package:shuffle_uikit/shuffle_uikit.dart';

class UiKitEmojiInputs extends StatefulWidget {
  final TextEditingController textEditingController;
  final Function() onSend;

  const UiKitEmojiInputs({
    super.key,
    required this.textEditingController,
    required this.onSend,
  });

  @override
  State<UiKitEmojiInputs> createState() => _UiKitEmojiInputsState();
}

class _UiKitEmojiInputsState extends State<UiKitEmojiInputs> {
  bool _showEmojiPicker = false;

  @override
  Widget build(BuildContext context) {
    final theme = context.uiKitTheme;

    return Column(
      children: [
        SpacingFoundation.verticalSpace12,
        UiKitInputFieldRightIcon(
          controller: widget.textEditingController,
          icon: context.iconButtonNoPadding(
            data: BaseUiKitButtonData(
              iconInfo: BaseUiKitButtonIconData(
                iconData: ShuffleUiKitIcons.moodhappy,
              ),
              onPressed: () {
                setState(() {
                  _showEmojiPicker = !_showEmojiPicker;
                  FocusScope.of(context).requestFocus(FocusNode());
                });
              },
            ),
          ),
        ),
        SpacingFoundation.verticalSpace12,
        if (_showEmojiPicker) ...[
          EmojiPicker(
            onEmojiSelected: (Category? category, Emoji emoji) {},
            onBackspacePressed: () {},
            textEditingController: widget.textEditingController,
            config: Config(
              height: 0.3.sh,
              checkPlatformCompatibility: true,
              emojiViewConfig: EmojiViewConfig(
                backgroundColor: theme?.colorScheme.surface1 ?? Colors.white,
                emojiSizeMax: 28 *
                    (foundation.defaultTargetPlatform == TargetPlatform.iOS ? 1.20 : 1.0),
              ),
              swapCategoryAndBottomBar: false,
              skinToneConfig: const SkinToneConfig(
                dialogBackgroundColor: Colors.red,
              ),
              categoryViewConfig: CategoryViewConfig(
                backgroundColor: theme?.colorScheme.surface1 ?? Colors.white,
              ),
              bottomActionBarConfig: BottomActionBarConfig(
                backgroundColor: theme?.colorScheme.surface1 ?? Colors.white,
                buttonColor: Colors.transparent,
                buttonIconColor: theme?.colorScheme.inversePrimary ?? Colors.white,
              ),
              searchViewConfig: SearchViewConfig(
                backgroundColor: theme?.colorScheme.surface1 ?? Colors.white,
                buttonIconColor: theme?.colorScheme.inversePrimary ?? Colors.white,
                hintText: '',
              ),
            ),
          ),
        ],
      ],
    );
  }
}
