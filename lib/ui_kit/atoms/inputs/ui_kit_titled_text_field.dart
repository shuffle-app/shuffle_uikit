import 'package:flutter/material.dart';
import 'package:shuffle_uikit/shuffle_uikit.dart';

class UiKitTitledTextField extends StatelessWidget {
  const UiKitTitledTextField({
    super.key,
    required this.title,
    required this.controller,
    this.enabled = true,
    this.hintText,
    this.errorText,
    this.validator,
    this.focusNode,
    this.validationLetters,
  });

  final String title;
  final TextEditingController controller;
  final bool enabled;
  final FocusNode? focusNode;
  final String? hintText;
  final String? errorText;
  final String? validationLetters;
  final String? Function(String?)? validator;

  @override
  Widget build(BuildContext context) {
    final theme = context.uiKitTheme;

    return Column(
      children: [
        UiKitCardWrapper(
          color: theme?.colorScheme.surface1,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  SpacingFoundation.horizontalSpace12,
                  Text(title, style: theme!.boldTextTheme.labelLarge),
                ],
              ),
              SpacingFoundation.verticalSpace4,
              UiKitInputFieldNoIcon(
                controller: controller,
                validator: validator,
                node: focusNode,
                enabled: enabled,
                errorText: errorText,
                hintText: hintText,
                fillColor: theme.colorScheme.surface3,
                borderRadius: BorderRadiusFoundation.all24,
              ),
            ],
          ).paddingAll(EdgeInsetsFoundation.all4),
        ),
        if (validationLetters != null) ...[
          SpacingFoundation.verticalSpace2,
          Text(
            validationLetters!,
            style: theme.regularTextTheme.caption4,
          ),
        ]
      ],
    );
  }
}
