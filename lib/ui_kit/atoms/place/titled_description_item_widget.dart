import 'package:flutter/material.dart';
import 'package:shuffle_uikit/ui_kit_external.dart';

class UiKitTitledDescriptionWidget extends StatelessWidget {
  final String title;
  final String description;

  const UiKitTitledDescriptionWidget({
    Key? key,
    required this.title,
    required this.description,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final textStyle = context.uiKitTheme;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Text(
          title,
          style: textStyle?.boldTextTheme.caption1Medium.copyWith(
            color: ColorsFoundation.darkNeutral900,
          ),
        ),
        SpacingFoundation.verticalSpace4,
        Text(
          description,
          style: textStyle?.boldTextTheme.body.copyWith(
            color: ColorsFoundation.darkNeutral100,
          ),
        ),
      ],
    );
  }
}
