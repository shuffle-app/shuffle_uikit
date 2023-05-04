import 'package:flutter/material.dart';
import 'package:shuffle_uikit/ui_kit_external.dart';

class InputFieldsGrid extends StatelessWidget {
  final TextEditingController controller;

  const InputFieldsGrid({
    Key? key,
    required this.controller,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.max,
      children: [
        Expanded(
          child: Column(
            mainAxisSize: MainAxisSize.min,
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
            ],
          ),
        ),
        SpacingFoundation.horizontalSpace16,
        Expanded(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              UiKitInputFieldLeftIcon(
                controller: controller,
                hintText: 'PLACEHOLDER',
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
            ],
          ),
        ),
        SpacingFoundation.horizontalSpace16,
        Expanded(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
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
            ],
          ),
        ),
        SpacingFoundation.horizontalSpace16,
        Expanded(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
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
              )
            ],
          ),
        ),
        SpacingFoundation.horizontalSpace16,
        Expanded(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
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
              )
            ],
          ),
        ),
      ],
    );
  }
}
