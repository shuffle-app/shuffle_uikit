import 'package:flutter/material.dart';
import 'package:shuffle_uikit/shuffle_uikit.dart';

class UiKitInputFilledWithTitle extends StatelessWidget {
  final String title;
  final String? hintText;
  final int? maxLines;
  final int? minLines;
  final TextEditingController controller;

  const UiKitInputFilledWithTitle({
    super.key,
    required this.title,
    this.hintText,
    this.maxLines,
    this.minLines, required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    final theme = context.uiKitTheme;
    final boldTextTheme = theme?.boldTextTheme;
    final regularTextTheme = theme?.regularTextTheme;
    final colorScheme = theme?.colorScheme;

    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Row(
          mainAxisSize: MainAxisSize.max,
          children: [
            Expanded(
              child: Text(
                title,
                style: regularTextTheme?.body
                    .copyWith(color: colorScheme?.bodyTypography),
              ),
            ),
            SpacingFoundation.horizontalSpace4,
          ],
        ),
        SpacingFoundation.verticalSpace4,
        UiKitInputFieldNoIcon(
          controller: controller,
          fillColor: colorScheme?.surface4,
          borderRadius: BorderRadiusFoundation.all12,
          hintText: hintText,
          minLines: minLines,
          maxLines: maxLines,
          cursorColor: colorScheme?.bodyTypography,
        ),
      ],
    ).paddingAll(EdgeInsetsFoundation.all16);
  }
}
