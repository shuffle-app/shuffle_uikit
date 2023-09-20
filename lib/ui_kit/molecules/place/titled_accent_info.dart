import 'package:flutter/material.dart';
import 'package:shuffle_uikit/shuffle_uikit.dart';

class TitledAccentInfo extends StatelessWidget {
  final String title;
  final String info;
  final bool? showFullInfo;

  const TitledAccentInfo({
    Key? key,
    required this.title,
    required this.info,
    this.showFullInfo,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final titleStyle = context.uiKitTheme?.boldTextTheme.caption1Medium.copyWith(
      color: ColorsFoundation.darkNeutral900,
    );
    final infoStyle = context.uiKitTheme?.boldTextTheme.title2;

    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Text(
          title,
          style: titleStyle,
        ),
        Text(
          info,
          maxLines: showFullInfo ?? false ? null : 2,
          style: infoStyle,
        ),
      ],
    );
  }
}
