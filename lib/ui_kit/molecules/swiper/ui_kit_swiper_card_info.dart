import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:shuffle_uikit/shuffle_uikit.dart';

class UiKitSwiperCardInfo extends StatelessWidget {
  final String title;
  final String subtitle;
  final List<UiKitTagWidget> tags;
  final bool? isOpen;

  const UiKitSwiperCardInfo({
    super.key,
    required this.title,
    required this.subtitle,
    required this.tags,
    this.isOpen,
  });

  @override
  Widget build(BuildContext context) {
    final textTheme = context.uiKitTheme?.boldTextTheme;
    final titleStyle = textTheme?.body.copyWith(color: Colors.white);
    final subtitleStyle = textTheme?.caption1Medium.copyWith(color: Colors.white);

    return Container(
      clipBehavior: Clip.hardEdge,
      decoration: BoxDecoration(
        borderRadius: BorderRadiusFoundation.all20,
        color: ColorsFoundation.darkNeutral500.withOpacity(0.16),
      ),
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
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
            Row(
              children: [
                Expanded(
                  child: SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Wrap(
                      spacing: SpacingFoundation.horizontalSpacing8,
                      children: tags,
                    ),
                  ),
                ),
                if (isOpen != null && isOpen!)
                  UiKitTagWidget(title: 'open', icon: GraphicsFoundation.instance.svg.clock.path),
                if (isOpen != null && !isOpen!)
                  UiKitTagWidget(title: 'closed', icon: GraphicsFoundation.instance.svg.clock.path),
              ],
            ),
          ],
        ).paddingAll(EdgeInsetsFoundation.all12),
      ),
    );
  }
}
