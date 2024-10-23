import 'package:flutter/material.dart';
import 'package:shuffle_uikit/shuffle_uikit.dart';
import 'package:auto_size_text/auto_size_text.dart';

//TODO
/// думаю стоит перенепсти этот виджет в компонентную библиотеку разобрав его на атомы
class UiKitExtendedInfluencerFeedbackCardWithoutBottom extends StatelessWidget {
  final String? title;
  final String? imageUrl;
  final List<UiKitTag>? tags;

  const UiKitExtendedInfluencerFeedbackCardWithoutBottom({
    super.key,
    this.title,
    this.imageUrl,
    this.tags,
  });

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, size) {
        final theme = context.uiKitTheme;
        final textTheme = theme?.boldTextTheme;
        final titleStyle = textTheme?.caption2Bold;
        final width = size.maxWidth;

        return Row(
          mainAxisSize: MainAxisSize.max,
          children: [
            ClipRRect(
              borderRadius: BorderRadiusFoundation.all12,
              child: ImageWidget(
                link: imageUrl,
                width: width * 0.27,
                height: (width * 0.27) * 0.75,
                fit: BoxFit.cover,
              ),
            ),
            SpacingFoundation.horizontalSpace10,
            Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  width: (size.maxWidth * 0.7) - SpacingFoundation.horizontalSpacing10,
                  child: AutoSizeText(
                    title ?? '',
                    style: titleStyle,
                  ),
                ),
                SpacingFoundation.verticalSpace2,
                if (tags != null && tags!.isNotEmpty)
                  SizedBox(
                    width: (size.maxWidth * 0.7) - SpacingFoundation.horizontalSpacing10,
                    child: SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: UiKitTagsWidget(baseTags: tags!),
                    ),
                  ),
              ],
            ),
          ],
        );
      },
    );
  }
}
