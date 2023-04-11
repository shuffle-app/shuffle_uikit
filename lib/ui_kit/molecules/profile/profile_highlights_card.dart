import 'package:flutter/material.dart';
import 'package:shuffle_uikit/shuffle_uikit.dart';
import 'package:shuffle_uikit/ui_kit/consts.dart';

class ProfileHighlightCard extends StatelessWidget {
  final String title;
  final int value;

  const ProfileHighlightCard({
    Key? key,
    required this.title,
    required this.value,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Builder(
      builder: (context) {
        final width = MediaQuery.of(context).size.width;
        final textTheme = Theme.of(context).extension<UiKitThemeData>()?.boldTextTheme;
        TextStyle? valueStyle;
        TextStyle? titleStyle;
        if (width <= kSmallestScreen) {
          valueStyle = textTheme?.title2;
          titleStyle = textTheme?.caption2;
        } else if (width > kSmallestScreen && width <= kSmallScreen) {
          titleStyle = textTheme?.caption1;
          valueStyle = textTheme?.title2;
        } else {
          valueStyle = textTheme?.title2;
          titleStyle = textTheme?.body;
        }
        titleStyle = titleStyle?.copyWith(color: ColorsFoundation.inputLabelGrey);
        return CardWrapper(
          height: 106,
          padding: EdgeInsetsFoundation.all16,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                '${value > 1000 ? '${value ~/ 1000}k+' : value}',
                style: valueStyle,
                textAlign: TextAlign.center,
              ),
              SpacingFoundation.verticalSpace12,
              Text(
                title,
                style: titleStyle,
                textAlign: TextAlign.center,
              ),
            ],
          ),
        );
      },
    );
  }
}
