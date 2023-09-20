import 'package:flutter/material.dart';
import 'package:shuffle_uikit/shuffle_uikit.dart';

class UiKitTitledDescriptionWithDivider extends StatelessWidget {
  final String title;
  final List<String> description;
  final Axis direction;

  const UiKitTitledDescriptionWithDivider(
      {super.key, required this.title, required this.description, this.direction = Axis.vertical});

  @override
  Widget build(BuildContext context) {
    final titleTheme = context.uiKitTheme?.regularTextTheme;
    final textTheme = context.uiKitTheme?.boldTextTheme;

    return Column(mainAxisSize: MainAxisSize.min, crossAxisAlignment: CrossAxisAlignment.stretch, children: [
      Text(
        title,
        style: titleTheme?.labelLarge.copyWith(color: UiKitColors.darkNeutral900),
      ),
      if (direction == Axis.vertical) ...[
        for (String i in description) ...[
          Text(
            i,
            style: textTheme?.caption1Bold,
          ),
          if (description.indexOf(i) + 1 != description.length)
            const Divider(
              color: UiKitColors.darkNeutral500,
            ),
        ]
      ] else
        SizedBox(
            height: 18,
            child: ListView.separated(
              scrollDirection: direction,
              itemCount: description.length,
              itemBuilder: (context, index) => Text(
                description[index],
                style: textTheme?.caption1Bold,
              ),
              separatorBuilder: (context, index) => const VerticalDivider(
                color: UiKitColors.darkNeutral500,
              ),
            ))
    ]);
  }
}
