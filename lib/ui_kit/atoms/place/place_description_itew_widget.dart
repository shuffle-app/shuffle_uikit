import 'package:flutter/material.dart';
import 'package:shuffle_uikit/shuffle_uikit.dart';

class PlaceDescriptionItemWidget extends StatelessWidget {
  final PlaceDescriptionItem item;

  const PlaceDescriptionItemWidget({
    Key? key,
    required this.item,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final textStyle = context.uiKitTheme;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Text(
          item.title,
          style: textStyle?.boldTextTheme.caption1Medium.copyWith(
            color: ColorsFoundation.darkNeutral900,
          ),
        ),
        SpacingFoundation.verticalSpace4,
        Text(
          item.description,
          style: textStyle?.boldTextTheme.body.copyWith(
            color: ColorsFoundation.darkNeutral100,
          ),
        ),
      ],
    );
  }
}
