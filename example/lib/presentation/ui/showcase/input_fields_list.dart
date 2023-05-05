import 'package:flutter/material.dart';
import 'package:shuffle_uikit/shuffle_uikit.dart';

class InputFieldsList extends StatelessWidget {
  final TextEditingController controller;

  const InputFieldsList({
    Key? key,
    required this.controller,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        UiKitInputFieldRightIcon(
          controller: controller,
          hintText: 'PLACEHOLDER',
        ),
        SpacingFoundation.verticalSpace16,
        UiKitInputFieldRightIcon(
          controller: controller,
          hintText: 'PLACEHOLDER',
          enabled: false,
        ),
        SpacingFoundation.verticalSpace16,
        UiKitInputFieldRightIcon(
          controller: controller,
          hintText: 'PLACEHOLDER',
          enabled: true,
          validator: (value) {
            return 'Wrong symbols';
          },
        ),
        SpacingFoundation.verticalSpace16,
        UiKitInputFieldLeftIcon(
          controller: controller,
          hintText: 'PLACEHOLDER',
          enabled: true,
        ),
        SpacingFoundation.verticalSpace16,
        UiKitInputFieldLeftIcon(
          controller: controller,
          hintText: 'PLACEHOLDER',
          enabled: false,
        ),
        SpacingFoundation.verticalSpace16,
        UiKitInputFieldLeftIcon(
          controller: controller,
          hintText: 'PLACEHOLDER',
          enabled: true,
          validator: (value) {
            return 'Wrong symbols';
          },
        ),
        SpacingFoundation.verticalSpace16,
        UiKitInputFieldNoIcon(
          controller: controller,
          hintText: 'PLACEHOLDER',
        ),
        SpacingFoundation.verticalSpace16,
        UiKitInputFieldNoIcon(
          controller: controller,
          hintText: 'PLACEHOLDER',
          enabled: false,
        ),
        SpacingFoundation.verticalSpace16,
        UiKitInputFieldNoIcon(
          controller: controller,
          hintText: 'PLACEHOLDER',
          validator: (value) {
            return 'Wrong symbols';
          },
        ),
        SpacingFoundation.verticalSpace16,
        UiKitInputFieldNoIconCompact(
          controller: controller,
          hintText: 'PLACEHOLDER',
        ),
        SpacingFoundation.verticalSpace16,
        UiKitInputFieldNoIconCompact(
          controller: controller,
          enabled: false,
          hintText: 'PLACEHOLDER',
        ),
        SpacingFoundation.verticalSpace16,
        UiKitInputFieldNoIconCompact(
          controller: controller,
          hintText: 'PLACEHOLDER',
          validator: (value) {
            return 'Wrong symbols';
          },
        ),
        SpacingFoundation.verticalSpace16,
        UiKitInputFieldNoFill(
          label: 'Name',
          controller: controller,
          hintText: 'PLACEHOLDER',
        ),
        SpacingFoundation.verticalSpace16,
        UiKitInputFieldNoFill(
          label: 'Name',
          controller: controller,
          hintText: 'PLACEHOLDER',
          enabled: false,
        ),
        SpacingFoundation.verticalSpace16,
        UiKitInputFieldNoFill(
          label: 'Name',
          controller: controller,
          hintText: 'PLACEHOLDER',
          validator: (value) {
            return 'Wrong symbols';
          },
        ),
      ],
    );
  }
}
