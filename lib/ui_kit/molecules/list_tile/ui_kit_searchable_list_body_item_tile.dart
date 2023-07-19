import 'package:countries_flag/countries_flag.dart';
import 'package:flutter/material.dart';
import 'package:shuffle_uikit/shuffle_uikit.dart';

class UiKitSearchableListBodyItemTile extends StatelessWidget {
  final UiKitSearchableListBodyItem item;
  final VoidCallback? onTap;

  const UiKitSearchableListBodyItemTile({
    super.key,
    required this.item,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final flagWidth = 0.1.sw;
    final flagHeight = flagWidth * 0.625;

    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: onTap,
        child: Ink(
          height: flagHeight,
          child: Row(
            mainAxisSize: MainAxisSize.max,
            children: [
              if (item.leadingPath != null) ...[
                ClipRRect(
                  borderRadius: BorderRadiusFoundation.all24,
                  child: CountriesFlag(
                    item.leadingPath!,
                    width: flagWidth,
                    height: flagHeight,
                  ),
                ),
                SpacingFoundation.horizontalSpace8,
              ],
              Expanded(
                child: Text(
                  item.title,
                  style: context.uiKitTheme?.boldTextTheme.caption1Medium.copyWith(overflow: TextOverflow.ellipsis),
                ),
              ),
              SpacingFoundation.horizontalSpace12,
              if (item.trailingText != null)
                Text(
                  item.trailingText!,
                  style: context.uiKitTheme?.boldTextTheme.caption1Medium,
                ),
            ],
          ),
        ),
      ),
    );
  }
}
