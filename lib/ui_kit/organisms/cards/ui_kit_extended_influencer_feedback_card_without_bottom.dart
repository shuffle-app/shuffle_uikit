import 'package:flutter/material.dart';
import 'package:shuffle_uikit/shuffle_uikit.dart';
import 'package:auto_size_text/auto_size_text.dart';

//TODO
/// думаю стоит перенепсти этот виджет в компонентную библиотеку разобрав его на атомы
class UiKitExtendedInfluencerFeedbackCardWithoutBottom extends StatelessWidget {
  final String? title;
  final String? imageUrl;
  final List<UiKitTag>? tags;
  final DateTime? periodFrom;
  final DateTime? periodTo;
  final String? contentTitle;

  const UiKitExtendedInfluencerFeedbackCardWithoutBottom({
    super.key,
    this.title,
    this.imageUrl,
    this.tags,
    this.periodFrom,
    this.periodTo,
    this.contentTitle,
  });

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, size) {
        final theme = context.uiKitTheme;
        final textTheme = theme?.boldTextTheme;
        final titleStyle = textTheme?.caption2Bold;
        final width = size.maxWidth;

        return Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Row(
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
                    if (contentTitle != null && contentTitle!.isNotEmpty)
                      SizedBox(
                        width: (size.maxWidth * 0.7) - SpacingFoundation.horizontalSpacing10,
                        child: AutoSizeText(
                          contentTitle!,
                          style: textTheme?.caption2Bold.copyWith(color: ColorsFoundation.mutedText),
                          overflow: TextOverflow.ellipsis,
                          maxLines: 2,
                        ),
                      ),
                    if (tags != null && tags!.isNotEmpty)
                      SizedBox(
                        width: (size.maxWidth * 0.7) - SpacingFoundation.horizontalSpacing10,
                        child: SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: Row(
                            children: [
                              ...tags
                                      ?.map<Widget>(
                                        (e) => UiKitTagWidget(
                                          title: e.title,
                                          icon: e.icon,
                                          showSpacing: tags?.indexOf(e) != 0,
                                        ),
                                      )
                                      .toList() ??
                                  [],
                            ],
                          ),
                        ),
                      ),
                    SpacingFoundation.verticalSpace2,
                    if (periodFrom != null && periodTo != null)
                      Text(
                        '${formatDateWithCustomPattern(
                          'dd.MM',
                          (periodFrom ?? DateTime.now()).toLocal(),
                        )} - ${formatDateWithCustomPattern(
                          'dd.MM.yyyy',
                          (periodTo ?? DateTime.now()).toLocal(),
                        )}',
                        style: theme?.regularTextTheme.caption4Regular.copyWith(color: ColorsFoundation.mutedText),
                      ),
                  ],
                ),
              ],
            ),
          ],
        );
      },
    );
  }
}
