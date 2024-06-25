import 'package:flutter/material.dart';
import 'package:shuffle_uikit/shuffle_uikit.dart';

class UiKitInlineButton extends StatelessWidget {
  final BaseUiKitButtonData data;

  const UiKitInlineButton({
    super.key,
    required this.data,
  });

  @override
  Widget build(BuildContext context) {
    final colorScheme = context.uiKitTheme?.colorScheme;
    final textStyle = context.uiKitTheme?.boldTextTheme;

    return GestureDetector(
      onTap: data.onPressed,
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          data.iconWidget ??
              ImageWidget(
                iconData: data.iconInfo?.iconData,
                link: data.iconInfo?.iconPath,
                color: data.iconInfo?.color ?? colorScheme?.inverseSurface,
                height: data.iconInfo?.size,
                fit: BoxFit.fitHeight,
              ),
          SpacingFoundation.horizontalSpace12,
          Expanded(
            child: Text(
              data.text ?? '',
              style: textStyle?.title2.copyWith(
                overflow: TextOverflow.ellipsis,
                color: data.textColor ?? colorScheme?.inverseSurface,
              ),
            ),
          )
        ],
      ),
    );
  }
}
