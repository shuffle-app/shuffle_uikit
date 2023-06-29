import 'package:flutter/material.dart';
import 'package:shuffle_uikit/shuffle_uikit.dart';

class UiKitPopUpMenuButton extends StatelessWidget {
  final List<UiKitPopUpMenuButtonOption> options;

  const UiKitPopUpMenuButton({
    super.key,
    required this.options,
  });

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
        svgAsset: GraphicsFoundation.instance.svg.moreVert,
        color: Colors.white,
      ),
      itemBuilder: (context) => options
          .map(
            (option) => PopupMenuItem(
              value: option.value,
              onTap: option.onTap,
              child: Text(
                option.title,
                style: context.uiKitTheme?.boldTextTheme.caption2Bold.copyWith(color: Colors.black),
              ),
            ),
          )
          .toList(),
    );
  }
}

class UiKitPopUpMenuButtonOption {
  final String title;
  final dynamic value;
  final VoidCallback? onTap;

  const UiKitPopUpMenuButtonOption({
    required this.title,
    required this.value,
    this.onTap,
  });
}
