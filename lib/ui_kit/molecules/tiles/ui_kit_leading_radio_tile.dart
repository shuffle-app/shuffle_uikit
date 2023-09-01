import 'package:flutter/material.dart';
import 'package:shuffle_uikit/shuffle_uikit.dart';

class UiKitLeadingRadioTile extends StatelessWidget {
  final bool selected;
  final String title;
  final String? avatarLink;
  final List<UiKitTag>? tags;
  final VoidCallback? onTap;

  const UiKitLeadingRadioTile({
    super.key,
    this.selected = false,
    required this.title,
    required this.avatarLink,
    required this.tags,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final textTheme = context.uiKitTheme?.boldTextTheme;

    return Material(
      color: Colors.transparent,
      borderRadius: BorderRadius.zero,
      child: InkWell(
        borderRadius: BorderRadiusFoundation.all16,
        onTap: onTap,
        child: Ink(
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              UiKitRadio(
                selected: selected,
              ),
              SpacingFoundation.horizontalSpace12,
              ClipRRect(
                borderRadius: BorderRadiusFoundation.all16,
                child: ImageWidget(
                  link: avatarLink,
                  fit: BoxFit.cover,
                ),
              ),
              SpacingFoundation.horizontalSpace12,
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: textTheme?.caption1Bold,
                    ),
                    SpacingFoundation.verticalSpace4,
                    Wrap(
                      spacing: 8,
                      runSpacing: 8,
                      children: tags
                              ?.map<Widget>((e) => UiKitTagWidget(title: e.title, icon: e.iconPath))
                              .toList() ??
                          [],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
