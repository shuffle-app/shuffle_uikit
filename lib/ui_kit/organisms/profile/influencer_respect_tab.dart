import 'package:flutter/material.dart';
import 'package:shuffle_uikit/shuffle_uikit.dart';

class InfluencerRespectTab extends StatelessWidget {
  final List<ContentPreviewWithRespect> items;

  const InfluencerRespectTab({
    Key? key,
    required this.items,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final boldTextTheme = context.uiKitTheme?.boldTextTheme;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          S.current.PersonalRespect,
          style: boldTextTheme?.title1,
        ),
        SpacingFoundation.verticalSpace24,
        ListView.separated(
          physics: const NeverScrollableScrollPhysics(),
          padding: EdgeInsets.zero,
          shrinkWrap: true,
          separatorBuilder: (context, index) => SpacingFoundation.verticalSpace16,
          itemBuilder: (context, index) {
            final item = items[index];

            return UiKitRespectEventCard(
              images: item.images,
              title: item.title,
              respectFromUsers: item.respectFromUsers,
              properties: item.properties,
            );
          },
          itemCount: items.length,
        ),
      ],
    );
  }
}
