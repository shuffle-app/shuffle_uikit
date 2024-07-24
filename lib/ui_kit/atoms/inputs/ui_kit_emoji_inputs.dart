import 'dart:async';

import 'package:emoji_picker_flutter/emoji_picker_flutter.dart';
import 'package:flutter/foundation.dart' as foundation;
import 'package:flutter/material.dart';
import 'package:flutter_keyboard_visibility/flutter_keyboard_visibility.dart';
import 'package:shuffle_uikit/shuffle_uikit.dart';

class UiKitEmojiInputField extends StatefulWidget {
  final TextEditingController textEditingController;
  final Function() onSend;
  final FocusNode inputFieldFocusNode;

  const UiKitEmojiInputField({
    super.key,
    required this.textEditingController,
    required this.onSend,
    required this.inputFieldFocusNode,
  });

  @override
  State<UiKitEmojiInputField> createState() => _UiKitEmojiInputFieldState();
}

class _UiKitEmojiInputFieldState extends State<UiKitEmojiInputField> {
  bool _showEmojiPicker = false;
  bool _showKeyboard = false;

  final _emojiTapRegion = '_emojiTapRegion';

  late final StreamSubscription<bool> keyboardSubscription;
  final KeyboardVisibilityController keyboardVisibilityController = KeyboardVisibilityController();

  @override
  void initState() {
    super.initState();

    keyboardSubscription = keyboardVisibilityController.onChange.listen((bool visible) {
      if (visible && _showKeyboard) _showEmojiPicker = false;
    });
  }

  @override
  void dispose() {
    keyboardSubscription.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = context.uiKitTheme;
    final colorScheme = theme?.colorScheme;

    return Column(
      children: [
        SpacingFoundation.verticalSpace12,
        Row(
          children: [
            Expanded(
              child: TapRegion(
                onTapOutside: (tap) {
                  setState(() {
                    _showKeyboard = false;
                  });
                },
                child: UiKitInputFieldRightIcon(
                  hintText: S.current.TypeHere,
                  fillColor: colorScheme?.surface3,
                  focusNode: widget.inputFieldFocusNode,
                  maxLines: 3,
                  onTap: () {
                    setState(() {
                      _showKeyboard = true;
                      _showEmojiPicker = false;
                    });
                  },
                  controller: widget.textEditingController,
                  icon: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      TapRegion(
                        groupId: _emojiTapRegion,
                        child: context.iconButtonNoPadding(
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
                      SpacingFoundation.horizontalSpace8,
                      GradientableWidget(
                        gradient: GradientFoundation.defaultRadialGradient,
                        child: context.iconButtonNoPadding(
                          data: BaseUiKitButtonData(
                            iconInfo: BaseUiKitButtonIconData(
                              iconData: ShuffleUiKitIcons.send,
                              size: 0.07.sw,
                              color: Colors.white,
                            ),
                            onPressed: () {
                              widget.inputFieldFocusNode.requestFocus();
                              widget.onSend();
                            },
                          ),
                        ),
                      ),
                      SpacingFoundation.horizontalSpace16,
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
        SpacingFoundation.verticalSpace12,
        if (_showEmojiPicker) ...[
          TapRegion(
            groupId: _emojiTapRegion,
            onTapOutside: (event) {
              setState(() {
                _showEmojiPicker = false;
              });
            },
            child: EmojiPicker(
              textEditingController: widget.textEditingController,
              config: Config(
                height: 0.3.sh,
                checkPlatformCompatibility: true,
                emojiViewConfig: EmojiViewConfig(
                  backgroundColor: Colors.transparent,
                  emojiSizeMax: 28 * (foundation.defaultTargetPlatform == TargetPlatform.iOS ? 1.15 : 1.0),
                ),
                swapCategoryAndBottomBar: false,
                categoryViewConfig: const CategoryViewConfig(
                  backgroundColor: Colors.transparent,
                  indicatorColor: UiKitColors.purple,
                  iconColorSelected: UiKitColors.purple,
                ),
                bottomActionBarConfig: BottomActionBarConfig(
                  backgroundColor: Colors.transparent,
                  buttonColor: Colors.transparent,
                  buttonIconColor: theme?.colorScheme.inversePrimary ?? Colors.white,
                ),
                searchViewConfig: SearchViewConfig(
                  backgroundColor: Colors.transparent,
                  buttonIconColor: theme?.colorScheme.inversePrimary ?? Colors.white,
                  hintText: '',
                  textStyle: theme?.regularTextTheme.caption1 ?? TextStyle(color: theme?.colorScheme.inversePrimary),
                ),
              ),
            ),
          ),
        ],
      ],
    );
  }
}
