import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shuffle_uikit/ui_kit/atoms/place/place_description_itew_widget.dart';
import 'package:shuffle_uikit/ui_models/places/place_description_item.dart';

class PlaceDescriptionGrid extends StatelessWidget {
  final List<PlaceDescriptionItem> descriptionItems;
  final double spacing;

  const PlaceDescriptionGrid({
    Key? key,
    required this.descriptionItems,
    required this.spacing,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, size) {
        return Wrap(
          runSpacing: 24.h,
          spacing: spacing.w,
          children: descriptionItems
              .map(
                (e) => SizedBox(
                  width: size.maxWidth / 2 - spacing.w,
                  child: PlaceDescriptionItemWidget(item: e),
                ),
              )
              .toList(),
        );
      },
    );
  }
}
