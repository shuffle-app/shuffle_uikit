import 'package:flutter/material.dart';
import 'package:shuffle_uikit/shuffle_uikit.dart';

class UiKitPopUpMenuTile extends StatelessWidget {
  final String title;
  final String? subtitle;
  final Widget? titleIcon;
  final Widget? leading;
  final List<UiKitPopUpMenuButtonOption>? menuOptions;

  const UiKitPopUpMenuTile({
    super.key,
    required this.title,
    this.subtitle,
    this.titleIcon,
    this.leading,
    this.menuOptions,
  });

  @override
  Widget build(BuildContext context) {
    final textTheme = context.uiKitTheme?.boldTextTheme;

    return UiKitHeaderWithLeading(
      title: title,
      titleIcon: titleIcon,
      titleStyle: textTheme?.caption1Medium,
      subtitle: subtitle,
      subtitleStyle: textTheme?.caption1Bold.copyWith(
        color: ColorsFoundation.darkNeutral900,
      ),
      leading: leading,
      trailing: menuOptions == null ? const SizedBox.shrink() : UiKitPopUpMenuButton(options: menuOptions!),
    );
  }
}
