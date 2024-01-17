import 'package:flutter/material.dart';
import 'package:shuffle_uikit/shuffle_uikit.dart';

class UiKitLeadingRadioTile extends StatelessWidget {
  final bool selected;
  final String title;
  final String? avatarLink;
  final List<UiKitTag> tags;
  final VoidCallback? onTap;

  const UiKitLeadingRadioTile({
    super.key,
    this.selected = false,
    required this.title,
    required this.avatarLink,
    this.tags = const [],
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
                  width: 0.33.sw,
                  height: 0.33.sw/1.7,
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
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: textTheme?.caption1Bold,
                    ),
                    SpacingFoundation.verticalSpace4,
                    SizedBox(
                        height: 10.h,
                        child: ListView.separated(
                            scrollDirection: Axis.horizontal,
                            shrinkWrap: true,
                            primary: false,
                            itemBuilder: (BuildContext context, int index) {
                              final tag = tags[index];
                              return UiKitTagWidget(title: tag.title, icon: tag.icon);
                            },
                            separatorBuilder: (_, __) => SpacingFoundation.horizontalSpace8,
                            itemCount: tags.length))
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
