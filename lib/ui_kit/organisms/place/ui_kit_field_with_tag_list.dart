import 'package:flutter/cupertino.dart';
import 'package:shuffle_uikit/shuffle_uikit.dart';

class UiKitFieldWithTagList extends StatelessWidget {
  final List<UiKitTag>? listUiKitTags;
  final String title;
  final Function() onTap;
  const UiKitFieldWithTagList({
    super.key,
    required this.listUiKitTags,
    required this.title,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Row(
          children: [
            Expanded(
              child: Text(
                title,
                style: context.uiKitTheme?.regularTextTheme.labelSmall,
              ),
            ),
            context.smallOutlinedButton(
              data: BaseUiKitButtonData(
                onPressed: onTap,
                iconInfo: BaseUiKitButtonIconData(
                  iconData: CupertinoIcons.chevron_forward,
                  size: 16.h,
                ),
              ),
            )
          ],
        ),
        listUiKitTags != null && listUiKitTags!.isNotEmpty
            ? UiKitTagsWidget(baseTags: listUiKitTags!).paddingOnly(top: SpacingFoundation.verticalSpacing8)
            : SpacingFoundation.none,
      ],
    );
  }
}
