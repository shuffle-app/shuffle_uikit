import 'package:flutter/material.dart';
import 'package:shuffle_uikit/shuffle_uikit.dart';

class UiKitMenuItemTile extends StatelessWidget {
  final UiKitMenuItem item;
  final VoidCallback? onTap;

  const UiKitMenuItemTile({
    Key? key,
    required this.item,
    this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final boldTextTheme = context.uiKitTheme?.boldTextTheme;

    return Material(
      color: Colors.black,
      child: InkWell(
        onTap: () {
          onTap?.call();
          Navigator.pop(context);
        },
        child: Ink(
          decoration: const BoxDecoration(
            border: Border(
              top: BorderSide(color: ColorsFoundation.surface2, width: 1),
            ),
          ),
          child: Row(
            mainAxisSize: MainAxisSize.max,
            children: [
              if (item.iconPath != null) ...[
                ImageWidget(
                  link: item.iconPath!,
                  height: 0.0625.sw,
                  width: 0.0625.sw,
                  fit: BoxFit.cover,
                ),
                SpacingFoundation.horizontalSpace8,
              ],
              Expanded(
                child: Text(
                  item.title.toUpperCase(),
                  style: boldTextTheme?.caption1UpperCaseMedium.copyWith(color: Colors.white),
                ),
              ),
            ],
          ).paddingSymmetric(
            horizontal: EdgeInsetsFoundation.horizontal16,
            vertical: EdgeInsetsFoundation.vertical16,
          ),
        ),
      ),
    );
  }
}

class UiKitMenuItemTileModel<T> {
  final String title;
  final Widget? icon;
  final T value;

  UiKitMenuItemTileModel({
    required this.title,
    required this.value,
    this.icon,
  });
}
