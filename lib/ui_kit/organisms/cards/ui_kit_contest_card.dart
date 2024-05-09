import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:shuffle_uikit/shuffle_uikit.dart';

class UiKitContestCard extends StatelessWidget {
  final String icon;
  final String contestTitle;
  final String contestDescription;
  final String? contentImage;
  final String? contentTitle;
  final DateTime? contestDate;
  final List<UiKitTag> contentProperties;
  final String? contentDescription;
  final VoidCallback? onSeeMore;

  const UiKitContestCard({
    Key? key,
    required this.icon,
    required this.contestTitle,
    required this.contestDescription,
    this.contentImage,
    this.contentTitle,
    this.contestDate,
    required this.contentProperties,
    this.contentDescription,
    this.onSeeMore,
  }) : super(key: key);

  double get contestIconSize => 0.1.sw;

  double get contentImageWidth => 0.28125.sw;

  double get contentImageHeight => contentImageWidth * 1.875;

  @override
  Widget build(BuildContext context) {
    final boldTextTheme = context.uiKitTheme?.boldTextTheme;
    final regularTextTheme = context.uiKitTheme?.regularTextTheme;

    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Row(
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ImageWidget(
              link: icon,
              width: contestIconSize,
              height: contestIconSize,
            ),
            SpacingFoundation.horizontalSpace4,
            Expanded(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  GradientableWidget(
                    gradient: GradientFoundation.defaultLinearGradient,
                    child: Text(
                      contestTitle,
                      style: boldTextTheme?.caption2Bold.copyWith(color: Colors.white),
                    ),
                  ),
                  Text(
                    contestDescription,
                    style: regularTextTheme?.caption2,
                  ),
                ],
              ),
            ),
          ],
        ),
        SpacingFoundation.verticalSpace16,
        Row(
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            UiKitReactionPreview(
              imagePath: contentImage ?? '',
              customHeight: contentImageHeight,
              customWidth: contentImageWidth,
            ),
            SpacingFoundation.horizontalSpace12,
            Expanded(
              child: Column(
                mainAxisSize: MainAxisSize.max,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Text(
                    contentTitle ?? '',
                    style: boldTextTheme?.caption1Bold,
                  ),
                  if (contestDate != null)
                    Text(
                      '${DateFormat('MMM dd, h', Localizations.localeOf(context).languageCode).format(contestDate!)} ${DateFormat('a', Localizations.localeOf(context).languageCode).format(contestDate!).toLowerCase()}',
                      style: regularTextTheme?.caption4Regular,
                    ),
                  SpacingFoundation.verticalSpace12,
                  UiKitTagsWidget(baseTags: contentProperties),
                  SpacingFoundation.verticalSpace8,
                  Text(
                    contentDescription ?? '',
                    style: boldTextTheme?.caption1Medium,
                    maxLines: 4,
                    overflow: TextOverflow.ellipsis,
                  ),
                  if (onSeeMore != null)
                    Align(
                      alignment: Alignment.bottomRight,
                      child: TextButton(
                        onPressed: onSeeMore,
                        child: Text(
                          S.current.SeeMore,
                          style: boldTextTheme?.caption1Bold.copyWith(color: ColorsFoundation.darkNeutral300),
                        ),
                      ),
                    ),
                ],
              ),
            ),
          ],
        )
      ],
    );
  }
}
