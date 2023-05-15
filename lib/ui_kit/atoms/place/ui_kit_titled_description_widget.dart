import 'package:flutter/material.dart';
import 'package:shuffle_uikit/shuffle_uikit.dart';

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
    final textTheme = context.uiKitTheme?.boldTextTheme;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Text(
          title,
          style: textTheme?.caption1Medium.copyWith(
            color: ColorsFoundation.darkNeutral900,
          ),
        ),
        SpacingFoundation.verticalSpace4,
        Text(
          description,
          style: textTheme?.body.copyWith(
            color: ColorsFoundation.darkNeutral100,
          ),
        ),
      ],
    );
  }
}
