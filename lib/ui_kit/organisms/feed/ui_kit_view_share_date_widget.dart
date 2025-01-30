import 'package:flutter/cupertino.dart';
import 'package:intl/intl.dart';
import 'package:shuffle_uikit/shuffle_uikit.dart';

class UiKitViewShareDateWidget extends StatelessWidget {
  final ViewShareDate viewShareDate;

  const UiKitViewShareDateWidget({
    super.key,
    required this.viewShareDate,
  });

  @override
  Widget build(BuildContext context) {
    final regularTextTheme = context.uiKitTheme?.regularTextTheme;

    return Row(
      children: [
        if (viewShareDate.createdAt != null) ...[
          Text(
            DateFormat('dd MMM yyyy').format(viewShareDate.createdAt!),
            style: regularTextTheme?.caption4.copyWith(color: ColorsFoundation.mutedText),
          ),
          SpacingFoundation.horizontalSpace12,
          Text(
            DateFormat('HH:MM').format(viewShareDate.createdAt!),
            style: regularTextTheme?.caption4.copyWith(color: ColorsFoundation.mutedText),
          )
        ],
        Spacer(),
        if (viewShareDate.viewCount != null && viewShareDate.viewCount! > 0) ...[
          ImageWidget(
            iconData: ShuffleUiKitIcons.view,
            color: ColorsFoundation.mutedText,
            height: 0.040625.sw,
            width: 0.040625.sw,
            fit: BoxFit.cover,
          ),
          SpacingFoundation.horizontalSpace4,
          Text(
            '${viewShareDate.viewCount}',
            style: regularTextTheme?.caption4.copyWith(color: ColorsFoundation.mutedText),
          ),
        ],
        if (viewShareDate.shareCount != null && viewShareDate.shareCount! > 0) ...[
          SpacingFoundation.horizontalSpace8,
          ImageWidget(
            iconData: ShuffleUiKitIcons.share,
            color: ColorsFoundation.mutedText,
            height: 0.040625.sw,
            width: 0.040625.sw,
            fit: BoxFit.cover,
          ),
          SpacingFoundation.horizontalSpace4,
          Text(
            '${viewShareDate.shareCount}',
            style: regularTextTheme?.caption4.copyWith(color: ColorsFoundation.mutedText),
          ),
        ],
      ],
    );
  }
}
