import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:shuffle_uikit/shuffle_uikit.dart';

class UiKitSwiperCardInfo extends StatelessWidget {
  final String title;
  final String subtitle;
  final List<UiKitTagWidget> tags;
  final ScrollController? scrollController;

  const UiKitSwiperCardInfo({
    super.key,
    required this.title,
    required this.subtitle,
    required this.tags,
    this.scrollController,
  });

  @override
  Widget build(BuildContext context) {
    final textTheme = context.uiKitTheme?.boldTextTheme;
    final titleStyle = textTheme?.body.copyWith(color: Colors.white);
    final subtitleStyle = textTheme?.caption1Medium.copyWith(color: Colors.white);

    return RepaintBoundary(
      child: ClipRRect(
        borderRadius: BorderRadiusFoundation.all20,
        child: ColoredBox(
          color: ColorsFoundation.darkNeutral500.withOpacity(0.16),
          child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 8, sigmaY: 8),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Text(
                  title,
                  maxLines: 1,
                  style: titleStyle,
                ),
                Text(
                  subtitle,
                  maxLines: 2,
                  style: subtitleStyle,
                ),
                SpacingFoundation.verticalSpace4,
                SizedBox(
                    height: SpacingFoundation.horizontalSpacing16 + 2,
                    child: ListView.separated(
                      primary: false,
                      scrollDirection: Axis.horizontal,
                      padding: EdgeInsets.zero,
                      clipBehavior: Clip.hardEdge,
                      controller: scrollController,
                      // child: Wrap(
                      //   spacing: ,
                      itemBuilder: (context, index) => tags[index],
                      separatorBuilder: (context, index) => SpacingFoundation.horizontalSpace8,
                      itemCount: tags.length,
                    )),
                // ),
              ],
            ).paddingAll(EdgeInsetsFoundation.all12),
          ),
        ),
      ),
    );
  }
}
