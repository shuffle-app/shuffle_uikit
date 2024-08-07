import 'package:flutter/material.dart';
import 'package:shuffle_uikit/shuffle_uikit.dart';

class UiKitRankedTitledBoard extends StatelessWidget {
  final String title;
  final List<String> rankItems;

  const UiKitRankedTitledBoard({Key? key, required this.title, required this.rankItems}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final boldTextTheme = context.uiKitTheme?.boldTextTheme;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: boldTextTheme?.caption2Medium.copyWith(color: ColorsFoundation.mutedText),
        ),
        SpacingFoundation.verticalSpace2,
        ...rankItems.map<Widget>((item) {
          final rank = rankItems.indexOf(item) + 1;

          return Row(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                flex: 2,
                child: Text(
                  '#$rank',
                  style: boldTextTheme?.body,
                ),
              ),
              Expanded(
                flex: 12,
                child: Text(
                  item,
                  style: boldTextTheme?.body,
                ),
              ),
            ],
          ).paddingOnly(bottom: EdgeInsetsFoundation.vertical2);
        }),
      ],
    );

    return RichText(
      text: TextSpan(
        text: title,
        style: boldTextTheme?.caption2Medium.copyWith(color: ColorsFoundation.mutedText),
        children: rankItems.map<InlineSpan>(
          (item) {
            final rank = rankItems.indexOf(item) + 1;

            return TextSpan(
              text: '\n#$rank $item',
              style: boldTextTheme?.body,
            );
          },
        ).toList(),
      ),
    );
  }
}
