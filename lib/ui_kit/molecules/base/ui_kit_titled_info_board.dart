import 'package:flutter/material.dart';
import 'package:shuffle_uikit/shuffle_uikit.dart';

class UiKitVerticalTitledInfoBoard extends StatelessWidget {
  final String title;
  final List<TitledInfoModel> infoList;

  const UiKitVerticalTitledInfoBoard({
    Key? key,
    required this.title,
    required this.infoList,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final boldTextTheme = context.uiKitTheme?.boldTextTheme;
    final regularTextTheme = context.uiKitTheme?.regularTextTheme;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Text(
          title,
          style: boldTextTheme?.caption2Medium.copyWith(color: ColorsFoundation.mutedText),
        ),
        SpacingFoundation.verticalSpace4,
        ...infoList.map(
          (infoModel) => Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.max,
            children: [
              Expanded(
                flex: 3,
                child: Text(
                  infoModel.title,
                  style: regularTextTheme?.labelSmall.copyWith(color: ColorsFoundation.mutedText),
                ),
              ),
              Expanded(
                flex: 7,
                child: Text(
                  infoModel.info,
                  style: boldTextTheme?.caption1Medium,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
