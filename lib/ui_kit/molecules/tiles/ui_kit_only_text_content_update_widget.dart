import 'package:flutter/material.dart';
import 'package:shuffle_uikit/shuffle_uikit.dart';

class UiKitOnlyTextContentUpdateWidget extends UiKitContentUpdateWidget {
  final IconData updateIcon;
  final Widget titleTrailing;
  final String text;

  @override
  double get height => 0.8.sw * 0.171875;

  const UiKitOnlyTextContentUpdateWidget({
    Key? key,
    required this.updateIcon,
    required this.titleTrailing,
    required this.text,
    required super.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final boldTextTheme = context.uiKitTheme?.boldTextTheme;
    final regularTextTheme = context.uiKitTheme?.regularTextTheme;
    final colorScheme = context.uiKitTheme?.colorScheme;

    return SizedBox(
      width: 1.sw,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Row(
            mainAxisSize: MainAxisSize.max,
            children: [
              Text(
                title!,
                style: boldTextTheme?.caption3Medium,
              ),
              SpacingFoundation.horizontalSpace4,
              ImageWidget(
                iconData: updateIcon,
                height: 0.040625.sw,
                width: 0.040625.sw,
                fit: BoxFit.cover,
                color: colorScheme?.inverseSurface,
              ),
              SpacingFoundation.horizontalSpace4,
              Expanded(child: titleTrailing),
            ],
          ),
          SpacingFoundation.verticalSpace2,
          Text(
            text,
            style: regularTextTheme?.caption3.copyWith(overflow: TextOverflow.ellipsis),
            maxLines: 2,
          ),
        ],
      ),
    );
  }
}
