import 'package:flutter/material.dart';
import 'package:shuffle_uikit/shuffle_uikit.dart';

class UiKitPopUpMenuButton extends StatelessWidget {
  final List<UiKitPopUpMenuButtonOption> options;
  final SvgGenImage asset;

  UiKitPopUpMenuButton({
    super.key,
    required this.options,
  }) : asset = GraphicsFoundation.instance.svg.moreVert {
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

  late final PopupMenuItemBuilder items;

  @override
  Widget build(BuildContext context) {
    return PopupMenuButton(
      position: PopupMenuPosition.under,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadiusFoundation.all16,
      ),
      shadowColor: Colors.black.withOpacity(0.3),
      elevation: 10,
      icon: ImageWidget(
        svgAsset: asset,
        color: Colors.white,
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

  const UiKitPopUpMenuButtonOption({
    required this.title,
    required this.value,
    this.textColor,
    this.onTap,
  });
}
