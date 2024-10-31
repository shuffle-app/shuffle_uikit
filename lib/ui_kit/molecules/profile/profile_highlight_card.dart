import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:shuffle_uikit/shuffle_uikit.dart';

class ProfileHighlightCard extends StatelessWidget {
  final String title;
  final String value;
  final Gradient? valueGradient;

  const ProfileHighlightCard({
    super.key,
    required this.title,
    required this.value,
    this.valueGradient,
  });

  @override
  Widget build(BuildContext context) {
    final textTheme = context.uiKitTheme?.boldTextTheme;
    TextStyle? valueStyle = textTheme?.title2;
    TextStyle? titleStyle = textTheme?.body;
    titleStyle = titleStyle?.copyWith(color: ColorsFoundation.darkNeutral100);

    return UiKitCardWrapper(
      height: 1.sw/3.55,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          GradientableWidget(
              gradient: valueGradient,
              child:
          Text(
            value,
            style: valueStyle,
            textAlign: TextAlign.center,
          )),
          SpacingFoundation.verticalSpace12,
          AutoSizeText(
            title,
            maxLines: 2,
            group: _group,
            style: titleStyle?.copyWith(
              color: context.uiKitTheme?.colorScheme.grayForegroundColor,
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ).paddingAll(EdgeInsetsFoundation.all16),
    );
  }
}

final AutoSizeGroup _group = AutoSizeGroup();