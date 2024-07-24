import 'package:flutter/material.dart';
import 'package:shuffle_uikit/shuffle_uikit.dart';

class UiKitInputFieldWithChips extends StatelessWidget {
  // final void Function(String)? onRemoveChip;
  // final List<String>? selectedChips;
  final TextEditingController controller;
  final ValueChanged<String>? onNotFoundTagCallback;

  const UiKitInputFieldWithChips({
    super.key,
    // this.selectedChips,
    this.onNotFoundTagCallback,
    // this.onRemoveChip,
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    final boldTextTheme = context.uiKitTheme?.boldTextTheme;
    // final border = OutlineInputBorder(
    //   borderRadius: BorderRadiusFoundation.all16,
    //   borderSide: const BorderSide(
    //     width: 1,
    //     color: Colors.white,
    //   ),
    // );

    return TextField(
      controller: controller,
      style: boldTextTheme?.caption1Bold,
      // maxLines: (selectedChips?.length ?? 0) + 1,
      maxLines: 1,
      onSubmitted: onNotFoundTagCallback,
      // onTapOutside:
      //     kIsWeb ? (_) => onNotFoundTagCallback?.call(controller.text) : null,
      // decoration: InputDecoration(
      //   border: border,
      //   focusedBorder: border,
      //   enabledBorder: border,
      //   focusedErrorBorder: border,
      //   errorBorder: border,
      //   disabledBorder: border,
      //   enabled: true,
      //   filled: true,
      //   fillColor: ColorsFoundation.surface3,
      // prefixIconConstraints: BoxConstraints(
      //   maxWidth: 0.75.sw,
      // ),
      // ),
    );
  }
}
