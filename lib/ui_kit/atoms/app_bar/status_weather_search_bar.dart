import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:shuffle_uikit/shuffle_uikit.dart';

class StatusWeatherSearchBar extends StatelessWidget {
  final VoidCallback? onSearchPressed;
  final RichText? weather;

  const StatusWeatherSearchBar({super.key, this.onSearchPressed, this.weather});

  @override
  Widget build(BuildContext context) {
    final theme = context.uiKitTheme;
    final todayDate = DateFormat('dd.MM.yyyy').format(DateTime.now());
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          todayDate,
          style: theme?.regularTextTheme.caption4Semibold.copyWith(color: theme.colorScheme.grayForegroundColor),
        ),
        if (weather != null) weather!,
        SpacingFoundation.horizontalSpace4,
        context.iconButtonNoPadding(
            data: BaseUiKitButtonData(
                onPressed: onSearchPressed,
                iconInfo: BaseUiKitButtonIconData(
                    iconData: ShuffleUiKitIcons.search, color: theme?.colorScheme.inversePrimary)))
      ],
    );
  }
}
