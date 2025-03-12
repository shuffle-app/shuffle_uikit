import 'package:flutter/material.dart';
import 'package:shuffle_uikit/shuffle_uikit.dart';

class UiKitPopUpMenuButton extends StatelessWidget {
  final List<UiKitPopUpMenuButtonOption> options;
  final IconData asset;
  late final PopupMenuItemBuilder items;

  UiKitPopUpMenuButton({
    super.key,
    required this.options,
  }) : asset = ShuffleUiKitIcons.morevert {
    items = (context) => options
        .map(
          (option) => PopupMenuItem(
            value: option.value,
            onTap: option.onTap,
            child: Text(
              option.title,
              style: context.uiKitTheme?.boldTextTheme.caption2Bold.copyWith(
                color: option.textColor ?? Colors.black,
              ),
            ),
          ),
        )
        .toList();
  }

  UiKitPopUpMenuButton.optionWithIcon({
    super.key,
    required this.options,
  }) : asset = ShuffleUiKitIcons.morevert {
    final longestTitle = options.map((option) => option.title).fold(0, (i, v) => v.length > i ? v.length : i);
    final TextPainter painter = TextPainter(
        text: TextSpan(
            text: options.map((option) => option.title).firstWhere((e) => e.length == longestTitle),
            style: TextStyle(
              fontFamily: 'Unbounded',
              fontSize: 12.w,
              fontWeight: FontWeight.w500,
              // color: foregroundColor,
              package: 'shuffle_uikit',
            )),
        textDirection: TextDirection.ltr,
        maxLines: 1);
    painter.layout();
    final width = painter.width;

    items = (context) => options
        .map(
          (option) => PopupMenuItem(
            value: option.value,
            onTap: option.onTap,
            padding: EdgeInsets.zero,
            child: SizedBox(
                width: width + SpacingFoundation.horizontalSpacing24,
                child: Transform.translate(
                  offset: Offset(SpacingFoundation.horizontalSpacing20, 0),
                  child: Row(
                    // crossAxisAlignment: CrossAxisAlignment.stretch,
                    // mainAxisAlignment: MainAxisAlignment.s,
                    children: [
                      Expanded(
                          child: Text(
                        option.title,
                        style: context.uiKitTheme?.boldTextTheme.caption2Bold.copyWith(
                          color: option.textColor ?? Colors.black,
                        ),
                      )),
                      Icon(
                        option.icon,
                        size: 24,
                        color: option.iconColor ?? Colors.black,
                      ),
                    ],
                  ),
                )),
          ),
        )
        .toList();
  }

  UiKitPopUpMenuButton.custom({
    super.key,
    required List<Widget> children,
    required this.asset,
  }) : options = [] {
    items = (context) => children
        .map(
          (option) => PopupMenuItem(child: option),
        )
        .toList();
  }

  UiKitPopUpMenuButton.customMenu({
    super.key,
    required List<PopupMenuItem> children,
    required this.asset,
  }) : options = [] {
    items = (context) => children;
  }

  @override
  Widget build(BuildContext context) {
    final theme = context.uiKitTheme;

    return PopupMenuButton(
      position: PopupMenuPosition.under,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadiusFoundation.all16,
      ),
      shadowColor: theme?.colorScheme.primary.withOpacity(0.3),
      elevation: 10,
      icon: ImageWidget(
        iconData: asset,
        color: theme?.colorScheme.inversePrimary,
      ),
      itemBuilder: items,
    );
  }
}

class UiKitPopUpMenuButtonOption {
  final String title;
  final dynamic value;
  final Color? textColor;
  final VoidCallback? onTap;
  final IconData? icon;
  final Color? iconColor;

  const UiKitPopUpMenuButtonOption({
    required this.title,
    required this.value,
    this.textColor,
    this.onTap,
    this.icon,
    this.iconColor,
  });
}
